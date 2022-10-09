//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ERC721Connector.sol";

contract CryptoBirds is ERC721Connector {
    constructor() ERC721Connector('CryptoBirds', 'CBIRDS') {}

    string[] public _cryptoBirds;
    mapping (string => bool) _cryptoBirdMinted;

    function mint(string memory cryptoBird) public {
        require(!_cryptoBirdMinted[cryptoBird], 'CryptoBird is already minted!');

        _cryptoBirds.push(cryptoBird);
        uint id = _cryptoBirds.length - 1;
        _mint(msg.sender, id);
        _cryptoBirdMinted[cryptoBird] = true;
    }
}