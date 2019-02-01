package lib.util;

import js.html.CanvasRenderingContext2D;
import lib.Global.*;
import lib.util.ColorUtil.*;
import lib.AST;

// syntactic sugar to extend CanvasRenderingContext2D
using lib.CanvasTools;

/**
 * predefined shapes that are every useful
 * @example:
 * 		using lib.CanvasTools;
 */
class ShapeUtil {

	/**
	 * [Description]
	 * @param ctx
	 * @param x
	 * @param y
	 * @param width
	 * @param height
	 */
	static public function cross(ctx:CanvasRenderingContext2D, x:Float, y:Float, ?width:Float = 20, ?height:Float = 60) {
		ctx.fillRect(x - width / 2, y - height / 2, width, height);
		ctx.fillRect(x - height / 2, y - width / 2, height, width);
	}
	static public function registerPoint(ctx:CanvasRenderingContext2D, x:Float, y:Float) {
		var _w = 10;
		var _h = 10;
		var _d = 2;
		ctx.colour(PINK.r, PINK.g, PINK.b, 1);
		ctx.fillRect(x - _w / 2, y-(_d/2), _w, _d);
		ctx.fillRect(x -(_d/2), y - _h / 2, _d, _h);
		// ctx.fillCircle(x,y,10);

		// trace('xxx');
	}
	/**
	 * centered x-shape
	 *
	 * @example
	 * 		ctx.xcross(w/2, h/2, 100, 20);
	 *
	 * @param ctx
	 * @param x			x pos, center of x-shape
	 * @param y			y pos, center of x-shape
	 * @param size		(optional) size shape, default:200
	 * @param weight	(optional) stroke weight, default:100
	 */
	public static function xcross(ctx:CanvasRenderingContext2D, x:Float, y:Float, ?size:Float = 200, ?weight:Int = 100){
		ctx.strokeWeight(weight);
		ctx.line(x - size / 2, y - size / 2, x - size / 2+size, y - size / 2+size);
		ctx.line(x+size - size / 2, y - size / 2, x - size / 2, y+size - size / 2);
	}

	/**
	 * use with de data of GridUtil
	 * @example
	 * 			var arr:Array<Point> = GridUtil.create(0, 0, w, h, 3, 4);
	 * 			lib.util.ShapeUtil.gridRegister(ctx, arr);
	 */
	public static function gridRegister(ctx:CanvasRenderingContext2D, arr:Array<Point>){
		for (i in 0...arr.length) {
			var point:Point = arr[i];
			registerPoint(ctx, point.x, point.y);
		}
	}

}
