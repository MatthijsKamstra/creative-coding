package art;

import js.Browser.*;
import js.html.*;

import Global.*;

class CC000 extends CCBase implements ICCBase {

	var xpos : Int = 10;
	var ypos : Int = 10;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function draw(){
		trace('draw: ${toString()}');
		xpos++;
		ypos++;
		p.square(xpos, ypos, 100);
		pause();

		// console.log("mouseX:" + mouseX + " // mouseY: " + mouseY);
	}
}