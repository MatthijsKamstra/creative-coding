package;

/**
 * using CanvasTools;
 **/

import util.*;
import js.html.CanvasRenderingContext2D;

import Global.*;

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
	/**
	 * circles
	 */
	static public function makeCircle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		ctx.beginPath();
		ctx.arc(x, y, radius, 0, Math.PI*2, true);
	};
	static public function circle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		makeCircle(ctx, x, y, radius);
		ctx.fill();
		ctx.closePath();
	};
	static public function fillCircle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		makeCircle(ctx, x, y, radius);
		ctx.fill();
		ctx.closePath();
	};
	static public function strokeCircle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		makeCircle(ctx, x, y, radius);
		ctx.stroke();
		ctx.closePath();
	};


	static public function eellipse(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, height:Float) {
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
		ctx.beginPath();
		ctx.ellipse(x, y, width, height, 0, 0, 2 * Math.PI);
		ctx.fill();
	};
	static public function strokeEllipse(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, height:Float) {
		ctx.beginPath();
		ctx.ellipse(x, y, width, height, 0, 0, 2 * Math.PI);
		ctx.stroke();
	};


	/**
	 * lines
	 */
	static public function line (ctx:CanvasRenderingContext2D, x1:Float, y1:Float, x2:Float, y2:Float){
		ctx.beginPath();
		ctx.moveTo(x1,y1);
		ctx.lineTo(x2,y2);
		ctx.stroke();
		ctx.beginPath();
	};

	/**
	 * triangle
	 */
	static public function triangle(ctx:CanvasRenderingContext2D, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float) {
		ctx.beginPath();
		ctx.moveTo(x1, y1);
		ctx.lineTo(x2, y2);
		ctx.lineTo(x3, y3);
		ctx.lineTo(x1, y1);
		ctx.stroke();
		ctx.closePath();
	};
	static public function strokeTriangle(ctx:CanvasRenderingContext2D, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float) {
		ctx.beginPath();
		ctx.moveTo(x1, y1);
		ctx.lineTo(x2, y2);
		ctx.lineTo(x3, y3);
		ctx.lineTo(x1, y1);
		ctx.stroke();
		ctx.closePath();
	}
	static public function fillTriangle(ctx:CanvasRenderingContext2D, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float) {
		ctx.beginPath();
		ctx.moveTo(x1, y1);
		ctx.lineTo(x2, y2);
		ctx.lineTo(x3, y3);
		ctx.lineTo(x1, y1);
		ctx.fill();
		ctx.closePath();
	};


	/**
	 * change appairance
	 */
	static public function strokeWeight(ctx:CanvasRenderingContext2D, inPx:Int) {
		ctx.lineWidth = inPx; //px
	}
	static public function fillColour(ctx:CanvasRenderingContext2D, r:Int, ?g:Int, ?b:Int, ?a:Int) {
		colour(ctx, r, g, b, a);
	};
	static public function colour(ctx:CanvasRenderingContext2D, r:Int, ?g:Int, ?b:Int, ?a:Float) {
		var c = ColorUtil.getColour(r, g, b, a);
		ctx.fillStyle = c;
	};
	static public function strokeColour(ctx:CanvasRenderingContext2D, r:Int, ?g:Int, ?b:Int, ?a:Float) {
		lineColour(ctx, r, g, b, a);
	};
	static public function lineColour(ctx:CanvasRenderingContext2D, r:Int, ?g:Int, ?b:Int, ?a:Float) {
		ctx.strokeStyle = ColorUtil.getColour(r, g, b, a);
	};
	static public function colourName(ctx:CanvasRenderingContext2D, name:String) {
		ctx.fillStyle = name;
	};

	/**
	 * create background colors for sketch
	 * @param ctx
	 * @param r	red
	 * @param g	(optional) green
	 * @param b	(optional) blue
	 * @param a	(optional) alpha
	 */
	static public function background(ctx:CanvasRenderingContext2D, r:Int, ?g:Int, ?b:Int, ?a:Float) {
		if (g == null) {
			ctx.fillStyle = ColorUtil.rgb(r, r, r);
		} else if (b == null && a == null) {
			ctx.fillStyle = ColorUtil.rgba(r, r, r, g);
		} else if (a == null) {
			ctx.fillStyle = ColorUtil.rgb(r, g, b);
		} else {
			ctx.fillStyle = ColorUtil.rgba(r, g, b, a);
		}
		ctx.fillRect(0, 0, w, h);
	};


}