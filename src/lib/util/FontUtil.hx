package lib.util;

import js.html.CanvasRenderingContext2D;
import js.html.*;
import js.Browser.document;
import js.Browser.window;
import lib.Global.*;

using StringTools;

class FontUtil {
	public function new() {}

	// TODO:
	//		2 fonts in one <link>
	// 		resize window and not end up with multiple <links>
	//		chaining? `ctx.embedFillText().color().multiline()`

	public static function fillText(ctx:CanvasRenderingContext2D, text:String, x:Float, y:Float, css:String, ?size:Int = 20) {
	}
	/**
	 * make sure to use Google fonts for this
	 * @param ctx
	 * @param text
	 * @param x
	 * @param y
	 * @param css
	 * @param size
	 */
	public static function centerFillText(ctx:CanvasRenderingContext2D, text:String, x:Float, y:Float, css:String, ?size:Int = 20) {
		ctx.font = '${size}px ${css.replace(';','')}';
		// seems to break something if css has `;`
		ctx.textAlign = "center";
		ctx.fillText(text, x, y);

		// trace( text, x, y, css, size);
	}

	/**
	 * [Description]
	 *
	 * @exampe
	 * 		FontUtil.embedGoogleFont('Press+Start+2P', onEmbedHandler);
	 *
	 * @param family	name given after `...css?family=` (example: Press+Start+2P)
	 * @param callback
	 * @param callbackArray
	 */
	public static function embedGoogleFont(family:String, ?callback:Dynamic, ?callbackArray:Array<Dynamic>) {
		// trace('embedGoogleFont');
		var _id =  'embededGoogleFonts';
		var _url = 'https://fonts.googleapis.com/css?family=';
		var link : LinkElement = cast document.getElementById(_id);
		if(link != null){
			var temp = link.href.replace(_url, '');
			family = temp + '|' + family;
		} else {
			link = document.createLinkElement();
		}
		if (callbackArray == null) callbackArray = [family];
		link.href = '${_url}${family}';
		link.rel = "stylesheet";
		link.id = _id;
		link.onload = function (){
			if (callback != null)
				Reflect.callMethod(callback, callback, callbackArray);
		}
		document.head.appendChild(link);
	}
}
