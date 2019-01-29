package art;

/**
 * short description what this does
 */
class CC000 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function init(){
		trace('init: ${toString()}');
		var rgb = randomColourObject();
		ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		ctx.xcross(w/2, h/2, 200);
	}

	override function draw(){
		trace('draw: ${toString()}');
		stop();
	}
}