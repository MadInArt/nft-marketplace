//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ERC721 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint256) private _ownedTokensCount;

    function _isExists(uint256 tokenId) internal view returns(bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), 'ERC721 must be minted to non zero address');
        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }
}