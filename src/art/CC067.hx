package art;

/**
 * short description what this does
 */
class CC067 extends CCExportBase // CCBase
implements ICCBase {
	var shapeArray:Array<Circle> = [];
	// sizes
	var _minR = 20;
	var _maxR = 150;
	var strokeW = 50;
	var max = 20;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Blobs wiggling';
		type = [CCType.ANIMATION, CCType.IMAGE];

		super(ctx);
	}

	function createShape(i:Int, ?point:Point) {
		var padding = _maxR + (strokeW / 2);
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: padding + random(w - (padding * 2)),
			y: padding + random(h - (padding * 2)),
			radius: random(_minR, _maxR),
		}
		onAnimateHandler(shape);
		return shape;
	}

	function onAnimateHandler(circle:Circle) {
		Go.wiggle(circle, circle.x, circle.y, 20);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// black outlines circles
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(BLACK);
			ctx.strokeColourRGB(BLACK);
			ctx.strokeWeight(strokeW);
			ctx.circleFillStroke(sh.x, sh.y, sh.radius);
		}
		// total white circles
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(WHITE);
			ctx.fillCircle(sh.x, sh.y, sh.radius);
		}
	}

	override function setup() {
		trace('setup: ${toString()}');

		isDebug = true;

		shapeArray = [];
		for (i in 0...max) {
			shapeArray.push(createShape(i));
		}
		// export.setting({
		// 	export_type: ZIP,
		// 	delay: Math.round(0.5 * 60),
		// 	record: Math.round(30 * 60),
		// 	// isDebug: true
		// });
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
