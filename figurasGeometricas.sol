//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

interface iFiguraGeometrica
{
    
    function calcularPerimetro() external returns(uint);

    function calcularArea() external  returns(uint);
}
contract cuadrado is iFiguraGeometrica
{
    uint lado1;
    uint lado2;
    constructor(uint _lado1, uint _lado2)
    {
        lado1 = _lado1;
        lado2 = _lado2;
    }

    function calcularArea() external view override returns (uint)
    {
        return lado1 * lado2;
    }
    function calcularPerimetro() external view override returns (uint)
    {
        return lado1 + lado2;
    }
}

contract rectangulo is iFiguraGeometrica
{
    uint base;
    uint altura;
    constructor(uint _base, uint _altura)
    {
        base = _base;
        altura = _altura;
    }

    function calcularArea() external view override returns (uint)
    {
        return base * altura;
    }
    function calcularPerimetro() external view override returns (uint)
    {
        return (2 * base) + (2 * altura);
    }
}

contract trianguloCuadrado is iFiguraGeometrica
{
     uint base;
    uint altura;
    uint hipotenusa;

    constructor(uint _base, uint _altura)
    {
        base = _base;
        altura = _altura;
        console.log(base**2);
        console.log(altura**2);
        console.log(((base**2) + (altura**2))**2);
        hipotenusa = ((base**2) + (altura**2))**2;
    }

    function calcularArea() external view override returns (uint)
    {
        return (base * altura)/2;
    }
    function calcularPerimetro() external view override returns (uint)
    {
        return base + altura + hipotenusa;
    }
}
