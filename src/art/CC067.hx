package art;

/**
 * short description what this does
 */
class CC067 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	// sizes
	var _minR = 20;
	var _maxR = 150;
	var strokeW = 50;
	var max = 20;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
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

		// ctx.fillStyle = getColourObj(_color4);
		// Text.centerFillText(ctx, 'text', w / 2, h / 2, "'Oswald', sans-serif;", 160);

		// if (isDebug) {
		// 	ShapeUtil.gridField(ctx, grid);
		// }
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(BLACK);
			ctx.strokeColourRGB(BLACK);
			ctx.strokeWeight(strokeW);
			ctx.circleFillStroke(sh.x, sh.y, sh.radius);
		}
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(WHITE);
			ctx.fillCircle(sh.x, sh.y, sh.radius);
		}

		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w / 2, h / 2, 200);
	}

	override function setup() {
		trace('setup: ${toString()}');

		isDebug = true;

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
