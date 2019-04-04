package art;

/**
 * short description what this does
 */
class CC065 extends CCBase // ExportBase
implements ICCBase {
	var shapeArray:Array<CircleExtra> = [];
	var max = 20;
	var _maxSize = w;
	var _offsetSize = 50;
	var _rotationCounter = 0;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Circle animation with delay, rotation complete';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		super(ctx);

		// export.recordInSeconds(100);
		// export.type(ZIP);
		// export.start();
	}

	function createShape(i:Int, ?point:Point) {
		var shape:CircleExtra = {
			_id: '$i',
			_type: 'CircleExtra',
			x: w2,
			y: h2,
			size: _maxSize - (i * _offsetSize),
			scale: 1
		}
		Reflect.setField(shape, 'shadowBlur', 15);
		// onAnimateHandler(shape, i, 1);
		haxe.Timer.delay(function() {
			onAnimationContinue(shape, i, 1);
		}, i * 100);
		return shape;
	}

	function onAnimationContinue(sh:CircleExtra, id:Int, count:Int) {
		Go.to(sh, 5)
			.delay(0.1)
			.prop('scale', 3) // .prop('angle', -(180 / 2) * count)
				// .prop('shadowBlur', 5)
			.yoyo() // .ease(Bounce.easeInOut)
			.ease(Elastic.easeInOut)
			.onComplete(onAnimationContinue, [sh, id, ++count]);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.save();
			ctx.translate(sh.x, sh.y);
			ctx.rotate(radians(sh.angle));
			// ctx.strokeColourRGB(BLACK);
			// Shadow
			ctx.shadowColorRGB(BLACK, 0.1);
			ctx.shadowBlur = untyped sh.shadowBlur;
			ctx.centreFillRect(0, 0, sh.size * sh.scale);
			ctx.restore();
		}
	}

	override function setup() {
		trace('setup: ${toString()}');

		shapeArray = [];
		for (i in 0...max) {
			shapeArray.push(createShape(i));
		}

		// console.table(shapeArray);
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
