// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title GraffitiWall
 * @dev Store, set & retrieve grfti wall
 */
contract GraffitiWall {

    // size of the wall in pixels
    uint x_length = 10;
    uint y_length = 10;

    // pixel struct with RGB model
    struct Pixel {
        uint r;
        uint g;
        uint b;
    }

    // this is the GraffitiWall
    // where each pixel in the wall
    // has a coordinates and a Pixel
    // with RGB values stored permanently
    // on the blockhain
    Pixel[10][10] pixels;

    // initiallizing the wall with whitness
    constructor() {
        for (uint x = 0; x < x_length; x++) {
            for (uint y = 0; y < y_length; y++) {
                pixels[x][y] = Pixel(0, 0, 0);
            }
        }
    }

    // getter for the front-end
    function show() public view returns(Pixel[10][10] memory){
        return pixels;
    }

    // set the RGB values of selected pixels
    // the argument is an array of arrays where:
    // [[x, y, R, G, B], ..., [x, y, R, G, B]]
    function paint(uint[5][] calldata args) public {

        for (uint i = 0; i < args.length; i++) {
            uint x = args[i][0];
            uint y = args[i][1];
            uint r = args[i][2];
            uint g = args[i][3];
            uint b = args[i][4];
            pixels[x][y] = Pixel(r, g, b);
        }
    }
}
