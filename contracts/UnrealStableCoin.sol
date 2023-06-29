//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {ERC20, ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/*
     @title UnrealStableCoin
     @author Tanuj Srivastava
     Collateral: Exogenous (ETC)
     Minting: Collateralized
     Relative Stability: Pegged to USD 
*/

contract UnrealStableCoin is ERC20Burnable, Ownable {
    error UnrealStableCoin__MustBeMoreThanZero();
    error UnrealStableCoin__AmountExceedbalance();
    error UnrealStableCoin__NotZeroAddress();

    constructor() ERC20("UnrealStableCoin", "nUSD") {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount < 0) {
            revert UnrealStableCoin__MustBeMoreThanZero();
        }
        if (balance < _amount) {
            revert UnrealStableCoin__AmountExceedbalance();
        }
        super.burn(_amount);
    }

    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_amount < 0) {
            revert UnrealStableCoin__MustBeMoreThanZero();
        }

        if (_to == address(0)) {
            revert UnrealStableCoin__NotZeroAddress();
        }

        _mint(_to, _amount);

        return true;
    }
}
