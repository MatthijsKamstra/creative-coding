package art;

/**
 * short description what this does
 */
class CC043 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'First attempt at creating snake like patterns';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	var xpos :Float = w/2;
	var ypos :Float = h;

	function drawShape() {

		/*
		var r = Math.min(w, h) / 2.3;
		ctx.strokeColourRGB(BLACK, 0.1);
		ctx.strokeEllipse(xpos, ypos, random(0, r), random(0, r));

		ypos--;

		if(ypos <= -h) {
			trace('stop');
			stop();
		}
		*/



		var imageData = ctx.getImageData(0,0, w,h);
		ctx.putImageData(imageData,0, 1);

		ctx.strokeWeight(2);
		ctx.fillColourRGB(GRAY);
		ctx.strokeColourRGB(BLACK);

		// ctx.circleFillStroke(w/2, h/2, 100);

		var r = Math.min(w, h) / 2.3;
		xpos = w/2;
		ypos = h/3;
		// ctx.strokeColourRGB(BLACK, 1);
		ctx.ellipseFillStroke(xpos, ypos, random(0, r), random(20, 40));



		// ctx.save();
		// ctx.translate(sh.x, sh.y);
		// ctx.rotate(radians(sh.rotation) );
		// ctx.centreFillRect(0, 0, sh.width, sh.height);
		// ctx.restore();

	}

	override function setup() {
		trace('setup: ${toString()}');

		ypos = h;

		ctx.clearRect(0, 0, w, h);
		ctx.backgroundRGB(WHITE);

		isDebug = true;
	}

	override function draw() {
		drawShape();
	}
}
