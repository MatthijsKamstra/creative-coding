package;

/**
 * @source
 * 			https://groups.google.com/forum/#!topic/haxelang/CPbyE3WCvnc
 * 			https://gist.github.com/nadako/5913724
 */
class Global {
	// public static function parseInt(s:String):Int { return Std.parseInt(s); }
	// public static function int(f:Float):Int { return Std.int(f); }
	// public static function is(v:Dynamic, t:Dynamic):Bool { return Std.is(v, t); }
	// public static function typeof(o:Dynamic):Type.ValueType { return Type.typeof(o); }
	// public static var DEBUG_LEVEL:Int = 3;

	public static var MOUSE_DOWN:String = 'mousedown';
	public static var MOUSE_UP:String = 'mouseup';
	public static var MOUSE_MOVE:String = 'mousemove';
	public static var KEY_DOWN:String = 'keydown';
	public static var KEY_UP:String = 'keyup';
	public static var RESIZE:String = 'resize';

	public static var mouseX:Int;
	public static var mouseY:Int;
	public static var mouseMoved:Bool;
	public static var mouseDown:Bool;

	public static var keyDown:Int;
	public static var keyUp:Int;

	public static var mousePressed:Int = 0;
	public static var mouseReleased:Int = 0;

	public static var isFullscreen:Bool = false;

	public static var TWO_PI:Float = Math.PI * 2;

	// allows me global access to canvas and it’s width and height properties
	public static var w:Int;
	public static var width:Int;
	public static var h:Int;
	public static var height:Int;
}
