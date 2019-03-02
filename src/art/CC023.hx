package art;

/**
 * short description what this does
 */
class CC023 extends CCBase implements ICCBase {

	var shapeArray:Array<CircleExtra> = [];
	var shapeArray2:Array<CircleExtra> = [];

	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _fillColor:RGB = null;
	var _lineColor2:RGB = null;
	var _fillColor2:RGB = null;

	var _xmax = 50;

	var maxDistance = w / 2;

	var centerX = w / 2;
	var centerY = h / 2;
	var radiusY = h / 3;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int, ?point:Point) {
		var _angle = (360 / _xmax) * i;
		var shape:CircleExtra = {
			_id: '$i',
			_type: 'circle',
			radius: h / 2,
			angle: _angle,
			x: ((w / _xmax) * i) + point.x,
			y: centerY + point.y,
		}
		Reflect.setField(shape, 'point', point);
		// onAnimateHandler(shape);
		return shape;
	}

	// function onAnimateHandler(circle:Circle){
	// 	// Go.to(circle, 5).x(w/2).y(centerY).ease(Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	// }
	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(_bgColor);

		ctx.strokeColourObj(_lineColor);
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			var point : Point = Reflect.getProperty(sh, 'point');
			sh.angle += 1;
			sh.y = centerY + point.y + Math.sin(radians(sh.angle)) * radiusY;
			ctx.strokeColourObj(_lineColor, 1);
			ctx.strokeCircle(sh.x, sh.y, 10);

			var sh2 = shapeArray2[i];
			var point2 : Point = Reflect.getProperty(sh2, 'point');
			sh2.angle += 1;
			sh2.y = centerY + point2.y + Math.sin(radians(sh2.angle)) * radiusY;
			ctx.strokeColourObj(_lineColor, 1);
			ctx.strokeCircle(sh2.x, sh2.y, 10);

			ctx.strokeColourObj(_lineColor2, 1);
			ctx.lineColour(_fillColor.r, _fillColor.g, _fillColor.b, 1);
			ctx.line(sh.x, sh.y, sh2.x, sh2.y);

		}
	}

	override function setup() {
		// trace('setup: ${toString()}');

		// var colorArray = ColorUtil.niceColor100[randomInt(ColorUtil.niceColor100.length-1)];
		var colorArray = ColorUtil.niceColor100[5];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_fillColor = hex2RGB(colorArray[2]);
		_lineColor2 = hex2RGB(colorArray[3]);
		_fillColor2 = hex2RGB(colorArray[4]);

		// isDebug = true;

		shapeArray = [];
		for (i in 0..._xmax) {
			var point:Point = {x: -50, y: -50}
			shapeArray.push(createShape(i, point));
		}
		shapeArray2 = [];
		for (i in 0..._xmax) {
			var point:Point = {x: 50, y: 50}
			shapeArray2.push(createShape(i, point));
		}

		// console.table(shapeArray);
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
