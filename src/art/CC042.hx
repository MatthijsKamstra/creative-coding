package art;

/**
 * short description what this does
 */
class CC042 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Happy mistake';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	function drawShape() {
		var r = Math.min(w, h) / 2.3;
		ctx.strokeColourRGB(BLACK, 0.1);
		ctx.strokeEllipse(w / 2, h / 2, random(0, r), random(0, r));
	}

	override function setup() {
		trace('setup: ${toString()}');
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);
	}

	override function draw() {
		drawShape();
	}
}
