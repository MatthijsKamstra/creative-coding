package lib.html;

import js.Browser.*;
import lib.html.*;

using StringTools;

class Nav extends CSSinjector {

	var timeout : Int;
	var bottomIn : Int = 0; //px;
	var bottomOut : Int = -50; //px;
	/**
	 * @example:
	 * 		var snackbar = new html.Nav();
	 */
	public function new() {
		super();
		var _css = css();
		setCSS(_css, 'inject-nav');
	}

	public function dir(dir:String) {
		// Get the nav DIV
		var x = document.getElementById('nav-$dir');
		// if no #snackbar exists, create it
		if(x == null){
			var div = document.createDivElement();
			div.id = 'nav-$dir';
			div.className = 'nav nav-$dir';
			document.body.appendChild(div);
			x = div;
		}

		if(dir == 'left'){

		} else {
			// right
		}
	}

	function css ():String{
		return '
.nav {
	display: none;
	width: 80px;
	height: 80px;
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
    position: fixed;
    z-index: 1;
    top: 50%;
    font-size: 13px;
    opacity: 0.5;
	margin-top: -40px;
}
.nav-left{
    left: 0%;
    border-radius: 0 5px 5px 0;
}
.nav-right{
    right: 0%;
    border-radius: 5px 0 0 5px;
}
';

	}
}