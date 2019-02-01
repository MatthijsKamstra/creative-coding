package lib.tools;

// import lib.AST;
import js.html.CanvasRenderingContext2D;
import lib.Global.*;
import lib.util.ColorUtil.RGBObject;

class Line {

	private var _id : String;
	private var _type : String = 'line';
	private var _ctx:CanvasRenderingContext2D;
	private var _stroke : Int = 1;
	private var _r : Int = 255;
	private var _g : Int = 255;
	private var _b : Int = 255;
	private var _a : Float = 1;
	// private var _rgb : String = '';


	private var _points : Array<Point> = [];


	/**
	 * not sure this is the way to go...
	 *
	 * maybe I find a better solution... or a easier methode
	 * @ example
	 * 				var line = Line.create(ctx).point(new Point(w/3,h/3)).point(new Point((w/3)*2,(h/3)*2)).rgbaObj(MAROON,0.5).stroke(10);
					trace(line.points[0].x);
					trace(line.points[1]);
					trace(line.a);
	 *
	 */


	public function new(ctx:CanvasRenderingContext2D) {
		_ctx = ctx;
	}

	static inline public function create(ctx:CanvasRenderingContext2D):Line {
		var line = new Line(ctx);
		return line;
	}

	// ____________________________________ properties ____________________________________

	inline public function point(point:Point):Line {
		_points.push(point);
		// [mck] TODO make sure there are just two points
		return this;
	}

	inline public function rgb(r:Int, g:Int, b:Int):Line {
		_r = r;
		_g = g;
		_b = b;
		return this;
	}
	inline public function rgba(r:Int, g:Int, b:Int, a:Float):Line{
		_r = r;
		_g = g;
		_b = b;
		_a = a;
		return this;
	}
	inline public function rgbaObj(rgb:RGBObject, a:Float):Line{
		_r = rgb.r;
		_g = rgb.g;
		_b = rgb.b;
		_a = a;
		return this;
	}
	inline public function alpha(a:Float):Line{
		_a = a;
		return this;
	}
	inline public function stroke(width:Int):Line{
		_stroke = width;
		return this;
	}


	// ____________________________________ getter/setter ____________________________________

	public var points ( get_points , set_points ) : Array<Point>;
	function get_points () : Array<Point> {
		return _points;
	}
	function set_points(value : Array<Point>) : Array<Point> {
		return _points = value;
	}

	public var a ( get_a , set_a ) : Float;
	function get_a () : Float {
		return _a;
	}
	function set_a(value : Float) : Float {
		return _a = value;
	}

	public var r ( get_r , set_r ) : Int;
	function get_r () : Int {
		return _r;
	}
	function set_r(value : Int) : Int {
		return _r = value;
	}

	public var g ( get_g , set_g ) : Int;
	function get_g () : Int {
		return _g;
	}
	function set_g(value : Int) : Int {
		return _g = value;
	}

	public var b ( get_b , set_b ) : Int;
	function get_b () : Int {
		return _b;
	}
	function set_b(value : Int) : Int {
		return _b = value;
	}

	public var lineWidth ( get_lineWidth , set_lineWidth ) : Int;
	// private var _stroke : Int;

	function get_lineWidth () : Int {
		return _stroke;
	}
	function set_lineWidth(value : Int) : Int {
		return _stroke = value;
	}

}

class Point {
	public var x:Int;
	public var y:Int;
	/**
	 * send floats, get Ints
	 * @param x
	 * @param y
	 */
	public function new (x:Float, y:Float){
		this.x = Math.round(x);
		this.y = Math.round(y);
	}
}