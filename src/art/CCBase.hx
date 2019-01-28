package art;

import js.html.CanvasRenderingContext2D;
import js.Browser.window;
import js.Browser.document;
import Global.*;

class CCBase {
	public var ctx:CanvasRenderingContext2D;
	public var isDrawActive:Bool = true;
	public var isDebug:Bool = false;

	public function new(ctx:CanvasRenderingContext2D) {
		this.ctx = ctx;
		window.addEventListener(RESIZE, _reset, false);
		window.addEventListener(KEY_DOWN, _keyDown, false);
		window.addEventListener(KEY_UP, _keyUp, false);
		init();
		_draw(); // start draw loop
	}

	// track key functions
	function _keyDown(e:js.html.KeyboardEvent) {
		// trace(e.key);
	}

	function _keyUp(e:js.html.KeyboardEvent) {}

	// trigger when window resize, draw function is still running, so clear canvas and restart with init
	function _reset() {
		ctx.clearRect(0, 0, w, h);
		init();
	}

	// wrapper around the real `draw` class
	function _draw(?timestamp:Float) {
		draw();
		if (isDrawActive)
			window.requestAnimationFrame(_draw);
	}

	/**
	 * setup your art here, is also the best place to reset data
	 * when the browser resizes
	 */
	public function init() {
		// trace('override public function init()');
	}

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

	/**
	 * Get className, with package
	 * @example: trace(toString()); // this file would be "art.CCBase"
	 */
	public function toString() {
		var className = Type.getClassName(Type.getClass(this));
		return className;
	}
}
