// Copyright (c) 2017-2022, Lawrence Livermore National Security, LLC and
// other Axom Project Developers. See the top-level LICENSE file for details.
//
// SPDX-License-Identifier: (BSD-3-Clause)

#include "axom/config.hpp"

#include "axom/primal.hpp"
#include "axom/core.hpp"
#include "axom/slic.hpp"
#include "axom/fmt.hpp"

#include "gtest/gtest.h"

// C++ headers
#include <cmath>
#include <iostream>
#include <fstream>

namespace primal = axom::primal;

TEST(primal_winding_number, simple_cases)
{
  using Point2D = primal::Point<double, 2>;
  using Bezier = primal::BezierCurve<double, 2>;
  using CPolygon = primal::CurvedPolygon<double, 2>;

  double abs_tol = 1e-8;
  double lin_tol = 0;
  double edge_tol = 0;

  // Simple cubic shape for testing intersecting cubic
  Point2D top_nodes[] = {Point2D {0.0, 0.0},
                         Point2D {0.0, 1.0},
                         Point2D {-1.0, 1.0},
                         Point2D {-1.0, 0.0}};
  Bezier top_curve(top_nodes, 3);

  Point2D bot_nodes[] = {Point2D {-1.0, 0.0},
                         Point2D {-1.0, -1.0},
                         Point2D {0.0, -1.0},
                         Point2D {0.0, 0.0}};
  Bezier bot_curve(bot_nodes, 3);
  Bezier simple_shape_edges[] = {top_curve, bot_curve};
  CPolygon simple_shape(simple_shape_edges, 2);

  // Check interior points
  for(int i = 1; i < 9; i++)
  {
    double offset = std::pow(10, -i);
    Point2D q_vert({-0.352, 0.72 - offset});
    Point2D q_horz({-0.352 - offset, 0.72});

    EXPECT_NEAR(winding_number(q_vert, simple_shape, lin_tol, edge_tol),
                1.0,
                abs_tol);
    EXPECT_NEAR(winding_number(q_horz, simple_shape, lin_tol, edge_tol),
                1.0,
                abs_tol);
  }

  // Check exterior points
  for(int i = 1; i < 9; i++)
  {
    double offset = std::pow(10, -i);
    Point2D q_vert({-0.352, 0.72 + offset});
    Point2D q_horz({-0.352 + offset, 0.72});

    EXPECT_NEAR(winding_number(q_vert, simple_shape, lin_tol, edge_tol),
                0.0,
                abs_tol);
    EXPECT_NEAR(winding_number(q_horz, simple_shape, lin_tol, edge_tol),
                0.0,
                abs_tol);
  }

  // Test that points on either side of cubic are offset by 1
  EXPECT_NEAR(winding_number(Point2D({-0.352, 0.72 - 1e-16}), top_curve, 0, 0) -
                winding_number(Point2D({-0.352, 0.72 + 1e-16}), top_curve, 0, 0),
              1,
              abs_tol);
  top_curve.reverseOrientation();
  EXPECT_NEAR(winding_number(Point2D({-0.352, 0.72 + 1e-16}), top_curve, 0, 0) -
                winding_number(Point2D({-0.352, 0.72 - 1e-16}), top_curve, 0, 0),
              1,
              abs_tol);
}

TEST(primal_winding_number, edge_cases)
{
  // Check the edge cases for the winding number closure formulation
  using Point2D = primal::Point<double, 2>;
  using Bezier = primal::BezierCurve<double, 2>;

  double abs_tol = 1e-10;
  double lin_tol = 1e-16;
  double edge_tol = 1e-16;

  // Line segment
  Point2D nodes1[] = {Point2D {0.0, 0.0}, Point2D {1.0, 1.0}};
  Bezier linear(nodes1, 1);

  // Cubic curve
  Point2D nodes2[] = {Point2D {0.0, 0.0},
                      Point2D {0.0, 1.0},
                      Point2D {-1.0, 1.0},
                      Point2D {-1.0, 0.0}};
  Bezier cubic(nodes2, 3);

  // Flipped Cubic curve
  Point2D fnodes2[] = {Point2D {0.0, 0.0},
                       Point2D {0.0, -1.0},
                       Point2D {-1.0, -1.0},
                       Point2D {-1.0, 0.0}};
  Bezier fcubic(fnodes2, 3);

  // Test on linear cases
  EXPECT_NEAR(winding_number(Point2D({-0.45, -0.45}), linear, lin_tol, edge_tol),
              0.0,
              abs_tol);
  EXPECT_NEAR(winding_number(Point2D({1.45, 1.45}), linear, lin_tol, edge_tol),
              0.0,
              abs_tol);

  // Test on cubic. If query is outside the range of the two endpoints, return 0
  EXPECT_NEAR(winding_number(Point2D({-2.5, 0.0}), cubic, lin_tol, edge_tol),
              0.0,
              abs_tol);
  EXPECT_NEAR(winding_number(Point2D({-2.5, 0.0}), fcubic, lin_tol, edge_tol),
              0.0,
              abs_tol);

  // If query point between the endpoints, return +0.5/-0.5
  EXPECT_NEAR(winding_number(Point2D({-0.5, 0.0}), cubic, lin_tol, edge_tol),
              0.5,
              abs_tol);
  EXPECT_NEAR(winding_number(Point2D({-0.5, 0.0}), fcubic, lin_tol, edge_tol),
              -0.5,
              abs_tol);

  cubic.reverseOrientation();
  fcubic.reverseOrientation();
  EXPECT_NEAR(winding_number(Point2D({-0.5, 0.0}), cubic, lin_tol, edge_tol),
              -0.5,
              abs_tol);
  EXPECT_NEAR(winding_number(Point2D({-0.5, 0.0}), fcubic, lin_tol, edge_tol),
              0.5,
              abs_tol);

  return;
}

TEST(primal_winding_number, corner_cases)
{
  using Point2D = primal::Point<double, 2>;
  using Bezier = primal::BezierCurve<double, 2>;

  double abs_tol = 1e-8;
  double lin_tol = 1e-8;
  double edge_tol = 1e-8;

  // Line segment
  Point2D nodes1[] = {Point2D {0.0, 0.0}, Point2D {1.0, 1.0}};
  Bezier linear(nodes1, 1);

  // Cubic curve
  Point2D nodes2[] = {Point2D {0.0, 0.0},
                      Point2D {0.0, 1.0},
                      Point2D {-1.0, 1.0},
                      Point2D {-1.0, 0.0}};
  Bezier cubic(nodes2, 3);

  // Query points exactly on the curve will return a value 
  // between 0 and 1 that depends on the incident angle of the
  // tangent lines

  // At any point on a line, returns 0
  EXPECT_NEAR(  // Query on linear curve
    winding_number(Point2D({0.45, 0.45}), linear, 0, edge_tol),
    0.0,
    abs_tol);
  EXPECT_NEAR(  // Query on endpoint of linear
    winding_number(Point2D({0.0, 0.0}), linear, 0, edge_tol),
    0.0,
    abs_tol);
  EXPECT_NEAR(  // Query on endpoint of linear
    winding_number(Point2D({1.0, 1.0}), linear, 0, edge_tol),
    0.0,
    abs_tol);
  

  EXPECT_NEAR(  // Query on initial endpoint of cubic
    winding_number(Point2D({-1.0, 0.0}), cubic, 0, edge_tol),
    0.25,
    abs_tol);
  EXPECT_NEAR(  // Query on terminal endpoint of cubic
    winding_number(Point2D({-1.0, 0.0}), cubic, 0, edge_tol),
    0.25,
    abs_tol);

  // The query is on the endpoint after one bisection
  EXPECT_NEAR(winding_number(Point2D({-0.5, 0.75}), cubic, 0, edge_tol),
              0.312832962673,
              abs_tol);

  // The query is not on an endpoint after any number of bisections
  EXPECT_NEAR(winding_number(cubic.evaluate(0.4), cubic, 0, edge_tol),
              0.310998027957,
              abs_tol);
}

int main(int argc, char** argv)
{
  ::testing::InitGoogleTest(&argc, argv);

  axom::slic::SimpleLogger logger;

  int result = RUN_ALL_TESTS();

  return result;
}
