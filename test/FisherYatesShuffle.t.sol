// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import {DSTest} from "ds-test/test.sol";
import {Vm} from "forge-std/Vm.sol";
import {FisherYatesShuffleNFT} from "../src/FisherYatesShuffle.sol";

contract AwesomeNFTTest is DSTest {
    Vm public constant vm = Vm(HEVM_ADDRESS);
    FisherYatesShuffleNFT fisherYatesShuffleNFT;

    function setUp() public {
        fisherYatesShuffleNFT = new FisherYatesShuffleNFT();
    }

    function testPRN() public view {
        for (uint256 i = 0; i < fisherYatesShuffleNFT.MAX_SUPPLY(); i++) {
            assert(fisherYatesShuffleNFT.getLuckyNumber(i) != i);
        }
    }
}
