var canvas;
var canvasContext;
var FPS;

var scoreWin = 3;
var showingWinScreen = false;

const PADDLE_WIDTH = 20;
const PADDLE_HEIGHT = 100;
var paddle1Y = 250;
var paddle2Y = 250;

var score1 = 0;
var score2 = 0;

var ball = {
    radius: 15,
    posx: 400,
    posy: 300,
    speedX: 10,
    speedY: 4
};

/* class Player {
    constructor(posx, posy) {
        this.width = 20;
        this.height = 100;
        this.posx = posx;
        this.posy = posy;
    };

    calculateMousePos(evt) {
        this.rect = canvas.getBoundingClientRect();
        this.root = document.documentElement();
        this.mouseX = evt.clientX - rect.left - root.scrollLeft;
        this.mouseY = evt.clientY - rect.top - root.scrollTop;

        return {
            x:this.mouseX,
            y:this.mouseY
        }
    }
}; */

function calculateMousePos(evt) {
    var rect = canvas.getBoundingClientRect();
    var root = document.documentElement;
    var mouseX = evt.clientX - rect.left - root.scrollLeft;
    var mouseY = evt.clientY - rect.top - root.scrollTop;

    return {
        x:mouseX,
        y:mouseY
    };
}

function handleMouseClick(evt) {
    if (showingWinScreen) {
        score1 = 0;
        score2 = 0;
        ball.posx = canvas.width / 2;
        ball.posy = canvas.height / 2;
        showingWinScreen = false;
    }
}


window.onload = function() {
    canvas = document.getElementById('gameCanvas');
    canvasContext = canvas.getContext('2d');
    FPS = 30;

    setInterval(() => {
        update();
        draw();
    }, 1000 / FPS);

    canvas.addEventListener('mousemove',
                            function(evt) {
                                var mousePos = calculateMousePos(evt);
                                paddle1Y = mousePos.y - PADDLE_HEIGHT / 2
                            }
    )

    this.canvas.addEventListener('mousedown', handleMouseClick);
}


function ballReset() {
    if (score1 >= scoreWin || score2 >= scoreWin) {
        showingWinScreen = true;
    }
    ball.speedX = - ball.speedX;
    ball.posx = canvas.width / 2;
    ball.posy = canvas.height / 2;
}


function computerMovement() {
    if (paddle2Y + PADDLE_HEIGHT / 2 < ball.posy - 35) {
        paddle2Y += 5;
    } else if (paddle2Y + PADDLE_HEIGHT / 2 > ball.posy + 35){
        paddle2Y -= 5;
    }
}


function update() {
    if (!showingWinScreen) {
        computerMovement();

        ball.posx += ball.speedX;
        ball.posy += ball.speedY;
    }

    if (ball.posx > canvas.width - ball.radius) {
        if (ball.posy > paddle2Y &&
            ball.posy < paddle2Y + PADDLE_HEIGHT) {
            ball.speedX = - ball.speedX

            var deltaY = ball.posy - (paddle1Y + PADDLE_HEIGHT / 2);
            ball.speedY = deltaY * 0.15;
        } else {
            score1++;
            ballReset();
        }
    } else if (ball.posx < ball.radius) {
        if (ball.posy > paddle1Y &&
            ball.posy < paddle1Y + PADDLE_HEIGHT) {
            ball.speedX = - ball.speedX

            var deltaY = ball.posy - (paddle1Y + PADDLE_HEIGHT / 2);
            ball.speedY = deltaY * 0.15;
        } else {
            score2++;
            ballReset();
        }
    } else if (ball.posy > canvas.height - ball.radius) {
        ball.speedY = - ball.speedY
    } else if (ball.posy < ball.radius) {
        ball.speedY = - ball.speedY
    }
}


function drawNet() {
    for (let i = 10; i < canvas.height; i+=40) {
        drawRect(canvas.width / 2 - 1, i, 2, 20, 'white');
    }
}


function draw() {
    drawRect(0, 0, canvas.width, canvas.height, 'black');
    // Game Window
    if (showingWinScreen) {
        if (score1 >= scoreWin) {
            canvasContext.fillStyle = 'white';
            canvasContext.fillText('Player 1 won!', 370, 250);
        } else if (score2 >= scoreWin){
            canvasContext.fillStyle = 'white';
            canvasContext.fillText('Player 2 won!', 370, 250);
        }

        canvasContext.fillStyle = 'white';
        canvasContext.fillText('Click to restart the match!', 345, 300);
        return
    }

    drawNet();
    // Midle of field
    drawCircle(ball.posx, ball.posy, ball.radius, 'white');
    // Ball
    drawRect(0, paddle1Y, PADDLE_WIDTH, PADDLE_HEIGHT, 'white');
    // Player 1
    drawRect(780, paddle2Y, PADDLE_WIDTH, PADDLE_HEIGHT, 'white');
    // Player 2

    canvasContext.fillText(`${score1}`, 200, 150);
    canvasContext.fillText(`${score2}`, 600, 150);
}

function drawRect(x, y, width, height, color) {
    canvasContext.fillStyle = color;
    canvasContext.fillRect(x, y, width, height)
}

function drawCircle(x, y, radius, color) {
    canvasContext.fillStyle = color;
    canvasContext.beginPath();
    canvasContext.arc(x, y, radius, 0, 2 * Math.PI);
    canvasContext.fill()
}