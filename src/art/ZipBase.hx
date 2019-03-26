package art;

import cc.tool.export.Zip;

class ZipBase extends CCBase {
	public var zip:Zip;

	/**
	 * constructor
	 * @param ctx
	 */
	public function new(ctx:CanvasRenderingContext2D) {
		zip = new Zip(ctx);
		zip.delay(0);
		zip.recordInSeconds(7);
		zip.menu(false);
		zip.embedScripts(onZipHandler);
		super(ctx);
	}

	function onZipHandler(?value:String) {
		trace(value);
		zip.start();
	}

	/**
	 * add pulse to draw function
	 */
	override function draw() {
		// super.draw(); // don't forget to add
		zip.pulse();
	}
}
