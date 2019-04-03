package art;

/**
 * short description what this does
 */
class CC062 extends CCBase // ExportBase
implements ICCBase {
	var shapeArray:Array<Dynamic> = [];
	var max = 20;
	var size = 400;
	var _rotationCounter = 0;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Polygon animation, rotate with hidden others';
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
		var offset = 10;
		var shape:Dynamic = {
			_id: '$i',
			_type: 'poly',
			x: w2,
			y: h2,
			size: this.size,
			degree: 180 / 6
		}
		onAnimateHandler(shape, i, 3);
		return shape;
	}

	function onAnimateHandler(sh:Dynamic, id:Int, count:Int) {
		Go.to(sh, 2)
			.delay(id * 0.1)
			.prop('degree', (180 / 6) * count)
			.ease(Sine.easeInOut)
			.onComplete(onAnimateHandler2, [sh, id, count + 3]);
	}

	function onAnimateHandler2(sh:Dynamic, id:Int, count:Int) {
		_rotationCounter++;
		if (_rotationCounter == (max * 3)) {
			trace('stop export');
			// export.stop();
		}
		Go.to(sh, 3)
			.delay(2)
			.prop('degree', (180 / 6) * count)
			.ease(Sine.easeInOut)
			.onComplete(onAnimateHandler2, [sh, id, count + 3]);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// ctx.fillPolygon(w2, h2, 6, w3);
		// ctx.clip();

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.save();
			ctx.translate(sh.x, sh.y);
			ctx.rotate(radians(sh.degree));
			ctx.strokeColourRGB(BLACK);
			ctx.strokePolygon(0, 0, 3, sh.size);
			ctx.restore();
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
		// stop();
	}
}
