// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract Shokugeki_no_soma_Store {  

  mapping (bytes32 => bool) private listCharacters;

  //---events---
  event AddedTx(
    address from,   
    string text,
    bytes32 hash,
    string time
  );

  event RegistrationError(
    address from,
    string text,
    string reason,
    string time
  );

  struct Respones{
    address from;
    string text;
    string time;
  }
  Respones[] respones;

  // store the proof for a character in the contract state
  function recordProof(bytes32 proof) private {
    listCharacters[proof] = true;
  }
  
  // record a character name
  function registration(string memory name,string memory time) public payable {
    
    

    //---check if msg.value != 0.004 ether---
    if(keccak256(bytes(name))==keccak256(bytes("Yukihira Soma"))){
        if (msg.value != 0.004 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.004 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Nakiri Erina"))){
        if (msg.value != 0.006 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.006 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Tadokoro Megumi"))){
        if (msg.value != 0.003 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.003 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Shinomiya Kojiro"))){
        if (msg.value != 0.002 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.002 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Nakiri Alice"))){
        if (msg.value != 0.005 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.005 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Hayama Akira"))){
        if (msg.value != 0.001 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.001 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }
      

    
 
    recordProof(hashing(name));
    
    //---fire the event---
    emit AddedTx(msg.sender, name, hashing(name),time);
    
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }

  function ResponesData() public view returns(Respones[] memory){
    return respones;
  }
  
  // check name of character in this class
  function checkName(string memory name) public 
  view returns (bool) {
    return listCharacters[hashing(name)];
  }
}