//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ERC721.sol";
import "./interfaces/IERC721Enumerable.sol";

 contract ERC721Enumerable is ERC721, IERC721Enumerable {
    uint256[] private _totalSupply;

    mapping(uint256 => uint256) private _allTokensIndex;
    mapping(address => uint256[]) private _ownedTokens;
    mapping(uint256 => uint256) private _ownedTokensIndex;

    function totalSupply( ) public view returns(uint256) {
        return _totalSupply.length;
    }

    function _mint (address to, uint256 tokenId) internal override (ERC721) {
        super._mint(to, tokenId);
        _addTokensToAllTokenEnumeration(tokenId);
        _addTokensToOwnerEnumeration(to, tokenId);
    }

    function _addTokensToAllTokenEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _totalSupply.length;
        _totalSupply.push(tokenId);
    }

    function _addTokensToOwnerEnumeration(address to, uint256 tokenId) private {
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }

    function tokenByIndex(uint256 index) public view returns(uint256) {
        require(index < totalSupply(), "Token at the given index doesn't exist");
        return _totalSupply[index];
    }

    function tokenOfOwnerByIndex(address owner, uint256 index) public view returns(uint256) {
        require(index < balanceOf(owner), "Token at the given index of the given user doesn't exist");
        return _ownedTokens[owner][index];
    }
}