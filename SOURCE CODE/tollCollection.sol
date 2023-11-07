// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tollCollection{
    struct TollData {
        uint timestamp;
        address collectedBy;
        uint amount;
    }

    mapping(address => mapping(uint => TollData)) public tolls;


    function payTollAmount(uint highwayId, uint _amount) public {

       // TollData memory newToll = TollData(block.timestamp, msg.sender, amount);
        tolls[msg.sender][highwayId].timestamp = block.timestamp ;
        tolls[msg.sender][highwayId].collectedBy = msg.sender;
        tolls[msg.sender][highwayId].amount += _amount;
    }

    function getToll(uint highwayId) public view returns (TollData memory) {
        return tolls[msg.sender][highwayId];
    }

    // function updateToll(uint highwayId, uint amount) public {
    //     require(
    //         tolls[msg.sender][highwayId].timestamp > 0,
    //         "Toll data not found."
    //     );
    //     tolls[msg.sender][highwayId].amount = amount;
    // }
}