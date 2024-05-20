//Arguments
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	uint public x;

	constructor(uint _x) {
		x = _x;
	}

	function increment() external {
		x++;
	}

	function add(uint y) external view returns(uint) {
		return x + y;
	}
}
//Increments
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	uint public x;

	constructor(uint _x) {
		x = _x;
	}

	function increment() external {
		x++;
	}

	function add(uint y) external view returns(uint) {
		return x + y;
	}
}
//view addition
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	uint public x;

	constructor(uint _x) {
		x = _x;
	}

	function increment() external {
		x++;
	}

	function add(uint y) external view returns(uint) {
		return x + y;
	}
}
//consol log
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    function winningNumber(string calldata secretMessage) external returns(uint) {
        console.log(secretMessage);
        return 794;
    }
}
//pure double
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	function double(uint x) public pure returns(uint) {
		return x * 2;
	}
	
	function double(uint a, uint b) external pure returns(uint, uint) {
		return (double(a), double(b));
	}
}
//double over load
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	function double(uint x) public pure returns(uint) {
		return x * 2;
	}
	
	function double(uint a, uint b) external pure returns(uint, uint) {
		return (double(a), double(b));
	}
}
