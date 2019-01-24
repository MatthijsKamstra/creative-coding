package art;

import js.html.CanvasRenderingContext2D;
import js.Browser.window;

import js.Browser.*;
import js.Browser;
import js.html.*;

import Global.*;

class CCBase {

	public var ctx : CanvasRenderingContext2D;

	public var isDrawActive : Bool = true;

	public function new (ctx:CanvasRenderingContext2D){
		this.ctx = ctx;
		_draw(); // start draw loop
	}

	/**
	 * wrapper around the real draw class, which is normally overriden
	 * @param timestamp
	 */
	function _draw (?timestamp:Float){
		draw();
		if(isDrawActive) window.requestAnimationFrame (_draw);
	}

	/**
	 * the magic happens here
	 */
	public function draw(){
		trace('override public function draw()');
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
	 * example: this file would be "art.CCBase"
	 */
	public function toString(){
		var className = Type.getClassName(Type.getClass(this));
		return className;
	}

}