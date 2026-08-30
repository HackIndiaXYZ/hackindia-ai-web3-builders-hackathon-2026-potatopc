// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {MemoryPermission} from "../src/MemoryPermission.sol";
import {MemoryAccess} from "../src/MemoryAccess.sol";

/// @notice Deployment script for the Synapse access-control contracts.
contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        new MemoryPermission();
        new MemoryAccess();

        vm.stopBroadcast();
    }
}
