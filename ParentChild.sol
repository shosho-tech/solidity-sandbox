// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Parent{
    uint internal data;

    function setData(uint _data) public {
        data = _data;
    } 

    function externalFunction() external view returns (uint){
        return data;
    }
}

interface IParent {
    function setData(uint _data) external;
    function externalFunction() external view returns (uint); 
}

contract InterfacedChild{
    address parentAddress;

    constructor(address _parentAddress){
        parentAddress = _parentAddress;
    }

    function callSetData(uint _data) public{
        IParent(parentAddress).setData(_data);
    }

    function callExternalFunction() external view returns (uint){
        return IParent(parentAddress).externalFunction();
    } 
}

contract Child{
    Parent parent;

    constructor(address _parentAddress){
        parent = Parent(_parentAddress);
    }

    function getData() public view returns (uint){
        return parent.externalFunction();
    }
}

contract InheritedChild is Parent{
    function getMyData() public view returns (uint){
        return data;
    }
}