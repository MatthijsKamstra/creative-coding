package lib.util;

using StringTools;

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

	static public function getColourObj(rgb:RGB):String {
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

	static public function rgba(r, ?g, ?b, ?a) : String {
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
	public static inline function hex2RGB(hex:String) : RGB {
		var int = Std.parseInt(hex.replace('#', '0x'));
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

	// 500 and 1000 are to big for most ide... but do you really need that much color combinations?
	public static var niceColor100 : Array<Array<String>> = [["#69d2e7","#a7dbd8","#e0e4cc","#f38630","#fa6900"],["#fe4365","#fc9d9a","#f9cdad","#c8c8a9","#83af9b"],["#ecd078","#d95b43","#c02942","#542437","#53777a"],["#556270","#4ecdc4","#c7f464","#ff6b6b","#c44d58"],["#774f38","#e08e79","#f1d4af","#ece5ce","#c5e0dc"],["#e8ddcb","#cdb380","#036564","#033649","#031634"],["#490a3d","#bd1550","#e97f02","#f8ca00","#8a9b0f"],["#594f4f","#547980","#45ada8","#9de0ad","#e5fcc2"],["#00a0b0","#6a4a3c","#cc333f","#eb6841","#edc951"],["#e94e77","#d68189","#c6a49a","#c6e5d9","#f4ead5"],["#3fb8af","#7fc7af","#dad8a7","#ff9e9d","#ff3d7f"],["#d9ceb2","#948c75","#d5ded9","#7a6a53","#99b2b7"],["#ffffff","#cbe86b","#f2e9e1","#1c140d","#cbe86b"],["#efffcd","#dce9be","#555152","#2e2633","#99173c"],["#343838","#005f6b","#008c9e","#00b4cc","#00dffc"],["#413e4a","#73626e","#b38184","#f0b49e","#f7e4be"],["#ff4e50","#fc913a","#f9d423","#ede574","#e1f5c4"],["#99b898","#fecea8","#ff847c","#e84a5f","#2a363b"],["#655643","#80bca3","#f6f7bd","#e6ac27","#bf4d28"],["#00a8c6","#40c0cb","#f9f2e7","#aee239","#8fbe00"],["#351330","#424254","#64908a","#e8caa4","#cc2a41"],["#554236","#f77825","#d3ce3d","#f1efa5","#60b99a"],["#ff9900","#424242","#e9e9e9","#bcbcbc","#3299bb"],["#5d4157","#838689","#a8caba","#cad7b2","#ebe3aa"],["#8c2318","#5e8c6a","#88a65e","#bfb35a","#f2c45a"],["#fad089","#ff9c5b","#f5634a","#ed303c","#3b8183"],["#ff4242","#f4fad2","#d4ee5e","#e1edb9","#f0f2eb"],["#d1e751","#ffffff","#000000","#4dbce9","#26ade4"],["#f8b195","#f67280","#c06c84","#6c5b7b","#355c7d"],["#1b676b","#519548","#88c425","#bef202","#eafde6"],["#bcbdac","#cfbe27","#f27435","#f02475","#3b2d38"],["#5e412f","#fcebb6","#78c0a8","#f07818","#f0a830"],["#452632","#91204d","#e4844a","#e8bf56","#e2f7ce"],["#eee6ab","#c5bc8e","#696758","#45484b","#36393b"],["#f0d8a8","#3d1c00","#86b8b1","#f2d694","#fa2a00"],["#f04155","#ff823a","#f2f26f","#fff7bd","#95cfb7"],["#2a044a","#0b2e59","#0d6759","#7ab317","#a0c55f"],["#bbbb88","#ccc68d","#eedd99","#eec290","#eeaa88"],["#b9d7d9","#668284","#2a2829","#493736","#7b3b3b"],["#b3cc57","#ecf081","#ffbe40","#ef746f","#ab3e5b"],["#a3a948","#edb92e","#f85931","#ce1836","#009989"],["#67917a","#170409","#b8af03","#ccbf82","#e33258"],["#e8d5b7","#0e2430","#fc3a51","#f5b349","#e8d5b9"],["#aab3ab","#c4cbb7","#ebefc9","#eee0b7","#e8caaf"],["#300030","#480048","#601848","#c04848","#f07241"],["#ab526b","#bca297","#c5ceae","#f0e2a4","#f4ebc3"],["#607848","#789048","#c0d860","#f0f0d8","#604848"],["#a8e6ce","#dcedc2","#ffd3b5","#ffaaa6","#ff8c94"],["#3e4147","#fffedf","#dfba69","#5a2e2e","#2a2c31"],["#b6d8c0","#c8d9bf","#dadabd","#ecdbbc","#fedcba"],["#fc354c","#29221f","#13747d","#0abfbc","#fcf7c5"],["#1c2130","#028f76","#b3e099","#ffeaad","#d14334"],["#edebe6","#d6e1c7","#94c7b6","#403b33","#d3643b"],["#cc0c39","#e6781e","#c8cf02","#f8fcc1","#1693a7"],["#dad6ca","#1bb0ce","#4f8699","#6a5e72","#563444"],["#a7c5bd","#e5ddcb","#eb7b59","#cf4647","#524656"],["#fdf1cc","#c6d6b8","#987f69","#e3ad40","#fcd036"],["#5c323e","#a82743","#e15e32","#c0d23e","#e5f04c"],["#230f2b","#f21d41","#ebebbc","#bce3c5","#82b3ae"],["#b9d3b0","#81bda4","#b28774","#f88f79","#f6aa93"],["#3a111c","#574951","#83988e","#bcdea5","#e6f9bc"],["#5e3929","#cd8c52","#b7d1a3","#dee8be","#fcf7d3"],["#1c0113","#6b0103","#a30006","#c21a01","#f03c02"],["#382f32","#ffeaf2","#fcd9e5","#fbc5d8","#f1396d"],["#e3dfba","#c8d6bf","#93ccc6","#6cbdb5","#1a1f1e"],["#000000","#9f111b","#b11623","#292c37","#cccccc"],["#c1b398","#605951","#fbeec2","#61a6ab","#accec0"],["#8dccad","#988864","#fea6a2","#f9d6ac","#ffe9af"],["#f6f6f6","#e8e8e8","#333333","#990100","#b90504"],["#1b325f","#9cc4e4","#e9f2f9","#3a89c9","#f26c4f"],["#5e9fa3","#dcd1b4","#fab87f","#f87e7b","#b05574"],["#951f2b","#f5f4d7","#e0dfb1","#a5a36c","#535233"],["#413d3d","#040004","#c8ff00","#fa023c","#4b000f"],["#eff3cd","#b2d5ba","#61ada0","#248f8d","#605063"],["#2d2d29","#215a6d","#3ca2a2","#92c7a3","#dfece6"],["#cfffdd","#b4dec1","#5c5863","#a85163","#ff1f4c"],["#4e395d","#827085","#8ebe94","#ccfc8e","#dc5b3e"],["#9dc9ac","#fffec7","#f56218","#ff9d2e","#919167"],["#a1dbb2","#fee5ad","#faca66","#f7a541","#f45d4c"],["#ffefd3","#fffee4","#d0ecea","#9fd6d2","#8b7a5e"],["#a8a7a7","#cc527a","#e8175d","#474747","#363636"],["#ffedbf","#f7803c","#f54828","#2e0d23","#f8e4c1"],["#f8edd1","#d88a8a","#474843","#9d9d93","#c5cfc6"],["#f38a8a","#55443d","#a0cab5","#cde9ca","#f1edd0"],["#4e4d4a","#353432","#94ba65","#2790b0","#2b4e72"],["#0ca5b0","#4e3f30","#fefeeb","#f8f4e4","#a5b3aa"],["#a70267","#f10c49","#fb6b41","#f6d86b","#339194"],["#9d7e79","#ccac95","#9a947c","#748b83","#5b756c"],["#edf6ee","#d1c089","#b3204d","#412e28","#151101"],["#046d8b","#309292","#2fb8ac","#93a42a","#ecbe13"],["#4d3b3b","#de6262","#ffb88c","#ffd0b3","#f5e0d3"],["#fffbb7","#a6f6af","#66b6ab","#5b7c8d","#4f2958"],["#ff003c","#ff8a00","#fabe28","#88c100","#00c176"],["#fcfef5","#e9ffe1","#cdcfb7","#d6e6c3","#fafbe3"],["#9cddc8","#bfd8ad","#ddd9ab","#f7af63","#633d2e"],["#30261c","#403831","#36544f","#1f5f61","#0b8185"],["#d1313d","#e5625c","#f9bf76","#8eb2c5","#615375"],["#ffe181","#eee9e5","#fad3b2","#ffba7f","#ff9c97"],["#aaff00","#ffaa00","#ff00aa","#aa00ff","#00aaff"],["#c2412d","#d1aa34","#a7a844","#a46583","#5a1e4a"]];
	public static var niceColor200 : Array<Array<String>> = [["#69d2e7","#a7dbd8","#e0e4cc","#f38630","#fa6900"],["#fe4365","#fc9d9a","#f9cdad","#c8c8a9","#83af9b"],["#ecd078","#d95b43","#c02942","#542437","#53777a"],["#556270","#4ecdc4","#c7f464","#ff6b6b","#c44d58"],["#774f38","#e08e79","#f1d4af","#ece5ce","#c5e0dc"],["#e8ddcb","#cdb380","#036564","#033649","#031634"],["#490a3d","#bd1550","#e97f02","#f8ca00","#8a9b0f"],["#594f4f","#547980","#45ada8","#9de0ad","#e5fcc2"],["#00a0b0","#6a4a3c","#cc333f","#eb6841","#edc951"],["#e94e77","#d68189","#c6a49a","#c6e5d9","#f4ead5"],["#3fb8af","#7fc7af","#dad8a7","#ff9e9d","#ff3d7f"],["#d9ceb2","#948c75","#d5ded9","#7a6a53","#99b2b7"],["#ffffff","#cbe86b","#f2e9e1","#1c140d","#cbe86b"],["#efffcd","#dce9be","#555152","#2e2633","#99173c"],["#343838","#005f6b","#008c9e","#00b4cc","#00dffc"],["#413e4a","#73626e","#b38184","#f0b49e","#f7e4be"],["#ff4e50","#fc913a","#f9d423","#ede574","#e1f5c4"],["#99b898","#fecea8","#ff847c","#e84a5f","#2a363b"],["#655643","#80bca3","#f6f7bd","#e6ac27","#bf4d28"],["#00a8c6","#40c0cb","#f9f2e7","#aee239","#8fbe00"],["#351330","#424254","#64908a","#e8caa4","#cc2a41"],["#554236","#f77825","#d3ce3d","#f1efa5","#60b99a"],["#ff9900","#424242","#e9e9e9","#bcbcbc","#3299bb"],["#5d4157","#838689","#a8caba","#cad7b2","#ebe3aa"],["#8c2318","#5e8c6a","#88a65e","#bfb35a","#f2c45a"],["#fad089","#ff9c5b","#f5634a","#ed303c","#3b8183"],["#ff4242","#f4fad2","#d4ee5e","#e1edb9","#f0f2eb"],["#d1e751","#ffffff","#000000","#4dbce9","#26ade4"],["#f8b195","#f67280","#c06c84","#6c5b7b","#355c7d"],["#1b676b","#519548","#88c425","#bef202","#eafde6"],["#bcbdac","#cfbe27","#f27435","#f02475","#3b2d38"],["#5e412f","#fcebb6","#78c0a8","#f07818","#f0a830"],["#452632","#91204d","#e4844a","#e8bf56","#e2f7ce"],["#eee6ab","#c5bc8e","#696758","#45484b","#36393b"],["#f0d8a8","#3d1c00","#86b8b1","#f2d694","#fa2a00"],["#f04155","#ff823a","#f2f26f","#fff7bd","#95cfb7"],["#2a044a","#0b2e59","#0d6759","#7ab317","#a0c55f"],["#bbbb88","#ccc68d","#eedd99","#eec290","#eeaa88"],["#b9d7d9","#668284","#2a2829","#493736","#7b3b3b"],["#b3cc57","#ecf081","#ffbe40","#ef746f","#ab3e5b"],["#a3a948","#edb92e","#f85931","#ce1836","#009989"],["#67917a","#170409","#b8af03","#ccbf82","#e33258"],["#e8d5b7","#0e2430","#fc3a51","#f5b349","#e8d5b9"],["#aab3ab","#c4cbb7","#ebefc9","#eee0b7","#e8caaf"],["#300030","#480048","#601848","#c04848","#f07241"],["#ab526b","#bca297","#c5ceae","#f0e2a4","#f4ebc3"],["#607848","#789048","#c0d860","#f0f0d8","#604848"],["#a8e6ce","#dcedc2","#ffd3b5","#ffaaa6","#ff8c94"],["#3e4147","#fffedf","#dfba69","#5a2e2e","#2a2c31"],["#b6d8c0","#c8d9bf","#dadabd","#ecdbbc","#fedcba"],["#fc354c","#29221f","#13747d","#0abfbc","#fcf7c5"],["#1c2130","#028f76","#b3e099","#ffeaad","#d14334"],["#edebe6","#d6e1c7","#94c7b6","#403b33","#d3643b"],["#cc0c39","#e6781e","#c8cf02","#f8fcc1","#1693a7"],["#dad6ca","#1bb0ce","#4f8699","#6a5e72","#563444"],["#a7c5bd","#e5ddcb","#eb7b59","#cf4647","#524656"],["#fdf1cc","#c6d6b8","#987f69","#e3ad40","#fcd036"],["#5c323e","#a82743","#e15e32","#c0d23e","#e5f04c"],["#230f2b","#f21d41","#ebebbc","#bce3c5","#82b3ae"],["#b9d3b0","#81bda4","#b28774","#f88f79","#f6aa93"],["#3a111c","#574951","#83988e","#bcdea5","#e6f9bc"],["#5e3929","#cd8c52","#b7d1a3","#dee8be","#fcf7d3"],["#1c0113","#6b0103","#a30006","#c21a01","#f03c02"],["#382f32","#ffeaf2","#fcd9e5","#fbc5d8","#f1396d"],["#e3dfba","#c8d6bf","#93ccc6","#6cbdb5","#1a1f1e"],["#000000","#9f111b","#b11623","#292c37","#cccccc"],["#c1b398","#605951","#fbeec2","#61a6ab","#accec0"],["#8dccad","#988864","#fea6a2","#f9d6ac","#ffe9af"],["#f6f6f6","#e8e8e8","#333333","#990100","#b90504"],["#1b325f","#9cc4e4","#e9f2f9","#3a89c9","#f26c4f"],["#5e9fa3","#dcd1b4","#fab87f","#f87e7b","#b05574"],["#951f2b","#f5f4d7","#e0dfb1","#a5a36c","#535233"],["#413d3d","#040004","#c8ff00","#fa023c","#4b000f"],["#eff3cd","#b2d5ba","#61ada0","#248f8d","#605063"],["#2d2d29","#215a6d","#3ca2a2","#92c7a3","#dfece6"],["#cfffdd","#b4dec1","#5c5863","#a85163","#ff1f4c"],["#4e395d","#827085","#8ebe94","#ccfc8e","#dc5b3e"],["#9dc9ac","#fffec7","#f56218","#ff9d2e","#919167"],["#a1dbb2","#fee5ad","#faca66","#f7a541","#f45d4c"],["#ffefd3","#fffee4","#d0ecea","#9fd6d2","#8b7a5e"],["#a8a7a7","#cc527a","#e8175d","#474747","#363636"],["#ffedbf","#f7803c","#f54828","#2e0d23","#f8e4c1"],["#f8edd1","#d88a8a","#474843","#9d9d93","#c5cfc6"],["#f38a8a","#55443d","#a0cab5","#cde9ca","#f1edd0"],["#4e4d4a","#353432","#94ba65","#2790b0","#2b4e72"],["#0ca5b0","#4e3f30","#fefeeb","#f8f4e4","#a5b3aa"],["#a70267","#f10c49","#fb6b41","#f6d86b","#339194"],["#9d7e79","#ccac95","#9a947c","#748b83","#5b756c"],["#edf6ee","#d1c089","#b3204d","#412e28","#151101"],["#046d8b","#309292","#2fb8ac","#93a42a","#ecbe13"],["#4d3b3b","#de6262","#ffb88c","#ffd0b3","#f5e0d3"],["#fffbb7","#a6f6af","#66b6ab","#5b7c8d","#4f2958"],["#ff003c","#ff8a00","#fabe28","#88c100","#00c176"],["#fcfef5","#e9ffe1","#cdcfb7","#d6e6c3","#fafbe3"],["#9cddc8","#bfd8ad","#ddd9ab","#f7af63","#633d2e"],["#30261c","#403831","#36544f","#1f5f61","#0b8185"],["#d1313d","#e5625c","#f9bf76","#8eb2c5","#615375"],["#ffe181","#eee9e5","#fad3b2","#ffba7f","#ff9c97"],["#aaff00","#ffaa00","#ff00aa","#aa00ff","#00aaff"],["#c2412d","#d1aa34","#a7a844","#a46583","#5a1e4a"],["#75616b","#bfcff7","#dce4f7","#f8f3bf","#d34017"],["#805841","#dcf7f3","#fffcdd","#ffd8d8","#f5a2a2"],["#379f7a","#78ae62","#bbb749","#e0fbac","#1f1c0d"],["#73c8a9","#dee1b6","#e1b866","#bd5532","#373b44"],["#caff42","#ebf7f8","#d0e0eb","#88abc2","#49708a"],["#7e5686","#a5aad9","#e8f9a2","#f8a13f","#ba3c3d"],["#82837e","#94b053","#bdeb07","#bffa37","#e0e0e0"],["#111625","#341931","#571b3c","#7a1e48","#9d2053"],["#312736","#d4838f","#d6abb1","#d9d9d9","#c4ffeb"],["#84b295","#eccf8d","#bb8138","#ac2005","#2c1507"],["#395a4f","#432330","#853c43","#f25c5e","#ffa566"],["#fde6bd","#a1c5ab","#f4dd51","#d11e48","#632f53"],["#6da67a","#77b885","#86c28b","#859987","#4a4857"],["#bed6c7","#adc0b4","#8a7e66","#a79b83","#bbb2a1"],["#058789","#503d2e","#d54b1a","#e3a72f","#f0ecc9"],["#e21b5a","#9e0c39","#333333","#fbffe3","#83a300"],["#261c21","#6e1e62","#b0254f","#de4126","#eb9605"],["#b5ac01","#ecba09","#e86e1c","#d41e45","#1b1521"],["#efd9b4","#d6a692","#a39081","#4d6160","#292522"],["#fbc599","#cdbb93","#9eae8a","#335650","#f35f55"],["#c75233","#c78933","#d6ceaa","#79b5ac","#5e2f46"],["#793a57","#4d3339","#8c873e","#d1c5a5","#a38a5f"],["#f2e3c6","#ffc6a5","#e6324b","#2b2b2b","#353634"],["#512b52","#635274","#7bb0a8","#a7dbab","#e4f5b1"],["#59b390","#f0ddaa","#e47c5d","#e32d40","#152b3c"],["#fdffd9","#fff0b8","#ffd6a3","#faad8e","#142f30"],["#11766d","#410936","#a40b54","#e46f0a","#f0b300"],["#11644d","#a0b046","#f2c94e","#f78145","#f24e4e"],["#c7fcd7","#d9d5a7","#d9ab91","#e6867a","#ed4a6a"],["#595643","#4e6b66","#ed834e","#ebcc6e","#ebe1c5"],["#331327","#991766","#d90f5a","#f34739","#ff6e27"],["#bf496a","#b39c82","#b8c99d","#f0d399","#595151"],["#f1396d","#fd6081","#f3ffeb","#acc95f","#8f9924"],["#efeecc","#fe8b05","#fe0557","#400403","#0aabba"],["#e5eaa4","#a8c4a2","#69a5a4","#616382","#66245b"],["#e9e0d1","#91a398","#33605a","#070001","#68462b"],["#e4ded0","#abccbd","#7dbeb8","#181619","#e32f21"],["#e0eff1","#7db4b5","#ffffff","#680148","#000000"],["#b7cbbf","#8c886f","#f9a799","#f4bfad","#f5dabd"],["#ffb884","#f5df98","#fff8d4","#c0d1c2","#2e4347"],["#6da67a","#99a66d","#a9bd68","#b5cc6a","#c0de5d"],["#b1e6d1","#77b1a9","#3d7b80","#270a33","#451a3e"],["#fc284f","#ff824a","#fea887","#f6e7f7","#d1d0d7"],["#ffab07","#e9d558","#72ad75","#0e8d94","#434d53"],["#311d39","#67434f","#9b8e7e","#c3ccaf","#a51a41"],["#5cacc4","#8cd19d","#cee879","#fcb653","#ff5254"],["#44749d","#c6d4e1","#ffffff","#ebe7e0","#bdb8ad"],["#cfb590","#9e9a41","#758918","#564334","#49281f"],["#e4e4c5","#b9d48b","#8d2036","#ce0a31","#d3e4c5"],["#ccf390","#e0e05a","#f7c41f","#fc930a","#ff003d"],["#807462","#a69785","#b8faff","#e8fdff","#665c49"],["#ec4401","#cc9b25","#13cd4a","#7b6ed6","#5e525c"],["#cc5d4c","#fffec6","#c7d1af","#96b49c","#5b5847"],["#e3e8cd","#bcd8bf","#d3b9a3","#ee9c92","#fe857e"],["#360745","#d61c59","#e7d84b","#efeac5","#1b8798"],["#2b222c","#5e4352","#965d62","#c7956d","#f2d974"],["#e7edea","#ffc52c","#fb0c06","#030d4f","#ceecef"],["#eb9c4d","#f2d680","#f3ffcf","#bac9a9","#697060"],["#fff3db","#e7e4d5","#d3c8b4","#c84648","#703e3b"],["#f5dd9d","#bcc499","#92a68a","#7b8f8a","#506266"],["#f2e8c4","#98d9b6","#3ec9a7","#2b879e","#616668"],["#041122","#259073","#7fda89","#c8e98e","#e6f99d"],["#c6cca5","#8ab8a8","#6b9997","#54787d","#615145"],["#4b1139","#3b4058","#2a6e78","#7a907c","#c9b180"],["#8d7966","#a8a39d","#d8c8b8","#e2ddd9","#f8f1e9"],["#2d1b33","#f36a71","#ee887a","#e4e391","#9abc8a"],["#95a131","#c8cd3b","#f6f1de","#f5b9ae","#ee0b5b"],["#79254a","#795c64","#79927d","#aeb18e","#e3cf9e"],["#429398","#6b5d4d","#b0a18f","#dfcdb4","#fbeed3"],["#1d1313","#24b694","#d22042","#a3b808","#30c4c9"],["#9d9e94","#c99e93","#f59d92","#e5b8ad","#d5d2c8"],["#f0ffc9","#a9da88","#62997a","#72243d","#3b0819"],["#322938","#89a194","#cfc89a","#cc883a","#a14016"],["#452e3c","#ff3d5a","#ffb969","#eaf27e","#3b8c88"],["#f06d61","#da825f","#c4975c","#a8ab7b","#8cbf99"],["#540045","#c60052","#ff714b","#eaff87","#acffe9"],["#2b2726","#0a516d","#018790","#7dad93","#bacca4"],["#027b7f","#ffa588","#d62957","#bf1e62","#572e4f"],["#23192d","#fd0a54","#f57576","#febf97","#f5ecb7"],["#fa6a64","#7a4e48","#4a4031","#f6e2bb","#9ec6b8"],["#a3c68c","#879676","#6e6662","#4f364a","#340735"],["#f6d76b","#ff9036","#d6254d","#ff5475","#fdeba9"],["#80a8a8","#909d9e","#a88c8c","#ff0d51","#7a8c89"],["#a32c28","#1c090b","#384030","#7b8055","#bca875"],["#6d9788","#1e2528","#7e1c13","#bf0a0d","#e6e1c2"],["#373737","#8db986","#acce91","#badb73","#efeae4"],["#280904","#680e34","#9a151a","#c21b12","#fc4b2a"],["#fb6900","#f63700","#004853","#007e80","#00b9bd"],["#e6b39a","#e6cba5","#ede3b4","#8b9e9b","#6d7578"],["#641f5e","#676077","#65ac92","#c2c092","#edd48e"],["#a69e80","#e0ba9b","#e7a97e","#d28574","#3b1922"],["#161616","#c94d65","#e7c049","#92b35a","#1f6764"],["#234d20","#36802d","#77ab59","#c9df8a","#f0f7da"],["#4b3e4d","#1e8c93","#dbd8a2","#c4ac30","#d74f33"],["#ff7474","#f59b71","#c7c77f","#e0e0a8","#f1f1c1"],["#e6eba9","#abbb9f","#6f8b94","#706482","#703d6f"],["#26251c","#eb0a44","#f2643d","#f2a73d","#a0e8b7"],["#fdcfbf","#feb89f","#e23d75","#5f0d3b","#742365"],["#230b00","#a29d7f","#d4cfa5","#f8ecd4","#aabe9b"],["#85847e","#ab6a6e","#f7345b","#353130","#cbcfb4"]];
}
