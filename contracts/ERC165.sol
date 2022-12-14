//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import './interfaces/IERC165.sol';

contract ERC165 is IERC165 {
    mapping(bytes4 => bool) private _supportedInterfaces;

    function supportsInterface(bytes4 interfaceId) external view override returns(bool) {
        return _supportedInterfaces[interfaceId];
    }

    function _registerInterface(bytes4 interfaceId) internal {
        require(interfaceId != 0xffffffff, 'Invalid interface request');
        _supportedInterfaces[interfaceId] = true;
    }
}