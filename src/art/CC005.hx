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
 * create grid, show all version illustration
 */
class CC005 extends CCBase implements ICCBase {
	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function init() {
		trace('init: ${toString()}');
		var padding = 100;
		var arr:Array<Point> = GridUtil.create(padding, padding, w - (2 * padding), h - (2 * padding), 3, 4);
		// console.table(arr);
		for (i in 0...arr.length) {
			var point:Point = arr[i];
			ctx.registerPoint(point.x, point.y);
		}

		var _size = 50;
		var _width = _size;
		var _height = 25;
		ctx.colour(NAVY.r, NAVY.g, NAVY.b,0.5);

		var point = arr[0];
		ctx.centreFillRect(point.x, point.y, _size, _size);

		var point = arr[1];
		ctx.circle(point.x, point.y, _size);

		var point = arr[2];
		ctx.fillEllipse(point.x, point.y, _width, _height);

		var point = arr[3];
		// ctx.lineWidth = 10;
		ctx.lineColour(NAVY.r, NAVY.g, NAVY.b,0.5);
		ctx.line(point.x, point.y, point.x+_width, point.y+_height);

		var point = arr[4];
		ctx.fillTriangle(point.x, point.y-_height, point.x-_width, point.y-_height, point.x+_width, point.y+_height);

		var point = arr[5];
		ctx.fillPolygon(point.x, point.y, 8, _size);

		var point = arr[6];
		ctx.fillPolygon(point.x, point.y, 3, _size);

		var point = arr[7];
		ctx.eqDownFillTriangle(point.x, point.y, _size);

		var point = arr[8];
		ctx.eqDownTriangle(point.x, point.y, _size);

		var point = arr[9];
		ctx.roundRect(point.x, point.y,100, 100, 10);
	}

	override function draw() {
		stop();
	}
}