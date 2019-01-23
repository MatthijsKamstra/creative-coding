package;

// using CanvasTools;

import js.html.CanvasRenderingContext2D;

class CanvasTools {

	static public function square(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, ?height:Float) {
		if (height == null) height = width;
		ctx.fillRect(x, y, width, height);
	};

	static public function centreStrokeRect(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, ?height:Float) {
		if (height == null) height = width;
		ctx.strokeRect(x - width / 2, y - height / 2, width, height);
	};

	static public function centreFillRect(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, ?height:Float) {
		if (height == null) height = width;
		ctx.fillRect(x - width / 2, y - height / 2, width, height);
	};

}