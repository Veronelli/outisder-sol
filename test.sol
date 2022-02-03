pragma solidity ^0.8.0;

contract Contract1{
    mapping(address => address )public ownerDirecciones; 
    address[] public direcciones;

    function setDireccion()public {
        setDireccion(msg.sender);

    }

    function setDireccion(address __direccion)public virtual {
        address _direccion = address(new Contract2(address(this),msg.sender));
        direcciones.push(_direccion);
        ownerDirecciones[__direccion] = _direccion;

    }

    function getDirecciones()public view returns (address[]memory){
        return direcciones;
    }

    function getOwnerDireccio()public view returns(address){
        return ownerDirecciones[msg.sender];
    }
    
}

contract Contract2 {
    address public myContract;
    address public owner;
    constructor(address _contract, address _owner){
        myContract = _contract;
        owner = _owner;
    }

    function getDirecciones()public view returns(address[] memory){
        Contract1 _address = Contract1(myContract);
        return _address.getDirecciones();
    }
}
