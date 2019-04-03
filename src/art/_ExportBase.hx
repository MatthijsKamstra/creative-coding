package art;

import cc.tool.export.Zip;

class ExportBase extends CCBase {
	public var zip:Zip;

	/**
	 * constructor
	 * @param ctx
	 */
	public function new(ctx:CanvasRenderingContext2D) {
		zip = new Zip(ctx, toString());
		zip.delay(0);
		zip.recordInSeconds(7);
		zip.menu(false);
		zip.onRecordComplete(onRecordHandler);
		zip.onExportComplete(onExportHandler);
		zip.embedScripts(onZipHandler);
		super(ctx);
	}

	function onZipHandler(?value:String) {
		trace(value);
		zip.start();
	}

	function onRecordHandler() {
		trace('onRecordHandler');
		stop();
	}

	function onExportHandler() {
		trace('onExportHandler');
		start();
	}

	/**
	 * add pulse to draw function
	 */
	override function draw() {
		// super.draw(); // don't forget to add
		zip.pulse();
	}
}
