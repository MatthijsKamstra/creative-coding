package util;

import js.html.CanvasRenderingContext2D;
import js.Browser.document;
import js.Browser.window;
import Global.*;

using StringTools;

class FontUtil {
	public function new() {}

	/**
	 * make sure to use Google fonts for this
	 * @param ctx
	 * @param text
	 * @param x
	 * @param y
	 * @param family
	 * @param fontFamily
	 */
	public static function embedFillText(ctx:CanvasRenderingContext2D, text:String, x:Float, y:Float, ?family:String = "Unica+One", ?fontFamily:String) {
		var cleanFamily = family.replace('+', ' ');

		var link = document.createLinkElement();
		link.href = 'https://fonts.googleapis.com/css?family=${family}';
		link.rel = "stylesheet";
		link.id = cleanFamily;
		document.body.appendChild(link);

		// [mck] this might needs some more testing
		window.addEventListener('load', function(e) {
			ctx.font = '20px "${cleanFamily}"';
			ctx.fillText(text, x, y);
		});
	}
}
