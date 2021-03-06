package art;

/**
 * short description what this does
 */
class CC054 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	var panel1:QuickSettings;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet">
		Text.embedGoogleFont('Oswald:200,300,400,500,600,700', onEmbedHandler);

		super(ctx);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		drawShape();
	}

	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Quote generator").setGlobalChangeHandler(untyped drawShape)
			.addHTML("Reason", "Sometimes I need a quick quote, to post on Instagram").addTextArea('Quote', 'text', function(value) trace(value))

			.addBoolean('All Caps', false, function(value) trace(value)).saveInLocalStorage('store-data-${toString()}');
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
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		createEye();
	}

	function createEye() {
		var colorArr = [GREEN, PINK, BLUE, AQUA, TEAL, OLIVE];

		var outerR = 120;
		var innerR = 50;
		// outline
		cc.draw.Circle.create(ctx)
			.pos(w2 + random(-3, 3), h2 + random(-3, 3))
			.fill(BLACK)
			.radius(outerR + 10)
			.draw();

		// eye color
		cc.draw.Circle.create(ctx)
			.pos(w2, h2)
			.fill(colorArr[randomInt(colorArr.length - 1)])
			.radius(outerR)
			.draw();

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

		// // try gradient circle
		// var circle = cc.draw.Circle.create(ctx).radius(20).pos(55,55).radius(20);
		// var grad = cc.draw.Gradient.create(ctx).circle(circle).draw();
		// circle.gradient(grad.get).draw();

		// trace(circle.toString());
		// trace(grad.toString());

		// ctx.fillStyle = grad.get;
		// ctx.fillRect(grad.xpos, grad.ypos, grad.width, grad.height);

		// trace('gradient.xpos: ${grad.xpos} , gradient.ypos: ${grad.ypos}');
		// trace('gradient.width: ${grad.width}  , gradient.height: ${grad.height}');
	}

	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = ColorUtil.niceColor100SortedString[randomInt(ColorUtil.niceColor100SortedString.length - 1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);

		isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(_cellsize);
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
