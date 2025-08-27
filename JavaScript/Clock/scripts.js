const hoursSection = document.querySelectorAll("#hours .number");
const minutesSection = document.querySelectorAll("#minutes .number");
const secondsSection = document.querySelectorAll("#seconds .number");

const states = [
	[1,2,3,4,5,6,8,9,10,11,12,13],
	[3,5,8,10,13],
	[1,2,3,5,6,7,8,9,11,12,13],
	[1,2,3,5,6,7,8,10,11,12,13],
	[1,3,4,5,6,7,8,10,13],
	[1,2,3,4,6,7,8,10,11,12,13],
	[1,2,3,4,6,7,8,9,10,11,12,13],
	[1,2,3,5,8,10,13],
	[1,2,3,4,5,6,7,8,9,10,11,12,13],
	[1,2,3,4,5,6,7,8,10,11,12,13],
];

setInterval(getTime, 1000);

function getTime() {
  const time = new Date();

  var hours = time.getHours();
  var minutes = time.getMinutes();
  var seconds = time.getSeconds();

  hours = (hours < 10 ? `0${hours}` : hours).toString().split('');
  minutes = (minutes < 10 ? `0${minutes}` : minutes).toString().split('');
  seconds = (seconds < 10 ? `0${seconds}` : seconds).toString().split('');

  displayNumber(hoursSection[0], hours[0]);
  displayNumber(hoursSection[1], hours[1]);

  displayNumber(minutesSection[0], minutes[0]);
  displayNumber(minutesSection[1], minutes[1]);

  displayNumber(secondsSection[0], seconds[0]);
  displayNumber(secondsSection[1], seconds[1]);

  chageBackGroundColor();
}

function displayNumber(section, number) {
  const pieces = section.querySelectorAll(".piece");

  pieces.forEach((piece, idx) => {
    if (states[number].includes(idx + 1)) {
      piece.classList.remove("hide");
      piece.classList.add("show");
    } else {
      piece.classList.remove("show");
      piece.classList.add("hide");
    }
  });
}

function chageBackGroundColor() {
  var r = Math.floor(Math.random() * 150) + 50;
  var g = Math.floor(Math.random() * 150) + 50;
  var b = Math.floor(Math.random() * 150) + 50;
  document.body.style.backgroundColor = `rgb(${r}, ${g}, ${b})`;
}
