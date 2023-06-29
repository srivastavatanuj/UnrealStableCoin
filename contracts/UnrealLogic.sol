//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

contract UnrealLogic {
    error UnrealLogic__NeedMoreThanZero();
    error UnrealLogic__TokenNotAllowed();

    modifier moreThanZero(uint256 amount) {
        if (amount <= 0) {
            revert UnrealLogic__NeedMoreThanZero();
        }
        _;
    }

    modifier isAllowedToken(address tokenAddress) {
        if (tokenAddress == address(0)) {
            revert UnrealLogic__TokenNotAllowed();
        }
        _;
    }

    constructor() {}

    function depositeCollateral(
        address tokenCollateralAddress,
        uint256 amountCollateral
    ) public {}

    function redeemCollateral() external {}

    function burnCoin() external {}

    function mintcoin() external {}

    function depositeCollateralAndMint() external {}

    function redeemCollateralAndBurn() external {}

    function liquidate() external {}

    function getHealthFactor() external {}
}
