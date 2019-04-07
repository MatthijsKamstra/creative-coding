package art;

/**
 * short description what this does
 */
class CC069 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	function createShape(i:Int, ?point:Point) {
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius: _radius,
		}
		onAnimateHandler(shape);
		return shape;
	}

	function onAnimateHandler(circle:Circle) {
		// Go.to(circle, 5).x(w/2).y(h/2).ease(Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}

	function drawShape() {
		var padding = 70;

		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		var maskWidth = 200;
		var maskHeight = h - (padding * 2);
		var total:Int = 50;
		var offset = Math.round(maskHeight / total);

		trace(maskHeight, total, offset);

		for (i in 0...total - 2) {
			var xpos1 = w2 - (maskWidth / 2);
			var xpos2 = w2 + (maskWidth / 2);
			var ypos1 = padding + ((i + 1) * offset) + random(-offset / 2, offset / 2);
			var ypos2 = padding + ((i + 1) * offset) + random(-offset / 2, offset / 2);

			ctx.strokeColourRGB(BLACK, 0.4);
			ctx.strokeWeight(2);
			ctx.line(xpos1, ypos1, xpos2, ypos2);
		}

		// ctx.colourObj(PINK);
		ctx.shadowSet(BLACK, 0.2, 15);
		Mask.create(ctx)
			.pos(0, 0)
			.outerSquare(w, h)
			.innerSquare(maskWidth, maskHeight)
			.fill(WHITE)
			.draw();
	}

	override function setup() {
		trace('setup: ${toString()}');

		shapeArray = [];
		for (i in 0...grid.array.length) {
			shapeArray.push(createShape(i, grid.array[i]));
		}
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
