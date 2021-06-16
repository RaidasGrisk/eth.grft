// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title GraffitiWall
 * @dev Store, set & retrieve grfti wall
 */
contract GraffitiWall {


    // Not initializing a fixed size wall as this will
    // introduce unnecesary deployment costs by reserving
    // a lot of empty space (coords x, y with 0, 0, 0 RGB values)
    // on the blockchain.

    // Instead lets not assume the size of the wall beforehand
    // It can be infinate. Newly created pixels are simply pused
    // to an array and hence something is introduced to the wall

    // pixel struct holding the values of
    // coordinates (x, y) and RGB model
    struct Pixel {
        uint256 x;
        uint256 y;
        uint8 r;
        uint8 g;
        uint8 b;
    }

    // this is the GraffitiWall
    // permanently stored on the blockchain
    // by default, the wall is empty
    Pixel[] public pixels;

    // getter for the front-end that returns
    // all pixels pushed to the wall
    // Should consider implementing pagination pattern
    // in case this is actually used
    // https://programtheblockchain.com/posts/2018/04/20/storage-patterns-pagination/
    function show() public view returns(Pixel[] memory){
        return pixels;
    }

    // as explained before, the pixels array is empty by default
    // the following pushes pixels to this array and these pixels will be displayed
    function paint(uint256[2][] calldata _coords, uint8[3][] calldata _rgbColor) public {
        for (uint256 i = 0; i < _coords.length; i++) {
            pixels.push(
                Pixel(
                    _coords[i][0],
                    _coords[i][1],
                    _rgbColor[i][0],
                    _rgbColor[i][1],
                    _rgbColor[i][2]
                )
            );
        }
    }
}
