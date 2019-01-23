package;

// using CanvasTools;

import js.html.CanvasRenderingContext2D;

class CanvasTools {

	/**
	 * rectangles
	 */
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

	static public function circle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		ctx.beginPath();
		ctx.arc(x, y, radius, 0, Math.PI*2, true);
	};
	static public function fillCircle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		circle(ctx, x, y, radius);
		ctx.fill();
		ctx.beginPath();
	};
	static public function strokeCircle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		circle(ctx, x, y, radius);
		ctx.stroke();
		ctx.beginPath();
	};
	/*
	static public function ellipse(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, height:Float) {
		ctx.beginPath();
		var i:Float = 0;
		while (i<Math.PI*2) {
			// your code
			ctx.lineTo(x+(Math.cos(i)*width/2), y+(Math.sin(i)*height/2));
			i+=Math.PI/16;
		}

		// for(var i=0;i<Math.PI*2;i+=Math.PI/16) {
		// 	ctx.lineTo(x+(Math.cos(i)*width/2), y+(Math.sin(i)*height/2));
		// }
		ctx.closePath();
	};
	static public function fillEllipse(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, height:Float) {
		ctx.ellipse(x,y,width, height);
		ctx.fill();
		ctx.beginPath();
	};
	static public function strokeEllipse(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, height:Float) {
		ctx.ellipse(x,y,width, height);
		ctx.stroke();
		ctx.beginPath();
	};
	*/
	static public function line (ctx:CanvasRenderingContext2D, x1:Float, y1:Float, x2:Float, y2:Float){
		ctx.beginPath();
		ctx.moveTo(x1,y1);
		ctx.lineTo(x2,y2);
		ctx.stroke();
		ctx.beginPath();
	};




}