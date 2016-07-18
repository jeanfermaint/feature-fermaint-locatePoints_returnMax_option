/*
 * Copyright (c) 2015, Lawrence Livermore National Security, LLC.
 * Produced at the Lawrence Livermore National Laboratory.
 *
 * All rights reserved.
 *
 * This source code cannot be distributed without permission and
 * further review from Lawrence Livermore National Laboratory.
 */

/*!
 ******************************************************************************
 *
 * \file
 *
 * \brief   Implementation file for IOManager class.
 *
 ******************************************************************************
 */

// Associated header file
#include "IOManager.hpp"

#include "hdf5.h"

// Other toolkit component headers
#include "common/CommonTypes.hpp"

// SiDRe project headers
#include "sidre/DataGroup.hpp"
#include "sidre/DataStore.hpp"
#include "sidre/SidreTypes.hpp"

#include "fmt/fmt.hpp"

namespace asctoolkit
{
namespace spio
{


/*
 *************************************************************************
 *
 * Create manager
 *
 *************************************************************************
 */
IOManager::IOManager(MPI_Comm comm)
: m_comm_size(1),
  m_my_rank(0),
  m_baton(ATK_NULLPTR),
  m_mpi_comm(comm)
{
  MPI_Comm_size(comm, &m_comm_size);
  MPI_Comm_rank(comm, &m_my_rank);
}


/*
 *************************************************************************
 *
 * Destroy all contents
 *
 *************************************************************************
 */
IOManager::~IOManager()
{
  if (m_baton) {
    delete m_baton;
  }
}


/*
 *************************************************************************
 *
 * Write to file.
 *
 *************************************************************************
 */
void IOManager::write(sidre::DataGroup * datagroup, int num_files, const std::string& file_string, const std::string& protocol)
{
  if (m_baton) {
    if (m_baton->getNumFiles() != num_files) {
      delete m_baton;
      m_baton = ATK_NULLPTR;
    }
  }
 
  if (!m_baton) {
    m_baton = new IOBaton(m_mpi_comm, num_files);
  }

  std::ostringstream rootstream;
  rootstream << file_string << ".root";
  std::string root_name = rootstream.str();

  if (m_my_rank == 0 && protocol == "conduit_hdf5") {
     createRootFile(root_name, file_string, num_files);
  }
  MPI_Barrier(m_mpi_comm);
  int group_id = m_baton->wait();

  std::string file_name = fmt::sprintf("%s_%07d", file_string, group_id);

  if (protocol == "conduit_hdf5") {

    hid_t root_file_id = H5Fopen(root_name.c_str(),
                                 H5F_ACC_RDWR,
                                 H5P_DEFAULT);

    SLIC_ASSERT(root_file_id >= 0);

    herr_t status;

    std::string hdf5_name = getHDF5FileName(root_name, root_file_id, group_id);

    hid_t h5_file_id, h5_group_id;
    if (m_baton->isFirstInGroup()) {
      h5_file_id = H5Fcreate(hdf5_name.c_str(),
                             H5F_ACC_TRUNC,
                             H5P_DEFAULT,
                             H5P_DEFAULT);
    } else {
      h5_file_id = H5Fopen(hdf5_name.c_str(),
                           H5F_ACC_RDWR,
                           H5P_DEFAULT);
    }
    SLIC_ASSERT(h5_file_id >= 0);

    std::string group_name = fmt::sprintf("datagroup_%07d", m_my_rank);
    h5_group_id = H5Gcreate(h5_file_id,
                            group_name.c_str(),
                            H5P_DEFAULT,
                            H5P_DEFAULT,
                            H5P_DEFAULT);
    SLIC_ASSERT(h5_group_id >= 0);

    datagroup->getDataStore()->save(h5_group_id, datagroup);

    status = H5Gclose(h5_group_id);
    SLIC_ASSERT(status >= 0);
    status = H5Fclose(h5_file_id);
    SLIC_ASSERT(status >= 0);

    status = H5Fclose(root_file_id);
    SLIC_ASSERT(status >= 0);


  } else if (protocol == "conduit") {
    std::ostringstream savestream;
    savestream << file_name << ".group";
    std::string obase = savestream.str();
    datagroup->getDataStore()->save(obase, protocol, datagroup);
  }
  (void)m_baton->pass();
}

/*
 *************************************************************************
 *
 * Read from files
 *
 *************************************************************************
 */
void IOManager::read(
  sidre::DataGroup * datagroup,
  const std::string& file_string,
  const std::string& protocol)
{
  int group_id = m_baton->wait();
  std::ostringstream namestream;
  namestream << file_string << "_" <<  group_id;
  std::string file_name = namestream.str();
  if (protocol == "conduit_hdf5") {

    std::ostringstream rootstream;
    rootstream << file_string << ".root";
    std::string root_name = rootstream.str();

    hid_t root_file_id = H5Fopen(root_name.c_str(),
                                 H5F_ACC_RDWR,
                                 H5P_DEFAULT);
    SLIC_ASSERT(root_file_id >= 0);

    herr_t errv;

    std::string hdf5_name = getHDF5FileName(root_name, root_file_id, group_id);

    hid_t h5_file_id = H5Fopen(hdf5_name.c_str(),
                               H5F_ACC_RDONLY,
                               H5P_DEFAULT);
    SLIC_ASSERT(h5_file_id >= 0);

    // TODO Add HDF5 call to change hdf5 internal directory to loadstream name.
    std::string group_name = fmt::sprintf("datagroup_%07d", m_my_rank);
    hid_t h5_group_id = H5Gopen(h5_file_id, group_name.c_str(), 0);
    SLIC_ASSERT(h5_file_id >= 0);
    datagroup->getDataStore()->load(h5_group_id, datagroup);

    errv = H5Fclose(h5_file_id);
    SLIC_ASSERT(errv >= 0);

    errv = H5Fclose(root_file_id);
    SLIC_ASSERT(errv >= 0);

  } else {
    std::ostringstream loadstream;
    loadstream << file_name << ".group";
    std::string obase = loadstream.str();
    datagroup->getDataStore()->load(obase, protocol, datagroup);
  }

  (void)m_baton->pass();
}

/*
 *************************************************************************
 *
 * Read based on HDF5 root file.
 *
 *************************************************************************
 */
void IOManager::read(sidre::DataGroup * datagroup, const std::string& root_file)
{
  int num_files = getNumFilesFromRoot(root_file);
  SLIC_ASSERT(num_files > 0);

  if (m_baton) {
    if (m_baton->getNumFiles() != num_files) {
      delete m_baton;
      m_baton = ATK_NULLPTR;
    }
  }
    
  if (!m_baton) {
    m_baton = new IOBaton(m_mpi_comm, num_files);
  }

  int group_id = m_baton->wait();

  hid_t root_file_id = H5Fopen(root_file.c_str(),
                               H5F_ACC_RDWR,
                               H5P_DEFAULT);

  SLIC_ASSERT(root_file_id >= 0);

  herr_t errv;

  std::string hdf5_name = getHDF5FileName(root_file, root_file_id, group_id);

  hid_t h5_file_id = H5Fopen(hdf5_name.c_str(),
                             H5F_ACC_RDONLY,
                             H5P_DEFAULT);
  SLIC_ASSERT(h5_file_id >= 0);

  std::string group_name = fmt::sprintf("datagroup_%07d", m_my_rank);
  hid_t h5_group_id = H5Gopen(h5_file_id, group_name.c_str(), 0);
  SLIC_ASSERT(h5_group_id >= 0);

  datagroup->getDataStore()->load(h5_group_id, datagroup);

  errv = H5Fclose(h5_file_id);
  SLIC_ASSERT(errv >= 0);

  errv = H5Fclose(root_file_id);
  SLIC_ASSERT(errv >= 0);

  (void)m_baton->pass();
}


void IOManager::loadExternalData(sidre::DataGroup * datagroup, const std::string& root_file)
{
  int num_files = getNumFilesFromRoot(root_file);
  SLIC_ASSERT(num_files > 0);

  if (m_baton) {
    if (m_baton->getNumFiles() != num_files) {
      delete m_baton;
      m_baton = ATK_NULLPTR;
    }
  }

  if (!m_baton) {
    m_baton = new IOBaton(m_mpi_comm, num_files);
  }

  int group_id = m_baton->wait();

  hid_t root_file_id = H5Fopen(root_file.c_str(),
                               H5F_ACC_RDWR,
                               H5P_DEFAULT);

  SLIC_ASSERT(root_file_id >= 0);

  herr_t errv;

  std::string hdf5_name = getHDF5FileName(root_file, root_file_id, group_id);

  hid_t h5_file_id = H5Fopen(hdf5_name.c_str(),
                             H5F_ACC_RDONLY,
                             H5P_DEFAULT);
  SLIC_ASSERT(h5_file_id >= 0);

  std::string group_name = fmt::sprintf("datagroup_%07d", m_my_rank);
  hid_t h5_group_id = H5Gopen(h5_file_id, group_name.c_str(), 0);
  SLIC_ASSERT(h5_group_id >= 0);

  datagroup->getDataStore()->loadExternalData(h5_group_id, datagroup);

  errv = H5Fclose(h5_file_id);
  SLIC_ASSERT(errv >= 0);

  errv = H5Fclose(root_file_id);
  SLIC_ASSERT(errv >= 0);

  (void)m_baton->pass();
}

/*
 *************************************************************************
 *
 * Create a root file. 
 *
 *************************************************************************
 */
void IOManager::createRootFile(const std::string& root_name,
                               const std::string& file_base,
                               int num_files)
{
  hid_t root_file_id;

  root_file_id = H5Fcreate(root_name.c_str(),
                           H5F_ACC_TRUNC,
                           H5P_DEFAULT,
                           H5P_DEFAULT);
  SLIC_ASSERT(root_file_id >= 0);

  hsize_t dim[] = { 1 };
  hid_t int_space = H5Screate_simple(1, dim, 0);
  SLIC_ASSERT(int_space >= 0);

  hid_t filesset = H5Dcreate(root_file_id, "number_of_files", H5T_NATIVE_INT,
    int_space, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
  SLIC_ASSERT(filesset >= 0);

  herr_t errv = H5Dwrite(filesset, H5T_NATIVE_INT, H5S_ALL, H5S_ALL,
    H5P_DEFAULT, &num_files);
  SLIC_ASSERT(errv >= 0);

  hid_t ranksset = H5Dcreate(root_file_id, "number_of_domains", H5T_NATIVE_INT,
    int_space, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
  SLIC_ASSERT(ranksset >= 0);

  errv = H5Dwrite(ranksset, H5T_NATIVE_INT, H5S_ALL, H5S_ALL,
    H5P_DEFAULT, &m_comm_size);
  SLIC_ASSERT(errv >= 0);

  // If there is a full path given, get the name at the end of the path.
  std::string local_file_base;
  std::string next;
  std::string slash = "/";
  conduit::utils::rsplit_string(file_base, slash, local_file_base, next);
  SLIC_ASSERT(!local_file_base.empty());

  // Write the file pattern string 
  std::string file_pattern = local_file_base + "_" + "%07d.hdf5";

  hid_t fatype = H5Tcopy(H5T_C_S1);
  SLIC_ASSERT(fatype >= 0);

  errv = H5Tset_size(fatype, file_pattern.size()+1);
  SLIC_ASSERT(errv >= 0);

  errv = H5Tset_strpad(fatype, H5T_STR_NULLTERM);
  SLIC_ASSERT(errv >= 0);

  hid_t fspace = H5Screate_simple(1, dim, 0);
  SLIC_ASSERT(fspace >= 0);

  hid_t fdataset = H5Dcreate(root_file_id, "file_pattern",
    fatype, fspace, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
  SLIC_ASSERT(fdataset >= 0);

  errv = H5Dwrite(fdataset, fatype, H5S_ALL, H5S_ALL,
    H5P_DEFAULT, file_pattern.c_str());

  // Write the domain pattern string
  std::string domain_pattern =  "datagroup_%07d";

  hid_t datype = H5Tcopy(H5T_C_S1);
  SLIC_ASSERT(datype >= 0);

  errv = H5Tset_size(datype, domain_pattern.size()+1);
  SLIC_ASSERT(errv >= 0);

  errv = H5Tset_strpad(datype, H5T_STR_NULLTERM);
  SLIC_ASSERT(errv >= 0);

  hid_t dspace = H5Screate_simple(1, dim, 0);
  SLIC_ASSERT(dspace >= 0);

  hid_t ddataset = H5Dcreate(root_file_id, "domain_pattern",
    datype, dspace, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
  SLIC_ASSERT(ddataset >= 0);

  errv = H5Dwrite(ddataset, datype, H5S_ALL, H5S_ALL,
    H5P_DEFAULT, domain_pattern.c_str());

  errv = H5Fflush(root_file_id, H5F_SCOPE_LOCAL);
  SLIC_ASSERT(errv >= 0);
  errv = H5Fclose(root_file_id);
  SLIC_ASSERT(errv >= 0);

}

/*
 *************************************************************************
 *
 * Get file name for a file holding DataGroup data.
 *
 *************************************************************************
 */
std::string IOManager::getHDF5FileName(
  const std::string& root_name,
  hid_t root_file_id,
  int rankgroup_id)
{
  hid_t h5_pattern_id = H5Dopen(root_file_id, "file_pattern", H5P_DEFAULT);
  SLIC_ASSERT(h5_pattern_id >= 0);

  hid_t dtype = H5Dget_type(h5_pattern_id);
  SLIC_ASSERT(dtype >= 0);
  size_t dsize = H5Tget_size(dtype);

  char* h5_pattern_buf = new char[dsize];
  SLIC_ASSERT(h5_pattern_buf);
  herr_t errv = H5Dread(h5_pattern_id,
                        dtype,
                        H5S_ALL,
                        H5S_ALL,
                        H5P_DEFAULT,
                        h5_pattern_buf);
  SLIC_ASSERT(errv >= 0);

  std::string file_pattern(h5_pattern_buf);
  delete[] h5_pattern_buf;

  std::string hdf5_name = fmt::sprintf(file_pattern.c_str(), rankgroup_id);

  //If the root file was given as a path, find the directory and add it to
  //hdf5_name.
  std::string curr;
  std::string root_dir;
  std::string slash = "/";
  conduit::utils::rsplit_string(root_name, slash, curr, root_dir);

  if (!root_dir.empty()) {
    hdf5_name = root_dir + slash + hdf5_name;
  }

  return hdf5_name;

}

/*
 *************************************************************************
 *
 * Query the rootfile for the number of input files.
 *
 *************************************************************************
 */
int IOManager::getNumFilesFromRoot(const std::string& root_file)
{
  /*
   * Read num_files from rootfile on rank 0.
   */
  int read_num_files = 0;
  if (m_my_rank == 0) {

    hid_t root_file_id = H5Fopen(root_file.c_str(),
                                 H5F_ACC_RDWR,
                                 H5P_DEFAULT);

    SLIC_ASSERT(root_file_id >= 0);


    hid_t filesset = H5Dopen(root_file_id, "number_of_files", H5P_DEFAULT);
    SLIC_ASSERT(filesset >= 0);

    herr_t errv = H5Dread(filesset, H5T_NATIVE_INT, H5S_ALL, H5S_ALL,
      H5P_DEFAULT, &read_num_files);
    SLIC_ASSERT(errv >= 0);
    SLIC_ASSERT(read_num_files > 0);

    errv = H5Fclose(root_file_id);
    SLIC_ASSERT(errv >= 0);
  }

  /*
   * Reduction sets num_files on all ranks.
   */
  int num_files;
  MPI_Allreduce(&read_num_files, &num_files, 1, MPI_INT, MPI_SUM, m_mpi_comm);
  SLIC_ASSERT(num_files > 0);

  return num_files;
}

/*
 *************************************************************************
 *
 * Write a group to an existing root file
 *
 *************************************************************************
 */

void IOManager::writeGroupToRootFile(sidre::DataGroup * group,
                                     const std::string& file_name)
{
  MPI_Barrier(m_mpi_comm);
  if (m_my_rank == 0) {
    hid_t root_file_id = H5Fopen(file_name.c_str(),
                                 H5F_ACC_RDWR,
                                 H5P_DEFAULT);

    SLIC_ASSERT(root_file_id >= 0); 

    hid_t group_id = H5Gcreate2(root_file_id,
                                group->getName().c_str(),
                                H5P_DEFAULT,
                                H5P_DEFAULT,
                                H5P_DEFAULT);
    SLIC_ASSERT(group_id >= 0);

    conduit::Node data_holder;
    group->createNativeLayout(data_holder);

    conduit::relay::io::hdf5_write(data_holder, group_id);

    herr_t errv =  H5Fclose(root_file_id);
    SLIC_ASSERT(errv >= 0); 
  }
  MPI_Barrier(m_mpi_comm);
}





} /* end namespace spio */
} /* end namespace asctoolkit */
