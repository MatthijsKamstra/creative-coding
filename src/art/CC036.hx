package art;

import lib.util.MathUtil;

/**
 * short description what this does
 */
class CC036 extends CCBase implements ICCBase {
	var shapeArray:Array<CircleExtra> = [];
	var max = 2;

	var startRadius = 200;
	var startLineWidth = 30;
	var lineW = 30;

	var lineWidthArray = [30,60,90];
	// var divideArray = [60,6,4];
	var divideArray = [60,12];

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
			rotation: -90,
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
			// sh.rotation += sh.speed;
			sh.radius -= ((lineW/2)*i);
			ctx.strokeStyle = getColourObj(WHITE);
			ctx.lineCap = 'butt'; // "butt|round|square";
			ctx.lineWidth = lineWidthArray[i];

			var omtrek = (MathUtil.circumferenceCircle(sh.radius));
			ctx.setLineDash([1,(omtrek/divideArray[i])-1]);

			ctx.save();
			ctx.translate(sh.x, sh.y);
			ctx.rotate(radians(sh.rotation));
			ctx.strokeCircle(0, 0, sh.radius);
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
