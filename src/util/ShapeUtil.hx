package util;

import js.html.CanvasRenderingContext2D;
import Global.*;
import util.ColorUtil.*;

// syntactic sugar to extend CanvasRenderingContext2D
using CanvasTools;

/**
 * predefined shapes that are every useful
 * @example:
 * 		using CanvasTools;
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
	 * [Description] (not centered)
	 * @param ctx
	 * @param x
	 * @param y
	 * @param size
	 */
	public static function xcross(ctx:CanvasRenderingContext2D, x, y, ?size:Float = 200){
		var size = 200;

		ctx.strokeWeight(100);
		ctx.line(x - size / 2, y - size / 2, x - size / 2+size, y - size / 2+size);
		ctx.line(x+size - size / 2, y - size / 2, x - size / 2, y+size - size / 2);
	}

}
