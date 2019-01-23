package art;

import js.html.CanvasRenderingContext2D;
import js.Browser.window;
import util.DrawUtil;

import js.Browser.*;
import js.Browser;
import js.html.*;

import Global.*;

class CCBase {

	public var ctx : CanvasRenderingContext2D;
	public var p : DrawUtil;

	public var isDrawActive : Bool = true;

	public function new (ctx:CanvasRenderingContext2D){
		this.ctx = ctx;
		p = new DrawUtil(ctx);
		// start draw loop
		_draw();
	}

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

	public function pause(){
		isDrawActive = false;
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