package art;

class ExportBase extends CCBase {
	/**
	 * constructor
	 * @param ctx
	 */
	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	/**
	 * add pulse to draw function
	 */
	override function draw() {
		// super.draw(); // don't forget to add
		zip.pulse();
	}
}
