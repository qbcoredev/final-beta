const formContainer = document.getElementById('formContainer');
const newDoorForm = document.getElementById('newDoor');
const doorlockContainer = document.getElementById('container');
const doorlock = document.getElementById('doorlock');

var formInfo = {
    configname: document.getElementById('configname'),
    doorname: document.getElementById('doorname'),
    doortype: document.getElementById('doortype'),
    doorlocked: document.getElementById('doorlocked'),
    job1: document.getElementById('job1'),
    job2: document.getElementById('job2'),
    job3: document.getElementById('job3'),
    job4: document.getElementById('job4'),
    item: document.getElementById('item'),
}

window.addEventListener('message', ({ data }) => {
    if (data.type == "newDoorSetup") {
        data.enable ? formContainer.style.display = "flex" : formContainer.style.display = "none";
        data.enable ? doorlockContainer.style.display = "none" : doorlockContainer.style.display = "block";
    } else if (data.type == "audio") {
		var volume = (data.audio['volume'] / 10 ) * data.sfx
		if (data.distance !== 0) {
			var volume = volume / data.distance
		}
		var sound = new Audio('sounds/' + data.audio['file']);
		sound.volume = volume;
		sound.play();
    } else if (data.type == "display") {
        if (data.text !== undefined) {
            doorlock.style.display = 'block';
            doorlock.innerHTML = data.text;
            doorlock.classList.add('slide-in');
        }
    } else if (data.type == "hide") {
        doorlock.classList.add('slide-out');
        setTimeout(function() {
            doorlock.innerHTML = '';
            doorlock.style.display = 'none';
            doorlock.classList.remove('slide-in');
            doorlock.classList.remove('slide-out');
        }, 1000)
    }
})

document.addEventListener('keyup', (e) => {
    if (e.key == 'Escape') {
        sendNUICB('close');
    }
});

document.getElementById('newDoor').addEventListener('submit', (e) => {
    e.preventDefault();
    sendNUICB('newDoor', {
        configname: formInfo.configname.value,
        doorname: formInfo.doorname.value,
        doortype: formInfo.doortype.value,
        doorlocked: formInfo.doorlocked.checked,
        job1: formInfo.job1.value,
        job2: formInfo.job2.value,
        job3: formInfo.job3.value,
        job4: formInfo.job4.value,
        item: formInfo.item.value,
    });
})

function sendNUICB(event, data = {}, cb = () => {}) {
    fetch(`https://${GetParentResourceName()}/${event}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8', },
        body: JSON.stringify(data)
    }).then(resp => resp.json()).then(resp => cb(resp));
}
