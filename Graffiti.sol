pragma solidity >=0.7.0 <0.9.0;

/**
  * @author https://github.com/RaidasGrisk
  * @notice GraffitiWall lets anyone set pixel values and so paint
  */
contract GraffitiWall {

    /** @notice
      * pixel struct holding the values of coordinates (x, y) and RGB model
      */
    struct Pixel {
        uint256 x;
        uint256 y;
        uint8 r;
        uint8 g;
        uint8 b;
    }

    /**
      * @dev
      * Not initializing a fixed size wall as this will
      * introduce unnecesary deployment costs by reserving
      * a lot of empty space (coords x, y with 0, 0, 0 RGB values)
      * on the blockchain.

      * Instead lets not assume the size of the wall beforehand
      * It can be infinate. Newly created pixels are simply pushed
      * to an array and hence something is introduced to the wall.

      * @notice
      * Below is the GraffitiWall permanently stored on the blockchain.
      * By default, the wall is empty.
      */
    Pixel[] public wall;

    /**
      * @notice
      * getter for the front-end that returns all pixels pushed to the wall
      * @dev
      * Should consider pagination pattern in case the array grows
      * https://programtheblockchain.com/posts/2018/04/20/storage-patterns-pagination/
      */
    function show() public view returns(Pixel[] memory){
        return wall;
    }

    /**
      * @notice push pixels to the wall. Can push multiple pixels in a single call.
      * @param _coords array of arrays with x, y coords [[x, y], ..., [x, y]]
      * @param _rgbColor array of arrays with rgb values [[r, g, b], ..., [r, g, b]]
      * @dev function args are separated on purpose, because we can not store
      * different types in same array. This is not possible: [int8, int32]
      */
    function paint(uint256[2][] calldata _coords, uint8[3][] calldata _rgbColor) public {
        for (uint256 i = 0; i < _coords.length; i++) {
            wall.push(
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
