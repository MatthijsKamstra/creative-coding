package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;
// easy access to Globals
import Global.*;
// easy access to the utils
import util.MathUtil.*;
import util.ColorUtil.*;
import util.AnimateUtil.*;
import util.GridUtil;
// easy access to typedef
import AST;

// syntactic sugar to extend CanvasRenderingContext2D
using CanvasTools;
using util.ShapeUtil;

/**
 * short description what this does
 */
class CC006 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		window.addEventListener(KEY_DOWN, function (e:js.html.KeyboardEvent){
			if (e.key == ' '){
				trace('redraw');
				init();
			}
		}, false);
	}

	override function init() {
		trace('init: ${toString()}');
		var _size = 50;
		var _x = 0;
		var _y = 0;
		var _numHor = Math.ceil(w / _size); // 100;
		var _numVer = Math.ceil(h / _size); // 100;
		var arr:Array<Point> = GridUtil.create(_x, _y, w - (2 * _x), h - (2 * _y), _numHor, _numVer);
		if (isDebug) ShapeUtil.gridRegister(ctx, arr);

		for (i in 0...arr.length) {
			var p:Point = arr[i];

			var c = util.ColorUtil.randomColour();
			ctx.fillStyle = c;
			ctx.strokeWeight (0);
			ctx.centreFillRect(p.x, p.y, _size, _size);
		}
	}

	override function draw() {
		trace('draw: ${toString()}');
		stop();
	}
}
