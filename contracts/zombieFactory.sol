
pragma solidity >=0.5.0 <0.6.0;


contract ZombieFactory  {

   uint dnaDigits = 16;
   uint dnaModulus = 10 ** dnaDigits;

   event NewZombie(uint id, string name, uint dna);

   struct Zombie {
       string name;
       uint dna;
   }
   
   Zombie[] public zombies;


   function _createZombie(string memory _name, uint _dna) private{
       uint id = zombies.push(Zombie(_name, _dna));
       emit NewZombie(id, _name, _dna);
   }

   function _generateRandomDna(string memory _str) private view returns (uint){
       uint random = uint(keccak256(abi.encodePacked(_str)));
       return random % dnaModulus;
   }

   function createRandomZombie(string memory _name) public{
       uint randDna = _generateRandomDna(_name);
       _createZombie(_name, randDna);
   }
  
}