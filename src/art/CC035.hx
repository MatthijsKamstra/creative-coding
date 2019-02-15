package art;

import lib.util.MathUtil;

/**
 * short description what this does
 */
class CC035 extends CCBase implements ICCBase {
	var shapeArray:Array<CircleExtra> = [];
	var max = 2;

	var startRadius = 200;
	var startLineWidth = 30;

	var lineWidthArray = [60,120];
	var divideArray = [360,180];

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'circle lines';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	function createShape(i:Int, ?point:Point) {
		var shape:CircleExtra = {
			_id: '$i',
			_type: 'CircleExtra',
			x: w / 2,
			y: h / 2,
			radius: startRadius,
			rotation: 0,
			angle: 250,
			speed: 0.0001,
		}
		// onAnimateHandler(shape);
		return shape;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			// sh.rotation = radians(randomInt(360));
			sh.rotation += sh.speed;

			ctx.strokeStyle = getColourObj(WHITE);
			ctx.lineCap = 'butt'; // "butt|round|square";
			ctx.lineWidth = lineWidthArray[i];

			var radius = startRadius;
			var omtrek = (MathUtil.circumferenceCircle(radius));
			ctx.setLineDash([1,Math.round(omtrek/divideArray[i])]);

			ctx.save();
			ctx.translate(sh.x, sh.y);
			ctx.rotate(sh.rotation);
			ctx.strokeCircle(0, 0, radius);
			ctx.restore();

			// ctx.strokeCircle(sh.x, sh.y, radius);
		}
	}



	override function setup() {
		trace('setup: ${toString()}');
		shapeArray = [];
		for (i in 0...max) {
			shapeArray.push(createShape(i));
		}
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		stop();
	}

}
