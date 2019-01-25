package art;

import js.html.CanvasRenderingContext2D;
import js.Browser.window;

class CCBase {

	public var ctx : CanvasRenderingContext2D;

	public var isDrawActive : Bool = true;

	public function new (ctx:CanvasRenderingContext2D){
		this.ctx = ctx;
		init();
		_draw(); // start draw loop
	}

	public function init(){
		// trace('override public function init()');
	}

	/**
	 * wrapper around the real `draw` class
	 * @param timestamp
	 */
	function _draw (?timestamp:Float){
		draw();
		if(isDrawActive) window.requestAnimationFrame (_draw);
	}

	/**
	 * the magic happens here, every class should have a `draw` function
	 */
	public function draw(){
		trace('${toString()} :: override public function draw()');
	}

	/**
	 * pause the draw function (toggle function)
	 */
	public function pause(){
		isDrawActive = !isDrawActive;
	}
	/**
	 * stop draw function
	 */
	public function stop(){
		isDrawActive = false;
	}
	/**
	 * play draw function
	 */
	public function play(){
		isDrawActive = true;
	}

	/**
	 * Get name of class, with package
	 *
	 * @example: trace(toString()); // this file would be "art.CCBase"
	 */
	public function toString(){
		var className = Type.getClassName(Type.getClass(this));
		return className;
	}

}