// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @title MemoryPermission
/// @notice Grants, limits and revokes agent access to a user's memory vault.
contract MemoryPermission {
    struct Grant {
        uint256 expiry;
        string scope; // identifier of the memory / memory group being shared
    }

    /// @notice owner => agent => granted permission
    mapping(address => mapping(address => Grant)) public grants;

    // TODO: implement grantAccess, revokeAccess and verification helpers
}
