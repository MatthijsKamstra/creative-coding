package lib.html;

import js.Browser.*;

class CSSinjector {

	public function new(?styles:String, ?elementID:String) {
		if (elementID == null) elementID = 'inject-' + Date.now().getTime();
		if (styles != null) setCSS(styles, elementID);
	}

	/**
	 * make sure the css is injected, but only once
	 *
	 * @param styles 		what styles you want to inject into the file
	 * @param elementID   	make sure we only inject once...
	 */
	function setCSS (styles:String, elementID:String){
		// trace('. setCSS ($styles, $elementID');

		styles = minify(styles);
		// trace(document.getElementById(elementID));

		var css = document.createStyleElement();
		css.id = elementID;

		// [mck] it seems that styleSheet isn't in the html externs from Haxe
		if (untyped css.styleSheet) untyped css.styleSheet.cssText = styles;
		else css.appendChild(document.createTextNode(styles));

		// [mck] maybe check this before adding
		document.getElementsByTagName("head")[0].appendChild(css);

		// trace(document.getElementById(elementID));
	}


	// https://stackoverflow.com/questions/4278739/regular-expression-for-clean-javascript-comments-of-type
	function minify (css:String) : String {
		// var regex =  // /\*(?:[^*]|\*+[^*/])*\*+/ (/* */)
		// return css.replace('  ', ' ').replace('\t', '').replace('\n', '');
		return css;
	}

}