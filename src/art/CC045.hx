package art;

/**
 * short description what this does
 */
class CC045 extends CCBase implements ICCBase {

	var _radius = 150;
	var max = 1000;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Repeating a lot of cirlces, just a nice image';
		type = [CCType.IMAGE];
		super(ctx);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);

		ctx.strokeColourRGB(WHITE, 0.05);
		ctx.strokeWeight(1);

		var offset = 50;
		for (i in 0...max) {
			var offsetX = random(-offset, offset);
			var offsetY = random(-offset, offset);
			ctx.strokeCircle(offsetX + w / 2, offsetY + h / 2, h / 3);
		}
	}


	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
