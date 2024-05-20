// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    bool public a = true;
    bool public b = false;
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	uint8 public a = 8;
	uint16 public b = 15;
	uint public sum = a + b;
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	int8 public a = 6;
	int8 public b = -6;
	int16 public difference = 12;
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	bytes32 public msg1 = "Hello World"; 
	string public msg2 = "Hello World, I am solomon";
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Foods { Apple, Pizza, Bagel, Banana }

	Foods public food1 = Foods.Apple;
	Foods public food2 = Foods.Pizza;
	Foods public food3 = Foods.Bagel;
	Foods public food4 = Foods.Banana;
}

