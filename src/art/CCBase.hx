package art;

import js.html.CanvasRenderingContext2D;
import js.Browser.window;
import js.Browser.document;
import Sketch.Global.*;
// import cc.tool.export.ExportWrapperFake;
import cc.tool.export.IExportWrapper;
import cc.tool.export.ExportWrapper.ExportType.ZIP;

class CCBase extends Sketch.SketchBase implements ICCBase {
	public var export:IExportWrapper; // just a dummy class so I don't have to delete the export

	// use for export
	public static var _startT:Float;
	public static var _endT:Float;

	public var startT:Float;
	public var endT:Float;

	/**
	 * set types for sketch
	 */
	public var type(get, set):Array<CCType>;

	private var _type:Array<CCType> = [BASE];

	/**
	 * title of sketch (default: package.className)
	 * @example:
	 * 		trace(title); // "art.CCBase"
	 */
	public var title(get, set):String;

	private var _title:String = '';

	/**
	 * description of sketch (default: '')
	 */
	public var description(get, set):String;

	private var _description:String = '';

	/**
	 * constructor
	 * @param ctx
	 */
	public function new(ctx:CanvasRenderingContext2D) {
		// export = new cc.tool.export.ExportNone();
		super(ctx);
	}

	// ____________________________________ getter/setter ____________________________________

	function get_description():String {
		return _description;
	}

	function set_description(value:String):String {
		return _description = value;
	}

	function get_title():String {
		if (_title == '')
			_title = toString();
		return _title;
	}

	function set_title(value:String):String {
		return _title = value;
	}

	function get_type():Array<CCType> {
		return _type;
	}

	function set_type(value:Array<CCType>):Array<CCType> {
		return _type = value;
	}
}

class CCExport extends cc.tool.export.ExportWrapper {
	override public function new(ctx:CanvasRenderingContext2D, ?fileName:String) {
		super(ctx, fileName);
	}

	override public function type(val:cc.tool.export.ExportWrapper.ExportType) {}

	override public function recordInSeconds(val:Float) {}

	override public function stop() {
		CCBase._endT = Date.now().getTime();
		trace('[Export] stop ${(CCBase._endT - CCBase._startT) / 1000}.sec');
	}

	override public function start() {
		CCBase._startT = Date.now().getTime();
		trace('[Export] start');
	}
}

@:enum abstract CCType(String) {
	var ANIMATION = 'Animation';
	var INTERACTIVE = 'Interactive';
	var TOOL = 'Tool';
	var IMAGE = 'Image';
	var RANDOM = 'Random';
	var TEST = 'Test';
	var BASE = 'Base';
}
