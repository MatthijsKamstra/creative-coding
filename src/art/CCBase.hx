package art;

import js.html.CanvasRenderingContext2D;
import js.Browser.window;
import js.Browser.document;
import Sketch.Global.*;
// import cc.tool.export.ExportWrapperFake;
import cc.tool.export.IExportWrapper;

class CCBase extends Sketch.SketchBase implements ICCBase {
	// public var export:IExportWrapper; // just a dummy class so I don't have to delete the export

	/**
	 * set types for sketch
	 */
	public var type(get_type, set_type):Array<CCType>;

	private var _type:Array<CCType> = [BASE];

	/**
	 * title of sketch (default: package.className)
	 * @example:
	 * 		trace(title); // "art.CCBase"
	 */
	public var title(get_title, set_title):String;

	private var _title:String = '';

	/**
	 * description of sketch (default: '')
	 */
	public var description(get_description, set_description):String;

	private var _description:String = '';

	/**
	 * constructor
	 * @param ctx
	 */
	public function new(ctx:CanvasRenderingContext2D) {
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

@:enum abstract CCType(String) {
	var ANIMATION = 'Animation';
	var INTERACTIVE = 'Interactive';
	var TOOL = 'Tool';
	var IMAGE = 'Image';
	var RANDOM = 'Random';
	var TEST = 'Test';
	var BASE = 'Base';
}
