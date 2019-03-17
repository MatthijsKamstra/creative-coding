package art;

/**
 * short description what this does
 */
class CC054a extends CCBase implements ICCBase {
	var shapeArray:Array<EyeObj> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	var colorArr = [GREEN, PINK, BLUE, AQUA, TEAL, OLIVE, PURPLE, MAROON, GRAY];
	var outerR = 0.0;
	var cell = 0.0;
	var innerR = 50.0;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);

		// trace((colorArr));
		var shuffle = MathUtil.shuffle(colorArr);
		// trace(shuffle);
	}

	function createShape(i:Int, ?point:Point) {
		cell = Math.min(grid.cellHeight, grid.cellWidth);
		outerR = Math.round(cell / 2) - 20;
		var shape:EyeObj = {
			_id: '$i',
			_type: 'EyeObj',
			// x: point.x,
			// y: point.y,
			// radius: _radius,
			x: point.x,
			y: point.y,
			outline: {x: point.x + random(-3, 3), y: point.y + random(-3, 3)},
			highlight: {x: point.x + (innerR - (innerR / 2)), y: point.y + (innerR - (innerR / 2))},
			rgb: colorArr[i],
		}

		return shape;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		for (i in 0...shapeArray.length) {
			createEye(i, shapeArray[i]);
		}
	}

	function createEye(i:Int, eye:EyeObj) {
		// trace(Sketch.Global.mouseX);

		// outline
		cc.draw.Circle.create(ctx)
			.pos(eye.outline.x, eye.outline.y)
			.fill(BLACK)
			.radius(Math.round(outerR + 10))
			.draw();

		// eye color
		cc.draw.Circle.create(ctx)
			.pos(eye.x, eye.y)
			.fill(eye.rgb)
			.radius(Math.round(outerR))
			.draw();

		// this is going to move
		var dirX = eye.x - (innerR / 2);
		var dirY = eye.y - (innerR / 2);
		// pattern
		ctx.strokeColourRGB(WHITE, 0.1);
		for (i in 0...1000) {
			var point = MathUtil.orbit(eye.x, eye.y, random(360), random(innerR, outerR - 5));
			ctx.line(eye.x, eye.y, point.x, point.y);
		}
		// inner black eye..
		cc.draw.Circle.create(ctx)
			.pos(dirX, dirY)
			.fill(BLACK)
			.radius(Math.round(innerR))
			.draw();

		// highlight left top
		var xpos = eye.x - innerR + 10;
		var ypos = eye.y - innerR + 20;
		cc.draw.Circle.create(ctx) // .pos(w2 + random(-innerR, innerR), h2 + random(-innerR, innerR))
			.color(WHITE)
			.pos(xpos, ypos)
			.radius(20)
			.alpha(0.7).draw();

		// random blink

		// highlight random
		var out = outerR - 50;
		cc.draw.Circle.create(ctx)
			.pos(eye.x + random(-out, out), eye.y + random(-out, out))
			.color(WHITE)
			.radius(10)
			.alpha(0.7)
			.draw();
	}

	override function setup() {
		trace('setup: ${toString()}');

		isDebug = true;

		var padding = 20;

		grid.setDimension(w - (padding * 2), h - (padding * 2));
		grid.setNumbered(3, 3);
		grid.setIsCenterPoint(true);

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

/**
 * need this if we need to animate
 */
typedef EyeObj = {
	> Base,
	> Position,
	> Appearance,
	var outline:Point;
	var highlight:Point;
	// var color:RGB;
};
