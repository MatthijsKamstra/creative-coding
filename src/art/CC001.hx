package art;

import js.Browser.*;
import js.html.*;

import Global.*;

@:keep
class CC001 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function draw(){
		trace('draw: ${toString()}');
		p.circle(100, 100, 100);
		pause();
	}
}