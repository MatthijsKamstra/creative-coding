package art;

import lib.util.MathUtil;

/**
 * short description what this does
 */
class CC030 extends CCBase implements ICCBase {
	var shapeArray:Array<CircleExtra> = [];
	var max = 7;
	var _startRadius = 100;
	var _startLineWidth = 30;
	var _px = 2;
	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _lineColor2:RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';

		window.addEventListener(KEY_DOWN, onKeyDown);
	}

	function createShape(i:Int, ?point:Point) {
		var shape:CircleExtra = {
			_id: '$i',
			_type: 'CircleExtra',
			x: w / 2,
			y: h / 2,
			radius: _startRadius,
			rotation: 0,
			angle: 250,
			speed: 1,
		}
		// onAnimateHandler(shape);
		return shape;
	}

	// function onAnimateHandler(arc:Arc){
	// 	GoJs.to(arc, random).x(w/2).y(h/2).ease(lets.easing.Sine.easeInOut).onComplete(onAnimateHandler, [arc]);
	// }
	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			sh.rotation = radians(randomInt(360));
			// sh.rotation += sh.speed + (i * 1);

			ctx.strokeStyle = getColourObj(WHITE);
			ctx.lineCap = 'butt'; // "butt|round|square";
			ctx.lineWidth = _startLineWidth;

			var _radius = _startRadius + (i * (_startLineWidth + _px));

			ctx.setLineDash(createDashedArray(_radius));

			ctx.save();
			ctx.translate(sh.x, sh.y);
			ctx.rotate(sh.rotation);
			// ctx.centreFillRect(0, 0, sh.width, sh.height);
			// ctx.strokeCircle(sh.x, sh.y, _radius);
			ctx.strokeCircle(0, 0, _radius);
			ctx.restore();

			// ctx.arc(w/2, h/2, sh.radius * (0.6*i+1), radians(0 + sh.rotation), radians(sh.angle + sh.rotation));
		}
	}

	function createDashedArray(radius:Float):Array<Float> {
		var omtrek = (MathUtil.circumferenceCircle(radius));
		// trace('omtrek: $omtrek');
		var arr:Array<Float> = [];
		var randomParts = randomInt(0, 50);
		if (randomParts % 2 != 0)
			randomParts++;
		// trace('randomParts: $randomParts');
		var counter = 0;
		for (i in 0...randomParts) {
			var value = randomInt(0, 100);
			counter += value;
			arr.push(value);
		}
		// trace('counter: $counter');
		var temp = omtrek / counter;
		// trace('temp ($omtrek/$counter): $temp');

		for (i in 0...arr.length) {
			arr[i] = arr[i] * temp;
		}
		// trace('arr: $arr');
		return arr;
	}

	override function setup() {
		trace('setup: ${toString()}');
		var colorArray = lib.util.ColorUtil.niceColor100SortedString[randomInt(lib.util.ColorUtil.niceColor100SortedString.length - 1)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_lineColor2 = hex2RGB(colorArray[2]);

		for (i in 0...max) {
			shapeArray.push(createShape(i));
		}

		// trace(1 % 2); // 1
		// trace(2 % 2); // 0
		// trace(3 % 2); // 1
		// trace(4 % 2); // 0
		// trace(40152 % 2); // 0
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		stop();
	}

	// ____________________________________ onhandler ____________________________________
	override function onKeyDown(e:js.html.KeyboardEvent) {
		switch (e.key) {
			case ' ':
				drawShape();
			default:
				trace("case '" + e.key + "': trace ('" + e.key + "');");
		}
	}
}
