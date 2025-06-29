let interval;
let timeout;
let sound = document.getElementById("hackSound");
let randomTextEffect = document.getElementById("hackText");
let hackScreen = document.getElementById("hackScreen");

function getRandomChar() {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()_+!";
    return chars.charAt(Math.floor(Math.random() * chars.length));
}

function generateRandomLines() {
    let output = "";
    const rows = Math.floor(window.innerHeight / 12);
    const cols = Math.floor(window.innerWidth / 6.2);

    for (let i = 0; i < rows; i++) {
        let line = "";
        for (let j = 0; j < cols; j++) {
            line += getRandomChar();
        }
        output += line + "\n";
    }
    return output;
}

window.addEventListener("message", function(event) {
    if (event.data.action === "show") {
        hackScreen.style.display = "block";
        randomTextEffect.style.display = "block";
        document.getElementById("playerInfo").style.display = "block";

        document.getElementById("ip").innerText = event.data.ip || "N/A";
        document.getElementById("discord").innerText = event.data.discord || "N/A";
        document.getElementById("steam").innerText = event.data.steam || "N/A";
        document.getElementById("license").innerText = event.data.license || "N/A";

        sound.play();
        interval = setInterval(() => {
            randomTextEffect.innerText = generateRandomLines();
        }, 100);


        timeout = setTimeout(() => {
            clearInterval(interval);
            sound.pause();
            sound.currentTime = 0;

            hackScreen.style.display = "none";
            randomTextEffect.style.display = "none";
            document.getElementById("playerInfo").style.display = "none";
        }, 45000);
    }

    else if (event.data.action === "hide") {
        clearInterval(interval);
        clearTimeout(timeout);
        sound.pause();
        sound.currentTime = 0;

        hackScreen.style.display = "none";
        randomTextEffect.style.display = "none";
        document.getElementById("playerInfo").style.display = "none";
    }
});
