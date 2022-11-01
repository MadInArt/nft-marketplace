//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ERC721 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint256) private _ownedTokensCount;

    function balanceOf(address _owner) public view returns(uint256) {
        require(_owner != address(0), 'owner query for non-exist token');
        return _ownedTokensCount[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns(address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), 'onwer query for non-exist token');
        return owner;
    }

    function _isExists(uint256 tokenId) internal view returns(bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), 'ERC721 must be minted to non zero address');
        require(!_isExists(tokenId), 'Token already been minted');
        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }
}