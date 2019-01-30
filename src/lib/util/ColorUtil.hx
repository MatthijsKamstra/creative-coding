package lib.util;

class ColorUtil {
	public function new() {	}

	static public function getColour(r:Int, ?g:Int, ?b:Int, ?a:Float):String{
		var c;
		if (g == null) {
			c = rgb(r, r, r);
		} else if (b == null && a == null) {
			c = rgba(r, r, r, g);
		} else if (a == null) {
			c = rgb(r, g, b);
		} else {
			c = rgba(r, g, b, a);
		}
		return (c);
	};

	static public function getColourObj(rgb:RGB) {
		return getColour(rgb.r,rgb.g,rgb.b);
	}

	/**
	 * use RGB values to create color
	 * @param r red (max:255, min:0)
	 * @param g green (max:255, min:0)
	 * @param b blue (max:255, min:0)
	 */
	static public function rgb(r:Int, ?g:Int, ?b:Int):String {
		if (g == null)
			g = r;
		if (b == null)
			b = r;
		return 'rgb(' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(Math.round(g), 0, 255) + ', ' + MathUtil.clamp(Math.round(b), 0, 255) + ')';
	};

	static public function rgba(r, ?g, ?b, ?a) {
		if (g == null) {
			return  'rgb(' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(Math.round(r), 0, 255) + ')';
		} else if (b == null) {
			return 'rgba(' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(g, 0, 1) + ')';
		} else if (a == null) {
			return 'rgba(' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(Math.round(g), 0, 255) + ', ' + MathUtil.clamp(Math.round(b), 0, 255) + ', 1)';
		} else {
			return 'rgba(' + MathUtil.clamp(Math.round(r), 0, 255) + ', ' + MathUtil.clamp(Math.round(g), 0, 255) + ', ' + MathUtil.clamp(Math.round(b), 0, 255) + ', ' + MathUtil.clamp(a, 0, 1) + ')';
		}
	};

	public static function rgb2hex(r : Int, g : Int, b : Int, a : Int = 255) : Int {
		return (a << 24) | (r << 16) | (g << 8) | b;
	}


	/**
	 * get a random rgb color
	 * @return String
	 */
	static public function randomColour():String {
		var r = MathUtil.randomInt(255);
		var g = MathUtil.randomInt(255);
		var b = MathUtil.randomInt(255);
		return ColorUtil.rgb(r, g, b);
	}

	static public function randomColourObject():RGB {
		var r = MathUtil.randomInt(255);
		var g = MathUtil.randomInt(255);
		var b = MathUtil.randomInt(255);
		return {
			r:r,
			g:g,
			b:b
		};
	}

	// public static function hex2css( color : Int ) : String {
	// 	return "#" + color.toString(16);
	// }

	/**
	*	@example		var _color = ColorUtil.hex2rgb(0xff3333);
	*					trace("_color.r: " + _color.r);
	*
	*/
	// static function hexToRgb(hex:Int):RGBObject {
	// 	var bigint = parseInt(hex, 16);
	// 	var _r = (bigint >> 16) & 255;
	// 	var _g = (bigint >> 8) & 255;
	// 	var _b = bigint & 255;

	// 	return {r:_r, g:_g, b:_b};
	// 	// return r + "," + g + "," + b;
	// }


	// http://old.haxe.org/doc/snip/colorconverter
	public static inline function toRGB(int:Int) : RGBObject {
        return {
            r: Math.round(((int >> 16) & 255)),
            g: Math.round(((int >> 8) & 255)),
            b: Math.round((int & 255)),
        }
    }

	public static inline function ttoRGB(int:Int) : RGB {
        return {
            r: ((int >> 16) & 255),
            g: ((int >> 8) & 255),
            b: (int & 255),
        }
    }


	// public static var BLACK : RGBObject = {r:0, g:0, b:0};
	// public static var WHITE : RGBObject = {r:255, g:255, b:255};
	// public static var RED : RGBObject = {r:255, g:0, b:0};

	// https://clrs.cc/
	public static var NAVY : RGBObject = toRGB (0x001f3f);
	public static var BLUE : RGBObject = toRGB (0x0074D9);
	public static var AQUA : RGBObject = toRGB (0x7FDBFF);
	public static var TEAL : RGBObject = toRGB (0x39CCCC);
	public static var OLIVE : RGBObject = toRGB (0x3D9970);
	public static var GREEN : RGBObject = toRGB (0x2ECC40);
	public static var LIME : RGBObject = toRGB (0x01FF70);
	public static var YELLOW : RGBObject = toRGB (0xFFDC00);
	public static var ORANGE : RGBObject = toRGB (0xFF851B);
	public static var RED : RGBObject = toRGB (0xFF4136);
	public static var MAROON : RGBObject = toRGB (0x85144b);
	public static var FUCHSIA : RGBObject = toRGB (0xF012BE);
	public static var PURPLE : RGBObject = toRGB (0xB10DC9);
	public static var BLACK : RGBObject = toRGB (0x111111);
	public static var GRAY : RGBObject = toRGB (0xAAAAAA);
	public static var SILVER : RGBObject = toRGB (0xDDDDDD);
	public static var WHITE : RGBObject = toRGB (0xFFFFFF);

	// [mck] my favourite debug color
	public static var PINK : RGBObject = toRGB (0xFF1493); // deeppink
	public static var PINK_DEEP : RGBObject = toRGB (0xFF1493); // deeppink
	public static var PINK_HOT : RGBObject = toRGB (0xff69B4); // hotpink


}
typedef RGBObject = {
	var r : Int;
	var g : Int;
	var b : Int;
};
typedef RGB = {
	var r : Int;
	var g : Int;
	var b : Int;
};