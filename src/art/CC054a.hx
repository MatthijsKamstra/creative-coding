package art;

// import cc.tool.Export;

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
	var maxDistance = 200;

	// export to node server
	// var export:Export;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Eyes following mouse by looking at it';
		type = [CCType.ANIMATION, CCType.INTERACTIVE, CCType.IMAGE];

		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		super(ctx);

		// trace((colorArr));
		var shuffle = MathUtil.shuffle(colorArr);
		// trace(shuffle);
	}

	function createShape(i:Int, ?point:Point) {
		cell = Math.min(grid.cellHeight, grid.cellWidth);
		outerR = Math.round(cell / 2) - 20;
		var out = outerR - 50;
		var shape:EyeObj = {
			_id: '$i',
			_type: 'EyeObj',
			x: point.x,
			y: point.y,
			outline: {x: point.x + random(-3, 3), y: point.y + random(-3, 3)},
			highlight: {x: point.x + (innerR - (innerR / 2)), y: point.y + (innerR - (innerR / 2))},
			randomHightlight: {x: point.x + random(-out, out), y: point.y + random(-out, out)},
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

		// ____________________________________ set mask ____________________________________

		// Save the state, so we can undo the clipping
		ctx.save();
		// eye color
		cc.draw.Circle.create(ctx)
			.pos(eye.x, eye.y)
			.fill(eye.rgb)
			.radius(Math.round(outerR))
			.draw();

		// Clip to the current path
		ctx.clip();

		var currentDistance = distance(mouseX, mouseY, eye.x, eye.y);
		// trace('-----\n ${line} / ${b2} -- ${currentDistance}');
		if (currentDistance < maxDistance) {
			// console.log('minRadius: $minRadius');
			// console.log('maxRadius: $maxRadius');
			// console.log('(maxRadius / minRadius): ($maxRadius / $minRadius) -> ${(maxRadius / minRadius)}');
			// console.log('(maxDistance / currentDistance): ($maxDistance / $currentDistance) -> ${(maxDistance / currentDistance)}');

			// b2.radius = maxRadius - ((currentDistance / maxDistance) * (maxRadius - minRadius));
		} else {
			// b2.radius = minRadius;
		}

		// this is going to move
		// trace('${Sketch.Global.mouseX}');
		// trace(MathUtil.pythagoreanTheorem(Sketch.Global.mouseX - eye.x, Sketch.Global.mouseY));

		// var dirX = eye.x - (innerR / 2);
		// var dirY = eye.y - (innerR / 2);
		var dirX = eye.x + ((mouseX - eye.x) * 0.2);
		var dirY = eye.y + ((mouseY - eye.y) * 0.2);
		// pattern
		ctx.strokeColourRGB(WHITE, 0.1);
		for (i in 0...1000) {
			var point = MathUtil.orbit(dirX, dirY, random(360), random(innerR, outerR - 5));
			ctx.line(dirX, dirY, point.x, point.y);
		}
		// inner black eye..
		cc.draw.Circle.create(ctx)
			.pos(dirX, dirY)
			.fill(BLACK)
			.radius(Math.round(innerR))
			.draw();

		// Undo the clipping
		ctx.restore();

		// ____________________________________ restore to old ____________________________________

		// highlight left top
		// random blink
		var xpos = eye.x - innerR + 10;
		var ypos = eye.y - innerR + 20;
		cc.draw.Circle.create(ctx)
			.color(WHITE)
			.pos(xpos, ypos) // .pos(w2 + random(-innerR, innerR), h2 + random(-innerR, innerR))
			.radius(20)
			.alpha(0.7).draw();

		// highlight random
		cc.draw.Circle.create(ctx)
			.pos(eye.randomHightlight.x, eye.randomHightlight.y)
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

		// setup export settings
		// export = new Export(ctx); // bind context
		// export.time(10, 2); // 60 seconds recording after 2 second delay (optional)
		// export.name('${toString()}'); // file names start with
		// export.folder('${toString()}'); // folder name to export in
		// // export.debug(isDebug);			// debug
		// export.clear(true); // empty folder when start/restart recording

		// // start recording
		// export.start();
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}

	override function toString() {
		return 'cc054a';
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
	var randomHightlight:Point;
	// var color:RGB;
};
