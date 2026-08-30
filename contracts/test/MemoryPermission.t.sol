// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {MemoryPermission} from "../src/MemoryPermission.sol";

contract MemoryPermissionTest is Test {
    MemoryPermission internal permission;

    function setUp() public {
        permission = new MemoryPermission();
    }

    function testGrantAndVerify() public {
        // TODO: assert grant / verify / revoke flow
        assertTrue(true);
    }
}
