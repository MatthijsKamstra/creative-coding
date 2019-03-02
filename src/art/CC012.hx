package art;

/**
 * short description what this does
 */
class CC012 extends CCBase implements ICCBase {
	var shapeArray:Array<Line> = [];
	var shapeArray2:Array<{}> = [];
	var shapeMax:Int = Math.round(360 / 4);
	var radius0:Int = 350;
	var radius1:Int = 50;
	var divide:Int = 4;
	var maxDistance:Int = 100;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = 'Weird Equalizer without sound but connected';
	}

	function createShape(i:Int):Line {
		var angle = i * divide;
		var line:Line = {
			_id: i,
			x1: (w / 2) + Math.cos(radians(angle)) * radius0,
			y1: (h / 2) + Math.sin(radians(angle)) * radius0,
			x2: (w / 2) + Math.cos(radians(angle)) * radius1,
			y2: (h / 2) + Math.sin(radians(angle)) * radius1,
			stroke: 1,
			radius: random(radius0, radius1),
		}
		// trace(line);
		onCompleteHandler(line);
		return line;
	}

	function drawShape() {
		for (i in 0...shapeArray.length) {
			var line = shapeArray[i];
			var angle = i * divide;
			line.x2 = (w / 2) + Math.cos(radians(angle)) * line.radius;
			line.y2 = (h / 2) + Math.sin(radians(angle)) * line.radius;
			ctx.lineColour(WHITE.r, WHITE.g, WHITE.b, 1);
			ctx.lineWidth = line.stroke;
			// ctx.lineCap = "round"; // "butt|round|square";
			ctx.line(line.x1, line.y1, line.x2, line.y2);

			// circle
			ctx.colour(WHITE.r, WHITE.g, WHITE.b, 0.5);
			// ctx.circle(line.x2, line.y2, 10);
			ctx.strokeCircle(line.x2, line.y2, 3);

			for (j in 0...shapeArray.length) {
				var b2 = shapeArray[j];
				if (line == b2)
					continue;
				var _dist = distance(line.x2, line.y2, b2.x2, b2.y2);
				// trace('-----\n ${line} / ${b2} -- ${_dist}');
				if (_dist < maxDistance) {
					var alpha:Float = 0.8 - (_dist / maxDistance); // 0.5
					// trace(alpha);
					ctx.lineColour(WHITE.r, WHITE.g, WHITE.b, alpha);
					ctx.line(line.x2, line.y2, b2.x2, b2.y2);
				}
			}
		}
	}

	// ____________________________________ onHandlers ____________________________________
	function onUpdateHandler(e) {
		trace('update: $e');
	}

	function onCompleteHandler(line) {
		// trace('complete: $e');
		Go.to(line, random(2, 4))
			.prop('radius', random(radius0, radius1))
			.ease(Sine.easeInOut)
			.onComplete(onCompleteHandler, [line]);
	}

	// ____________________________________ override ____________________________________
	override function setup() {
		trace('setup: ${toString()}');
		for (i in 0...shapeMax) {
			shapeArray.push(createShape(i));
		}
		// shapeArray2.push(createX(0));
		draw();
	}

	override function draw() {
		// trace('draw: ${toString()}');
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);
		drawShape();
		// stop();
	}
}
