//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ERC165.sol";
import "./interfaces/IERC721.sol";


contract ERC721 is ERC165, IERC721 {
    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint256) private _ownedTokensCount;
    mapping(uint256 => address) private _tokenApprovals;

    function balanceOf(address _owner) public view returns(uint256) {
        require(_owner != address(0), 'owner query for non-exist token');
        return _ownedTokensCount[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns(address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), 'onwer query for non-exist token');
        return owner;
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public {
        require(isOwner(msg.sender, _tokenId));
        _transferFrom(_from,_to, _tokenId);
    }

    function approve(address _to, uint256 _tokenId) public {
        address owner = ownerOf(_tokenId);
        require(_to != owner, 'Error - approval for current owner');
        require(msg.sender == owner, 'Current caller is not the owner of the token');
        _tokenApprovals[_tokenId] = _to;

        emit Approval(owner, _to, _tokenId);
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

    function _transferFrom(address _from, address _to, uint256 _tokenId) internal {
        require(_to != address(0), 'Error - Trying to transfer token to zero address');
        require(ownerOf(_tokenId) == _from, 'Error - trying to send non-existing token for current address');
        _ownedTokensCount[_from] -= 1;
        _ownedTokensCount[_to] += 1;
        _tokenOwner[_tokenId] = _to;

        emit Transfer(_from, _to, _tokenId);
    }

    function isOwner(address spender, uint256 _tokenId) internal view returns(bool) {
        require( _isExists(_tokenId), 'Token doesnt exist');
        address owner = ownerOf(_tokenId);
        return(spender == owner);
    }
}