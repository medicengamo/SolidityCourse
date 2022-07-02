// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract subasta{
    struct Oferta{
        address oferente;
        uint oferta;
    }
    Oferta oferta;
    uint inicioSubasta = 0;
    address ultimoOferente;
    

    

    function subastar(uint monto) public{
        require(msg.sender != ultimoOferente);
        require(monto > oferta.oferta);

        if(inicioSubasta == 0){            
           
           inicioSubasta = block.timestamp;  
           ultimoOferente = msg.sender;
           guardarOferta(monto);

        }
        else if(inicioSubasta < inicioSubasta + 1 minutes){
            guardarOferta(monto);
        }
    }

    function guardarOferta(uint monto) private{
        oferta.oferente = msg.sender;
        oferta.oferta = monto;
    }

    function verGanadorSubasta() public view returns(address, uint ) {
        return (oferta.oferente, oferta.oferta);
    }
}
