package old;

import js.html.CanvasRenderingContext2D;

class CCanvasRenderingContext2D extends CanvasRenderingContext2D {

	public function new() {
		// your code
	}

	public function rr(){
		trace('rr');
	}

	public function square (x:Int, y:Int, width:Int, ?height:Int) {
		if (height == null) height = width;
		this.fillRect(x, y, width, height);
	};


}