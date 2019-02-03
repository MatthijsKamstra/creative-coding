package art;

import js.html.CanvasRenderingContext2D;
import js.Browser.window;
import js.Browser.document;
import lib.Global.*;

class CCBase {
	public var ctx:CanvasRenderingContext2D;
	public var isDrawActive:Bool = true;
	public var isDebug:Bool = false;

	/**
	 * title of sketch (default: package.className)
	 * @example:
	 * 		trace(title); // "art.CCBase"
	 */
	public var title ( get_title , set_title ) : String;
	private var _title : String = '';

	/**
	 * description of sketch (default: '')
	 */
	public var description ( get_description , set_description ) : String;
	private var _description : String = '';

	/**
	 * constructor
	 * @param ctx
	 */
	public function new(ctx:CanvasRenderingContext2D) {
		this.ctx = ctx;
		window.addEventListener(RESIZE, _reset, false);
		window.addEventListener(KEY_DOWN, _keyDown, false);
		window.addEventListener(KEY_UP, _keyUp, false);
		setup();
		_draw(); // start draw loop
	}

	// ____________________________________ private ____________________________________

	// track key functions
	function _keyDown(e:js.html.KeyboardEvent) {
		// trace(e.key);
	}

	function _keyUp(e:js.html.KeyboardEvent) {}

	// trigger when window resize, draw function is still running, so clear canvas and restart with init
	function _reset() {
		ctx.clearRect(0, 0, w, h);
		setup();
	}

	// wrapper around the real `draw` class
	function _draw(?timestamp:Float) {
		draw();
		if (isDrawActive)
			window.requestAnimationFrame(_draw);
	}

	// ____________________________________ public ____________________________________

	/**
	 * setup your art here, is also the best place to reset data
	 * when the browser resizes
	 */
	@:deprecated("use 'setup' instead")
	public function init() {
		// trace('override public function init()');
	}
	public function setup() {
		// init();
		// trace('override public function setup()');
	}


	// setup
	// update
	// draw
	// touchstart
	// touchmove
	// touchend
	// mouseover
	// mousedown
	// mousemove
	// mouseout
	// mouseup
	// click
	// keydown
	// keyup
	// resize

	/**
	 * the magic happens here, every class should have a `draw` function
	 */
	public function draw() {
		trace('${toString()} :: override public function draw()');
	}

	/**
	 * pause the draw function (toggle function)
	 */
	public function pause() {
		isDrawActive = !isDrawActive;
	}

	/**
	 * stop draw function
	 */
	public function stop() {
		isDrawActive = false;
	}

	/**
	 * play draw function
	 */
	public function play() {
		isDrawActive = true;
	}

	// ____________________________________ getter/setter ____________________________________

	function get_description () : String {
		return _description;
	}
	function set_description(value : String) : String {
		return _description = value;
	}

	function get_title () : String {
		if (_title == '') _title = toString();
		return _title;
	}
	function set_title(value : String) : String {
		return _title = value;
	}

	// ____________________________________ toString() ____________________________________

	/**
	 * Get className, with package
	 * @example:
	 * 		trace(toString()); // this file would be "art.CCBase"
	 */
	public function toString() {
		var className = Type.getClassName(Type.getClass(this));
		return className;
	}
}
