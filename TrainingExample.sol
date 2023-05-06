pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract TrainingExample {
    int public count;
    mapping (address => uint144) public userNumbers;
    address public owner;

    constructor() {
        count = 0;
        owner = msg.sender;
    }

    function setCounter(int value) public {
        count += value;
    }

    function getCounter() public view returns(int) {
        return count;
    }

    function getCounterPlus(int value) public view returns(int) {
        require(value > -1000, "invalid negative value");
        require(value < 1000, "invalid positive value");
        return count + value;
    }

    function getSum(int256 value1, int256 value2) public pure returns(int256) {
        return value1 + value2;
    }

    function getHelloMessage(string memory name) public pure returns(string memory) {
        return string.concat("Hello ", name);
    }

    function setUserNumber(address user, uint144 number) public virtual returns (bool) {
        userNumbers[user] = number;
        return true;
    }

    function getUserNumber(address user) public view returns (uint144) {
        return userNumbers[user];
    }

    function removeUser(address user) public virtual {
        delete(userNumbers[user]);
    }

    function getListOfNumbers(uint256 qtd) public pure returns (uint256[] memory) {
        uint256[] memory ret = new uint256[](qtd);
        for (uint i = 0; i < qtd; i++) {
            ret[i] = i;
        }
        return ret;
    }

    function getListOfNumbersAndStrings(uint256 qtd) public pure returns (uint256[] memory, string[] memory, uint256) {
        uint256[] memory ret1 = new uint256[](qtd);
        string[] memory ret2 = new string[](qtd);
        for (uint i = 0; i < qtd; i++) {
            ret1[i] = i;
            ret2[i] = string.concat("number ", Strings.toString(i));
        }
        return (ret1, ret2, qtd);
    }
}
