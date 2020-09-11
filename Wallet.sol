pragma solidity 0.5.12;

contract Wallet {
   
    address payable public owner;
    event  Deposit (  address sender, uint amount, uint balance );
    event Withdrow ( uint amout, uint balance );
    event Transfer (address to, uint amout, uint balance );
    
 mapping(address => uint ) balances;
        
      
        
     constructor ()  public payable {
        owner = msg.sender;
    }

    function deposit ()public payable {
        emit Deposit (msg.sender, msg.value,address(this).balance);
        
    }
    function NotPayable () public payable {
        
    }
    
       modifier onlyOwner {
       require (msg.sender == owner, "Not Owner");
       _;
    }
    

    
    function withdrow (uint _amount) public onlyOwner {
        owner.transfer (_amount);
         emit Withdrow ( _amount, address(this).balance);
    }
    
        function transfer (address payable _to, uint _amount) public onlyOwner {
            _to.transfer (_amount);
            emit Transfer ( _to, _amount, address(this).balance);
        }
    
    
    function getBalance () public view returns (uint) {
        return address(this).balance;
        }
}