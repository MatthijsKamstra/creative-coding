package lib;

import lib.util.*;
import lib.util.ColorUtil.*;
import js.html.CanvasRenderingContext2D;
import lib.Global.*;
import lib.util.ColorUtil.RGB;
/**
 * using lib.CanvasTools;
**/
class CanvasTools {
	/**
	 * rectangles
	 */
	static public function square(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, ?height:Float) {
		if (height == null)
			height = width;
		ctx.fillRect(x, y, width, height);
	};

	static public function centreStrokeRect(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, ?height:Float) {
		if (height == null)
			height = width;
		ctx.strokeRect(x - width / 2, y - height / 2, width, height);
	};

	/**
	 * create a rectangle with center point (x,y)
	 * @param ctx
	 * @param x			center point x
	 * @param y			center point y
	 * @param width		width of rectangle (if no height is given also the height)
	 * @param height	(optional) height of rectangle
	 */
	static public function centreFillRect(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, ?height:Float) {
		if (height == null)
			height = width;
		ctx.fillRect(x - width / 2, y - height / 2, width, height);
	};

	static public function roundRect(ctx:CanvasRenderingContext2D, _x:Float, _y:Float, _width, _height, _radius:Float = 5, ?_fill:Bool = true, ?_stroke:Bool = false) {
		_width = Math.abs(_width);
		_height = Math.abs(_height);
		_x = _x - _width / 2;
		_y = _y - _height / 2;
		// if (_width < radius) radius = _width;
		var radius = {
			tl: _radius,
			tr: _radius,
			br: _radius,
			bl: _radius
		};
		ctx.beginPath();
		ctx.moveTo(_x + radius.tl, _y);
		ctx.lineTo(_x + _width - radius.tr, _y);
		ctx.quadraticCurveTo(_x + _width, _y, _x + _width, _y + radius.tr);
		ctx.lineTo(_x + _width, _y + _height - radius.br);
		ctx.quadraticCurveTo(_x + _width, _y + _height, _x + _width - radius.br, _y + _height);
		ctx.lineTo(_x + radius.bl, _y + _height);
		ctx.quadraticCurveTo(_x, _y + _height, _x, _y + _height - radius.bl);
		ctx.lineTo(_x, _y + radius.tl);
		ctx.quadraticCurveTo(_x, _y, _x + radius.tl, _y);
		ctx.closePath();
		if (_fill) {
			ctx.fill();
		}
		if (_stroke) {
			ctx.stroke();
		}
	}

	/**
	 * circles
	 */
	static public function makeCircle(ctx:CanvasRenderingContext2D, x:Float, y:Float, radius:Float) {
		ctx.beginPath();
		ctx.arc(x, y, radius, 0, Math.PI * 2, true);
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

	/**
	 * polygon
	 */
	static public function strokePolygon(ctx:CanvasRenderingContext2D, x:Float, y:Float, sides, size) {
		polygon(ctx, x, y, sides, size);
		ctx.stroke();
	}

	static public function fillPolygon(ctx:CanvasRenderingContext2D, x:Float, y:Float, sides, size) {
		polygon(ctx, x, y, sides, size);
		ctx.fill();
	}

	static public function outlinedPolygon(ctx:CanvasRenderingContext2D, x:Float, y:Float, _sides, _size, _fill, _stroke) {
		ctx.fillStyle = _fill;
		fillPolygon(ctx, x, y, _sides, _size);
		ctx.strokeStyle = _stroke;
		strokePolygon(ctx, x, y, _sides, _size);
	}

	/**
	 * more shaped stuff
	 *
	 * @example
	 *			ctx.fillPolygon(point.x, point.y, 8, _size);
	 *
	 * @param ctx		canvas
	 * @param x			x position of the shape
	 * @param y			y position of the shape
	 * @param sides		number of sides (3=triangle, 4=square, etc)
	 * @param size		radius of the polygon (length to the corner)
	 */
	static public function polygon(ctx:CanvasRenderingContext2D, x:Float, y:Float, sides:Int, size:Float) {
		ctx.beginPath();
		ctx.moveTo(x + size * Math.cos(0), y + size * Math.sin(0));
		for (i in 0...sides) {
			ctx.lineTo(x + size * Math.cos(i * 2 * Math.PI / sides), y + size * Math.sin(i * 2 * Math.PI / sides));
		}
		ctx.closePath();
	}

	/**
	 * elipse
	 */
	static public function eellipse(ctx:CanvasRenderingContext2D, x:Float, y:Float, width:Float, height:Float) {
		ctx.beginPath();
		var i:Float = 0;
		var counter = 0;
		while (i < Math.PI * 2) {
			trace('$counter. - $i < ${Math.PI * 2}');
			ctx.lineTo(x + (Math.cos(i) * width / 2), y + (Math.sin(i) * height / 2));
			i += Math.PI / 16;
			counter++;
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
	static public function line(ctx:CanvasRenderingContext2D, x1:Float, y1:Float, x2:Float, y2:Float) {
		ctx.beginPath();
		ctx.moveTo(x1, y1);
		ctx.lineTo(x2, y2);
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

	static public function eqDownFillTriangle(ctx:CanvasRenderingContext2D, x:Float, y:Float, sz:Float) {
		ctx.translate(x, y);
		ctx.rotate(MathUtil.radians(180));
		fillTriangle(ctx, 0, 0 - sz, 0 + sz, 0 + sz / 2, 0 - sz, 0 + sz / 2);
		ctx.rotate(MathUtil.radians(-180));
		ctx.translate(-x, -y);
	}

	static public function eqDownTriangle(ctx:CanvasRenderingContext2D, x:Float, y:Float, sz:Float) {
		ctx.translate(x, y);
		ctx.rotate(MathUtil.radians(180));
		triangle(ctx, 0, 0 - sz, 0 + sz, 0 + sz / 2, 0 - sz, 0 + sz / 2);
		ctx.rotate(MathUtil.radians(-180));
		ctx.translate(-x, -y);
	}

	static public function eqFillTriangle(ctx:CanvasRenderingContext2D, x:Float, y:Float, sz:Float) {
		fillTriangle(ctx, x, y - sz, x + sz, y + sz / 2, x - sz, y + sz / 2);
	}

	static public function eqTriangle(ctx:CanvasRenderingContext2D, x:Float, y:Float, sz:Float) {
		triangle(ctx, x, y - sz, x + sz, y + sz / 2, x - sz, y + sz / 2);
	}

	/**
	 * change appairance
	 */
	static public function strokeWeight(ctx:CanvasRenderingContext2D, inPx:Int) {
		ctx.lineWidth = inPx; // px
	}

	static public function fillColour(ctx:CanvasRenderingContext2D, r:Int, ?g:Int, ?b:Int, ?a:Int) {
		colour(ctx, r, g, b, a);
	};
	static public function fillColourRGB(ctx:CanvasRenderingContext2D, rgb:lib.util.ColorUtil.RGB, ?a:Int) {
		colour(ctx, rgb.r, rgb.g, rgb.b, a);
	};

	static public function colour(ctx:CanvasRenderingContext2D, r:Int, ?g:Int, ?b:Int, ?a:Float) {
		var c = ColorUtil.getColour(r, g, b, a);
		ctx.fillStyle = c;
	};
	static public function colourObj(ctx:CanvasRenderingContext2D, rgb:lib.util.ColorUtil.RGB, ?a:Float) {
		var c = ColorUtil.getColour(rgb.r, rgb.g, rgb.b, a);
		ctx.fillStyle = c;
	};

	static public function strokeColourObj(ctx:CanvasRenderingContext2D,  rgb:lib.util.ColorUtil.RGB,  ?a:Float) {
		lineColour(ctx, rgb.r, rgb.g, rgb.b, a);
	};
	static public function strokeColourRGB(ctx:CanvasRenderingContext2D,  rgb:lib.util.ColorUtil.RGB,  ?a:Float) {
		lineColour(ctx, rgb.r, rgb.g, rgb.b, a);
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
	static public function backgroundObj(ctx:CanvasRenderingContext2D, rgb:ColorUtil.RGB) {
		background(ctx, rgb.r, rgb.g, rgb.b);
	}
	static public function backgroundRGB(ctx:CanvasRenderingContext2D, rgb:ColorUtil.RGB) {
		background(ctx, rgb.r, rgb.g, rgb.b);
	}
}
