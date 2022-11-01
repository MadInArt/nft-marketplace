//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import './ERC721.sol';

contract ERC721Enumerable is ERC721 {
    uint256[] private _totalSupply;

    mapping(uint256 => uint256) private _allTokensIndex;
    mapping(address => uint256[]) private _ownedTokens;
    mapping(uint256 => uint256) private _ownedTokensIndex;

    function totalSupply() public view returns(uint256) {
        return _totalSupply.length;
    }

    function _mint (address to, uint256 tokenId) internal override (ERC721) {
        super._mint(to, tokenId);
        _addTokensToTotalSupply(tokenId);
    }

    function _addTokensToTotalSupply(uint256 tokenId) private {
        _totalSupply.push(tokenId);
    }
}