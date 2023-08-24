// SDPX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VirtualLandNFT is ERC721, Ownable {
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    struct VirtualLand {
        string location;
        string description;
        
    }
 
    mapping(uint256 => VirtualLand) public virtualLands;

    uint256 private tokenIdCounter = 1;

    function mintVirtualLandNFT(address _to, string memory _location, string memory _description) external onlyOwner {
        uint256 tokenId = tokenIdCounter;
        tokenIdCounter++;

        virtualLands[tokenId] = VirtualLand(_location, _description);

        _mint(_to, tokenId);
    }

    function updateVirtualLandDetails(uint256 _tokenId, string memory _newLocation, string memory _newDescription) external onlyOwner {
        require(_exists(_tokenId), "Token does not exist");
        
        virtualLands[_tokenId].location = _newLocation;
        virtualLands[_tokenId].description = _newDescription;
    }
}
