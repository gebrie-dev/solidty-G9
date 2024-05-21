// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
    function alert() external;
}




contract Sidekick {
    function sendAlert(address hero) external {
        // TODO: alert the hero using the IHero interface
    }
}
