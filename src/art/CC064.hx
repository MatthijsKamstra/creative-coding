package art;

/**
 * short description what this does
 */
class CC064 extends CCBase // ExportBase
implements ICCBase {
	var shapeArray:Array<Square> = [];
	var max = 20;
	var _maxSize = w;
	var _offsetSize = 50;
	var _rotationCounter = 0;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Triangles animation with delay, rotation complete';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		console.warn("Firefox and this sketch are not a good idea");

		super(ctx);
	}

	function createShape(i:Int) {
		var shape:Square = {
			_id: '$i',
			_type: 'square',
			x: w2,
			y: h2,
			size: _maxSize - (i * _offsetSize) // degree: 180 / 6
		}
		// onAnimationContinue(shape, i, 1);
		haxe.Timer.delay(function() {
			onAnimationContinue(shape, i, 1);
		}, i * 100);

		return shape;
	}

	var runCounter = 0;

	function onAnimationContinue(sh:Square, id:Int, count:Int) {
		// trace('$runCounter == ${(shapeArray.length - 1) * 2}');
		// if (runCounter == (shapeArray.length - 1) * 2) {
		// 	// stop export
		// 	export.stop();
		// 	// stop();
		// 	runCounter++;
		// 	return;
		// }

		Go.to(sh, 3)
			.delay(2)
			.prop('angle', -(180 / 2) * count)
			.ease(Elastic.easeInOut)
			.onComplete(onAnimationContinue, [sh, id, ++count]);

		runCounter++;
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
			ctx.shadowBlur = 15;
			ctx.centreFillRect(0, 0, sh.size);
			ctx.restore();
		}
	}

	override function setup() {
		trace('setup: ${toString()}');

		shapeArray = [];
		for (i in 0...max) {
			shapeArray.push(createShape(i));
		}

		// start export
		// export.type(ZIP);
		// export.start();

		var delayMS = (shapeArray.length * 100) + 5000;
		Go.timer(Math.round(delayMS / 1000))
			.onComplete(function() {
				// export.stop();
			});
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
