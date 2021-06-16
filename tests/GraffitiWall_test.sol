// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "../contracts/GraffitiWall.sol";

contract GraffitiWallTest {

    GraffitiWall testGraffitiWall;
    int8[][2] coords;
    int256[][3] rgbColors;

    function checkIfPaintAddsToTheWall() public {

        // mock user input
        coords.push([0, 1]);
        coords.push([0, 3]);
        rgbColors.push([255, 255, 100]);
        rgbColors.push([155, 255, 100]);

        // push pixels to the wall
        testGraffitiWall.paint(coords, rgbColors);

        // prep for assert
        testGraffitiWall.Pixel pixel_1 = testGraffitiWall.Pixel(
          coords[0][0],
          coords[0][1],
          rgbColors[0][1],
          rgbColors[0][2],
          rgbColors[0][3]
        );

        testGraffitiWall.Pixel pixel_2 = testGraffitiWall.Pixel(
          coords[1][0],
          coords[1][1],
          rgbColors[1][1],
          rgbColors[1][2],
          rgbColors[1][3]
        );

        // assert
        Assert.equal(testGraffitiWall.wall[0], pixel_1, "Should hold same values");
        Assert.equal(testGraffitiWall.wall[1], pixel_2, "Should hold same values");
    }

}
