(function toggle() {
   // write your js here.
	document.getElementById('output').classList.toggle('hide');
	console.log(document.getElementById('output').classList);
	setInterval(toggle, 2000);
}());

