package art;

/**
 * short description what this does
 */
class CC054a extends CCBase implements ICCBase {
	var grid:GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	var colorArr = [GREEN, PINK, BLUE, AQUA, TEAL, OLIVE, PURPLE, MAROON, GRAY];

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);

		// trace((colorArr));
		var shuffle = MathUtil.shuffle(colorArr);
		// trace(shuffle);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		for (i in 0...grid.array.length) {
			createEye(i, grid.array[i]);
		}
	}

	function createEye(i:Int, ?point:Point) {
		var w2 = point.x;
		var h2 = point.y;

		var cell = Math.min(grid.cellHeight, grid.cellWidth);

		var outerR = Math.round(cell / 2) - 20;
		var innerR = 50;
		// outline
		cc.draw.Circle.create(ctx)
			.pos(w2 + random(-3, 3), h2 + random(-3, 3))
			.fill(BLACK)
			.radius(outerR + 10)
			.draw();

		// eye color
		cc.draw.Circle.create(ctx).pos(w2, h2).fill(colorArr[i]).radius(outerR).draw();

		// pattern
		ctx.strokeColourRGB(WHITE, 0.1);
		for (i in 0...1000) {
			var point = MathUtil.orbit(w2, h2, random(360), random(innerR, outerR - 5));
			ctx.line(w2, h2, point.x, point.y);
		}
		// inner black eye..
		cc.draw.Circle.create(ctx).pos(w2, h2).fill(BLACK).radius(innerR).draw();
		// high light
		var xpos = w2 - innerR + 10;
		var ypos = h2 - innerR + 20;
		cc.draw.Circle.create(ctx) // .pos(w2 + random(-innerR, innerR), h2 + random(-innerR, innerR))
			.color(WHITE).pos(xpos, ypos).radius(20).alpha(0.7).draw();
		// random blink
		var out = outerR - 50;
		cc.draw.Circle.create(ctx)
			.pos(w2 + random(-out, out), h2 + random(-out, out))
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
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
