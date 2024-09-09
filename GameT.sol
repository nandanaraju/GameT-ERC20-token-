// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract GameT is ERC20 {
    address public owner;

    constructor() ERC20("GameToken", "GT1") {
        owner = msg.sender;
        _mint(msg.sender, 200000000000000000000);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function safeMint(address to, uint256 value) public onlyOwner {
        _mint(to, value);
    }
}
