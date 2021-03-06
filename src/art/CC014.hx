package art;

// import ColorUtil;

/**
 * short description what this does
 */
class CC014 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var flipColorB:RGB = BLACK;
	var flipColorW:RGB = WHITE;
	var shapeMax = 10;

	public function new(ctx:CanvasRenderingContext2D) {
		Text.embedGoogleFont('Six+Caps', onEmbedHandler);
		Text.embedGoogleFont('Barlow+Condensed', onEmbedHandler);

		super(ctx);

		description = 'Blink black and white';
	}

	function onEmbedHandler(e) {
		trace('Embed: "${e}"');
		draw();
		onFlipColorHandler();
	}

	function onFlipColorHandler() {
		if (posNeg() <= 0) {
			flipColorB = BLACK;
			flipColorW = WHITE;
		} else {
			flipColorB = WHITE;
			flipColorW = BLACK;
		}
		Go.timer(random(0, .7)).onComplete(onFlipColorHandler);
	}

	function createShape(i:Int) {
		var circle:Circle = {
			_id: '$i',
			_type: 'circle',
			x: random(0, w),
			y: random(0, h),
			size: random(10, 100),
		}
		Reflect.setField(circle, 'stroke', 20);
		onCircleHandler(circle);
		return circle;
	}

	function onCircleHandler(circle:Circle) {
		// trace(untyped circle.stroke);
		var r = Math.round(random(1, 20));
		Go.to(circle, random(1, 5))
			.x(random(0, w))
			.y(random(0, h))
			.prop('size', Math.round(random(10, 100)))
			.prop('stroke', r)
			.ease(Sine.easeInOut)
			.onComplete(onCircleHandler, [circle])
			.delay(random(0, 2));
	}

	function drawShape() {


		ctx.fillStyle = getColourObj(flipColorW);
		// Text.centerFillText(ctx, '[MCK]', w/2, h/2+200, "'Six Caps', sans-serif", 500);
		Text.centerFillText(ctx, '[mck]', w / 2, h / 2 + 50, "'Barlow Condensed', sans-serif", 300);

		ctx.globalCompositeOperation = 'xor';

		// ctx.globalCompositeOperation = 'source-out';
		// ctx.save();
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.strokeColourObj(flipColorW);
			ctx.strokeWeight(untyped sh.stroke);
			ctx.strokeCircle(sh.x, sh.y, sh.size / 2);
		// ctx.globalCompositeOperation = 'source-out';
		}
		// ctx.restore();

		// Text.centerFillText(ctx, '[mck]', w / 2, h / 2 + 50, "'Barlow Condensed', sans-serif", 300);

		// ctx.save();

		// // ctx.globalCompositeOperation = 'destination-out';
		// ctx.fillStyle = getColourObj(LIME);
		// ctx.circle(w/2, h/2, 100);
		// ctx.globalCompositeOperation = 'xor';
		// ctx.fillStyle = getColourObj(FUCHSIA);
		// Text.centerFillText(ctx, '[mck]', w / 2, h / 2 + 50, "'Barlow Condensed', sans-serif", 300);


		// ctx.globalCompositeOperation = "source-over";


		// ctx.restore();



	}

	override function setup() {
		trace('setup: ${toString()}');
		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w/2, h/2, 200);
		for (i in 0...shapeMax) {
			shapeArray.push(createShape(i));
		}
	}

	override function draw() {
		// trace('draw: ${toString()}');
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(flipColorB);
		drawShape();

		// stop();
	}
}
