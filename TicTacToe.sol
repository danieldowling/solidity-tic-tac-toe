pragma solidity ^0.4.19;


contract TicTacToe {
    uint8 public boardSize = 3;
    
    address[3][3] board;
    
    address public player1;
    address public player2;
    
    address activePlayer;
    
    function TicTacToe() public {
        player1 = msg.sender;
    }
    
    function joinGame() public {
        assert(player2 == address(0));
        player2 = msg.sender;
        activePlayer = player2;
    }
    
    function getBoard() view returns(address[3][3]) {
        return board;
    }
    
    function setStone(uint8 x, uint8 y) public {
        require(board[x][y] == address(0));
        assert(x < boardSize);
        assert(y < boardSize);
        require(msg.sender == activePlayer);
        board [x][y] = msg.sender;
        
        if (activePlayer == player1) {
            activePlayer == player2;
        } else {
            activePlayer = player1;
        }
    }
}