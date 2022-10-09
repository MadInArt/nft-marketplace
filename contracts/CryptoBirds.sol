//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ERC721Connector.sol";

contract CryptoBirds is ERC721Connector {
    constructor() ERC721Connector('CryptoBirds', 'CBIRDS') {}
}