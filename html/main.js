// Copyright 2022 © aymannajim (AN Services)
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

//// Made By https://aymantv.tebex.io/
//// For Support, Join my Discord: https://discord.gg/f2Nbv9Ebf5
//// For custom services or help, check my Fiverr: https://www.fiverr.com/aymannajim

let currentMenuAction

$(document).ready(function(){
	window.addEventListener('message', function(event) {
		let item = event.data
		if (item.action == 'showDialog') {
			playOpenSound()
			handleDialog(item)
		}
	});
	$('#close').click(function () {
		playCloseSound()
		// console.log('close clicked')
		$.post('https://an_dialogBox/exit', JSON.stringify({}));
		$('#container').hide()
		currentMenuAction = null
	});
});

function playOpenSound() {
  var soundO = new Audio('sound_open.mp3');
  soundO.volume = 0.5;
  soundO.play();
}

function playCloseSound() {
  var soundC = new Audio('sound_close.mp3');
  soundC.volume = 0.4;
  soundC.play();
}

function playSubmitSound() {
  var soundS = new Audio('sound_submit.mp3');
  soundS.volume = 0.5;
  soundS.play();
}

function handleDialog(item) {
    $('#container').show()
    $('#input').val(item.defaultInput)
    $('#dialogLabel').html(item.label)
    $('#hint').text(item.helpText)
	currentMenuAction = item.menuAction
}

$(document).keyup(function (event) {
	if (event.which == 27) {
		console.log('escaped')
		playCloseSound()
		$.post('https://an_dialogBox/exit', JSON.stringify({}));
		$('#container').hide();
		currentMenuAction = null
		return
	} /**else if (event.which === 13) {
		$( "#butt" ).trigger( "click" );
	}**/
});

$(document).submit(function( event ) {
	event.preventDefault();
	// console.log('submitted')
	playSubmitSound()
	// console.log('sound played')
	let dialog = $("#input").val()
	// console.log('creating dialog variable')
	const data = JSON.stringify({ text: dialog, currMA: currentMenuAction })
	// console.log('creating data json object')
	$.post('https://an_dialogBox/submit', data);
	// console.log('sending data...')
	currentMenuAction = null
	$('#container').hide()
	// console.log('done')
});

//// Made By https://aymantv.tebex.io/
//// For Support, Join my Discord: https://discord.gg/f2Nbv9Ebf5
//// For custom services or help, check my Fiverr: https://www.fiverr.com/aymannajim
