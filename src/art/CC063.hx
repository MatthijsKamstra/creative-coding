package art;

/**
 * short description what this does
 */
class CC063 extends CCBase implements ICCBase {
	var shapeArray:Array<CircleExtra> = [];
	var shapeArray2:Array<CircleExtra> = [];
	var shapeMax:Int = 15;
	var maxRadius = h / 3;
	var minRadius = -100;
	var maxCircleSize = 30;
	var strokeWidth = 5;
	var minDistance:Float;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Circles in a circle, connected';
		type = [CCType.ANIMATION];
		super(ctx);
	}

	function createShape(i:Int, radius:Float, speed:Float) {
		var shape:CircleExtra = {
			_id: '$i',
			_type: 'circle',
			x: w2,
			y: h2,
			rgb: BLACK,
			radius: radius,
			size: 20,
			angle: (360 / shapeMax) * i, // steps for rotation
			speed: speed, // rotation speed
		}
		return shape;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundRGB(WHITE);
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			// // sh.radius += i*5;
			sh.angle += sh.speed;
			// // plot the balls x to cos and y to sin
			sh.x = w / 2 + Math.cos(radians(sh.angle)) * sh.radius;
			sh.y = h / 2 + Math.sin(radians(sh.angle)) * sh.radius;
			// // ctx.fillStyle = getColourObj(sh.rgb, sh.alpha);
			ctx.fillStyle = getColourObj(WHITE);
			ctx.strokeStyle = getColourObj(sh.rgb);
			ctx.strokeWeight(strokeWidth);
			ctx.circleFillStroke(sh.x, sh.y, sh.size);
		}
		for (i in 0...shapeArray2.length) {
			var sh = shapeArray2[i];
			// // sh.radius += i*5;
			sh.angle += sh.speed;
			// // plot the balls x to cos and y to sin
			sh.x = w / 2 + Math.cos(radians(sh.angle)) * sh.radius;
			sh.y = h / 2 + Math.sin(radians(sh.angle)) * sh.radius;
			// // ctx.fillStyle = getColourObj(sh.rgb, sh.alpha);
			ctx.fillStyle = getColourObj(WHITE);
			ctx.strokeStyle = getColourObj(sh.rgb);
			ctx.strokeWeight(strokeWidth);
			ctx.circleFillStroke(sh.x, sh.y, sh.size);
		}
		for (i in 0...shapeArray2.length) {
			var sh1 = shapeArray[i];
			var sh2 = shapeArray2[i];

			if (minDistance == null) {
				minDistance = MathUtil.distance(sh1.x, sh1.y, sh2.x, sh2.y);
				trace('start export');
			} else {
				if (minDistance == MathUtil.distance(sh1.x, sh1.y, sh2.x, sh2.y)) {
					trace('stop export');
				}
			}

			ctx.lineColourRGB(BLACK);
			ctx.lineWidth = strokeWidth * 1;
			ctx.lineCap = "round"; // "butt|round|square";
			ctx.line(sh1.x, sh1.y, sh2.x, sh2.y);
		}
	}

	override function setup() {
		trace('setup: ${toString()}');
		for (i in 0...shapeMax) {
			shapeArray.push(createShape(i, maxRadius, 0.25));
			shapeArray2.push(createShape(i, maxRadius + minRadius, 0.5));
		}
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
