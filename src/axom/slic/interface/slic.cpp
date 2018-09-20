/*
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Copyright (c) 2017-2018, Lawrence Livermore National Security, LLC.
 *
 * Produced at the Lawrence Livermore National Laboratory
 *
 * LLNL-CODE-741217
 *
 * All rights reserved.
 *
 * This file is part of Axom.
 *
 * For details about use and distribution, please read axom/LICENSE.
 *
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

#include "axom/slic/interface/slic.hpp"
#include "axom/slic/config.hpp"

#include <cstdlib>    // for free
#include <sstream>    // for std::ostringstream

#ifdef WIN32
  #define NOMINMAX
  #include <Windows.h>
  #include <WinBase.h>
  #include <DbgHelp.h>
#else
  #include <execinfo.h> // for backtrace()
#ifdef AXOM_SLIC_DEMANGLE_STACK_TRACE
  #include <cxxabi.h>   // for abi::__cxa_demangle
#endif
#endif

constexpr int MAX_FRAMES = 25;

namespace axom
{
namespace slic
{

namespace internal
{

#ifndef WIN32
#ifdef AXOM_SLIC_DEMANGLE_STACK_TRACE

//------------------------------------------------------------------------------
std::string demangle( char* backtraceString, int frame )
{
  char* mangledName = nullptr;
  char* functionOffset = nullptr; 
  char* returnOffset = nullptr;

#ifdef __APPLE__
  /* On apple machines the mangled function name always starts at the 58th 
   * character */
  constexpr in APPLE_OFFSET = 58;
  mangledName = backtraceString + APPLE_OFFSET;
  for ( char* p = backtraceString; *p ; ++p )
  {
    if ( *p == '+' )
    {
      functionOffset = p;
    }
    returnOffset = p;
  }
#else
  for ( char* p = backtraceString ; *p ; ++p )
  {
    if ( *p == '(' )
    {
      mangledName = p;
    }
    else if ( *p == '+' )
    {
      functionOffset = p;
    }
    else if ( *p == ')' )
    {
      returnOffset = p;
      break;
    }
  }
#endif

  std::ostringstream oss;

  // if the line could be processed, attempt to demangle the symbol
  if ( mangledName && functionOffset && returnOffset && 
       mangledName < functionOffset )
  {
    *mangledName = 0;
    mangledName++;
#ifdef __APPLE__
#ifdef __MACH__
    *(functionOffset - 1) = 0;
#endif
#endif
    *functionOffset = 0;
    ++functionOffset;
    *returnOffset = 0;
    ++returnOffset;

    int status;
    char* realName = abi::__cxa_demangle( mangledName, nullptr, nullptr, 
                                          &status );

    // if demangling is successful, output the demangled function name
    if (status == 0)
    {
      oss << "Frame " << frame << ": " << realName << std::endl;
    }
    // otherwise, output the mangled function name
    else
    {
      oss << "Frame " << frame << ": " << mangledName << std::endl;
    }
    
    free(realName);
  }

  // otherwise, print the whole line
  else
  {
    oss << "Frame " << frame << ": " << backtraceString << std::endl;
  }

  return ( oss.str() );
}

#else /* #ifdef AXOM_SLIC_DEMANGLE_STACK_TRACE */

//------------------------------------------------------------------------------
std::string demangle( char* backtraceString, int frame )
{
  std::ostringstream oss;
  oss << "Frame " << frame << ": " << backtraceString << std::endl; 
  return ( oss.str() ); 
}

#endif  /* #ifdef AXOM_SLIC_DEMANGLE_STACK_TRACE */
#endif  /* #ifdef WIN32 */

} /* namespace internal */

//------------------------------------------------------------------------------
// Initialize static variables for controlling runtime behavior of asserts and
// error macros.
//------------------------------------------------------------------------------
bool debug::checksAreErrors = false;

void initialize()
{
  Logger::initialize();
}

//------------------------------------------------------------------------------
bool isInitialized()
{
  return ( Logger::getActiveLogger() != nullptr );
}

//------------------------------------------------------------------------------
void createLogger( const std::string& name, char imask )
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return;
  }
  Logger::createLogger( name, imask );
}

//------------------------------------------------------------------------------
bool activateLogger( const std::string& name )
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return false;
  }
  return Logger::activateLogger( name );
}

//------------------------------------------------------------------------------
std::string getActiveLoggerName()
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return "";
  }
  return ( Logger::getActiveLoggerName() );
}

//------------------------------------------------------------------------------
void setLoggingMsgLevel( message::Level level )
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return;
  }
  Logger::getActiveLogger()->setLoggingMsgLevel( level );
}

//------------------------------------------------------------------------------
void setAbortOnError( bool status )
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return;
  }

  Logger::getActiveLogger()->setAbortOnError( status );
}

//------------------------------------------------------------------------------
void enableAbortOnError() {
  setAbortOnError( true );
}

//------------------------------------------------------------------------------
void disableAbortOnError() {
  setAbortOnError( false );
}

//------------------------------------------------------------------------------
bool isAbortOnErrorsEnabled()
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return false;
  }

  return ( Logger::getActiveLogger()->isAbortOnErrorsEnabled() );
}

//------------------------------------------------------------------------------
void setAbortOnWarning( bool status )
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return;
  }

  Logger::getActiveLogger()->setAbortOnWarning( status );
}

//------------------------------------------------------------------------------
void enableAbortOnWarning() {
  setAbortOnWarning(true);
}

//------------------------------------------------------------------------------
void disableAbortOnWarning() {
  setAbortOnWarning(false);
}

//------------------------------------------------------------------------------
bool isAbortOnWarningsEnabled()
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return false;
  }

  return ( Logger::getActiveLogger()->isAbortOnWarningsEnabled() );
}

//------------------------------------------------------------------------------
void addStreamToMsgLevel( LogStream* ls, message::Level level )
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return;
  }
  Logger::getActiveLogger()->addStreamToMsgLevel( ls, level );
}

//------------------------------------------------------------------------------
void addStreamToAllMsgLevels( LogStream* ls )
{
  Logger::getActiveLogger()->addStreamToAllMsgLevels( ls );
}

//------------------------------------------------------------------------------
void logMessage( message::Level level, const std::string& message,
                 bool filter_duplicates )
{
  if ( !isInitialized() )
  {
    return;
  }
  Logger::getActiveLogger()->logMessage( level, message, filter_duplicates );
}

//------------------------------------------------------------------------------
void logMessage( message::Level level,
                 const std::string& message,
                 const std::string& tag,
                 bool filter_duplicates )
{
  if ( !isInitialized() )
  {
    return;
  }
  Logger::getActiveLogger()->logMessage( level, message, tag,
                                         filter_duplicates );
}

//------------------------------------------------------------------------------
void logMessage( message::Level level,
                 const std::string& message,
                 const std::string& fileName,
                 int line,
                 bool filter_duplicates )
{
  if ( !isInitialized() )
  {
    return;
  }
  Logger::getActiveLogger()->logMessage( level, message, fileName, line,
                                         filter_duplicates );
}

//------------------------------------------------------------------------------
void logMessage( message::Level level,
                 const std::string& message,
                 const std::string& tag,
                 const std::string& fileName,
                 int line,
                 bool filter_duplicates )
{
  if ( !isInitialized() )
  {
    return;
  }
  Logger::getActiveLogger()->logMessage( level, message, tag, fileName, line,
                                         filter_duplicates );
}

//------------------------------------------------------------------------------
void logErrorMessage( const std::string& message,
                      const std::string& fileName,
                      int line )
{
  std::ostringstream oss;
  oss << message << slic::stacktrace();

  slic::logMessage( message::Error, oss.str(), fileName, line );
}

//------------------------------------------------------------------------------
void logWarningMessage( const std::string& message,
                        const std::string& fileName,
                        int line )
{
  slic::logMessage( message::Warning, message, fileName, line );
}

//------------------------------------------------------------------------------
void flushStreams()
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return;
  }
  Logger::getActiveLogger()->flushStreams();
}

//------------------------------------------------------------------------------
void pushStreams()
{
  if ( !isInitialized() )
  {
    std::cerr << "[ERROR]: slic::initialize() must be called first "
              << "before making any other calls to SLIC.";
    return;
  }
  Logger::getActiveLogger()->pushStreams();
}

//------------------------------------------------------------------------------
void finalize()
{
  Logger::finalize();
}

//------------------------------------------------------------------------------
#ifdef WIN32
std::string stacktrace( )
{
  void* stack[MAX_FRAMES];
  std::ostringstream oss;

  unsigned short frames;
  SYMBOL_INFO* symbol;
  HANDLE process;

  process = GetCurrentProcess();

  SymInitialize( process, NULL, TRUE );

  frames               = CaptureStackBackTrace( 0, MAX_FRAMES, stack, NULL );
  symbol               = ( SYMBOL_INFO* )calloc(
    sizeof( SYMBOL_INFO ) + 256 * sizeof( char ), 1 );
  symbol->MaxNameLen   = 255;
  symbol->SizeOfStruct = sizeof( SYMBOL_INFO );

  oss << "\n** StackTrace of " << frames << " frames **\n";
  for(int i = 0 ; i < frames ; i++ )
  {
    char outString[512];
    SymFromAddr( process, ( DWORD64 )( stack[ i ] ), 0, symbol );

    sprintf_s(outString, "%i: %s - 0x%0X", frames - i - 1, symbol->Name,
              symbol->Address );
    oss << outString << std::endl;
  }

  free( symbol );
  oss << "=====\n\n";

  return ( oss.str() );
}
#else
std::string stacktrace( )
{
  void *array[ MAX_FRAMES ];
  
  const int size = backtrace( array, MAX_FRAMES );
  char** strings = backtrace_symbols( array, size );

  // skip first stack frame (points here)
  std::ostringstream oss;
  oss << "\n** StackTrace of " << size - 1 << " frames **\n";
  for ( int i = 1 ; i < size && strings != nullptr ; ++i )
  {
    oss << internal::demangle( strings[ i ], i );
  }

  oss << "=====\n\n";

  free(strings);

  return ( oss.str() );
}
#endif

} /* namespace slic */

} /* namespace axom */
