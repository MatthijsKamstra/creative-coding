package lib.html;

import js.Browser.*;
import lib.html.*;

using StringTools;

class Snackbar extends CSSinjector {

	var timeout : Int;
	var bottomIn : Int = 0; //px;
	var bottomOut : Int = -50; //px;
	/**
	 * @example:
	 * 		var snackbar = new html.Snackbar();
	 * 		snackbar.show('Welcome! Choose!');
	 *
	 */
	public function new() {
		super();
		// var _css = css() + CSSAnimation.CSSAnimations.getAnimation();
		var _css = css();
		setCSS(_css, 'inject-snackbar');
	}

	public function show(msg:String) {

		// Get the snackbar DIV
		var x = document.getElementById("snackbar");

		// if no #snackbar exists, create it
		if(x == null){
			var div = document.createDivElement();
			div.id = 'snackbar';
			document.body.appendChild(div);
			x = div;
		}

		// set msg to snackbar
		x.innerText = msg;

		// Add the "show" class to DIV
		x.className = "show";

		// After 3 seconds, remove the show class from DIV
		js.Browser.window.clearTimeout(timeout);
		timeout = js.Browser.window.setTimeout(function(){
			x.className = x.className.replace("show", "");
		}, 3000);

	}

	function css ():String{
		return '
/* https://www.w3schools.com/howto/howto_js_snackbar.asp */
/* The snackbar - position it at the bottom and in the middle of the screen */
#snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 250px; /* Set a default minimum width */
    margin-left: -125px; /* Divide value of min-width by 2 */
    background-color: #333; /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 5px 5px 0 0; /* Rounded borders */
    padding: 10px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 1; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    bottom: ${bottomIn}px; /* ${bottomIn}px from the bottom */
    font-size: 13px;
	opacity: 0.5;
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
    visibility: visible; /* Show the snackbar */

	/* Add animation: Take 0.5 seconds to fade in and out the snackbar.
	However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
    from {bottom: ${bottomOut}px; opacity: 0;}
    to {bottom: ${bottomIn}px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: ${bottomOut}px; opacity: 0;}
    to {bottom: ${bottomIn}px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: ${bottomIn}px; opacity: 1;}
    to {bottom: ${bottomOut}px; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: ${bottomIn}px; opacity: 1;}
    to {bottom: ${bottomOut}px; opacity: 0;}
}
		';
	}

}