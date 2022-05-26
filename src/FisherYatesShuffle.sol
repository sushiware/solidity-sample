// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {ERC721A} from "ERC721A/contracts/ERC721A.sol";

contract FisherYatesShuffleNFT is ERC721A {
    uint256 public constant MAX_SUPPLY = 1000;

    uint256[] _luckyNumbers;

    address public constant VALUTS = 0x0000000000200020000000200000000200000000;

    constructor() ERC721A("AwesomeNFT", "AN") {
        _safeMint(VALUTS, MAX_SUPPLY);
        _initLuckyNumbers(MAX_SUPPLY);
    }

    function getLuckyNumber(uint256 tokenId) public view returns (uint256) {
        require(_exists(tokenId), "Token does not exist");
        return _luckyNumbers[tokenId];
    }

    function _initLuckyNumbers(uint256 quantity) internal {
        _luckyNumbers = new uint256[](quantity);
        for (uint256 i = 0; i < quantity; i++) {
            _luckyNumbers[i] = i;
        }
        _fisherYatesShuffleLuckyNumbers();
    }

    function _fisherYatesShuffleLuckyNumbers() internal {
        bytes32 salt = keccak256(abi.encodePacked(block.timestamp));
        uint256 length = _luckyNumbers.length;
        for (uint256 i = length - 1; i > 0; i--) {
            salt = keccak256(abi.encodePacked(salt));
            uint256 j = uint256(salt) % i;
            uint256 temp = _luckyNumbers[i];
            _luckyNumbers[i] = _luckyNumbers[j];
            _luckyNumbers[j] = temp;
        }
    }
}
