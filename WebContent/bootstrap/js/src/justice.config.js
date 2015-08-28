function justiceInit() {
	Justice.init();
};

// Need timeout for some reason
window.setTimeout( function() {
	justiceInit();
}, 1);