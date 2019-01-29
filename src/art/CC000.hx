package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

//	quick and dirtier way to create Globals
import lib.Global.*;

//  syntactic sugar to extend CanvasRenderingContext2D
using lib.CanvasTools;

class CC000 extends CCBase implements ICCBase {

	var xpos : Int = 10;
	var ypos : Int = 10;
	var rotate : Int = 0;
	var size : Int = 10;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function draw(){
		trace('draw: ${toString()}');
		// xpos++;
		// ypos++;
		rotate++;
		size++;
		ctx.save();
		ctx.translate(w/2, h/2);
		ctx.rotate(rotate);
		ctx.centreStrokeRect(0, 0, size);
		ctx.restore();

		if(size >= 1000) pause();

		// console.log("mouseX:" + mouseX + " // mouseY: " + mouseY);
	}
}