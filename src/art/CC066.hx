package art;

/**
 * short description what this does
 */
class CC066 extends CCBase implements ICCBase {
	var shapeArray:Array<Line> = [];
	var shapeArray2:Array<{}> = [];
	var shapeMax:Int = 7;
	var radius0:Int = 150;
	var radius1:Int = 350;
	var divide:Int = Math.round(360 / 7);
	var _strokeW = 15;
	var _blobSize = 50;
	var _padding = 50;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Bio spere';
		divide = Math.round(360 / shapeMax);
		radius1 = Math.round(w2 - (2 * _padding));
		super(ctx);
	}

	function createShape(i:Int):Line {
		var angle = i * divide;
		var line:Line = {
			_id: i,
			x1: (w / 2) + Math.cos(radians(angle)) * radius0,
			y1: (h / 2) + Math.sin(radians(angle)) * radius0,
			x2: (w / 2) + Math.cos(radians(angle)) * radius1,
			y2: (h / 2) + Math.sin(radians(angle)) * radius1,
			stroke: _strokeW,
			radius: random(radius0 + _blobSize, radius1),
		}
		// trace(line);
		onAnimationHandler(line);
		return line;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);
		//
		for (i in 0...shapeArray.length) {
			var line = shapeArray[i];
			var angle = i * divide;
			line.x2 = (w / 2) + Math.cos(radians(angle)) * line.radius;
			line.y2 = (h / 2) + Math.sin(radians(angle)) * line.radius;
			ctx.lineColour(WHITE.r, WHITE.g, WHITE.b, 1);
			ctx.lineWidth = line.stroke;
			// ctx.lineCap = "round"; // "butt|round|square";
			ctx.line(line.x1, line.y1, line.x2, line.y2);
			ctx.circleFillStroke(line.x2, line.y2, _blobSize);
		}

		ctx.strokeWeight(_strokeW);
		ctx.circleFillStroke(w2, h2, radius0);
	}

	// ____________________________________ onHandlers ____________________________________

	function onAnimationHandler(line) {
		// trace('complete: $e');
		Go.to(line, random(0.5, 1.5))
			.prop('radius', random(radius0 + _blobSize, radius1))
			.ease(Sine.easeInOut)
			.onComplete(onAnimationHandler, [line]);
	}

	// ____________________________________ override ____________________________________

	override function setup() {
		// trace('setup: ${toString()}');
		for (i in 0...shapeMax) {
			shapeArray.push(createShape(i));
		}
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
