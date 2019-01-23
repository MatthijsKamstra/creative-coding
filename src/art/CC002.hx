package art;

import js.Browser.*;
import js.html.*;

import Global.*;

@:keep
class CC002 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function draw(){
		trace('draw: ${toString()}');
		p.triangle(Math.floor(w/2), 100, Math.floor(w/3), 300, Math.floor(w/3)*2, 300);
		pause();
	}
}