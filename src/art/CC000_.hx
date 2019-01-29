package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

// easy access to Globals
import lib.Global.*;
// easy access to the utils
import lib.util.MathUtil.*;
import lib.util.ColorUtil.*;
import lib.util.AnimateUtil.*;
// easy access to typedef
import lib.AST;

// syntactic sugar to extend CanvasRenderingContext2D
using lib.CanvasTools;
using lib.util.ShapeUtil;

/**
 * short description what this does
 */
class CC000 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function init(){
		trace('init: ${toString()}');
		ctx.colour(ORANGE.r, ORANGE.g, ORANGE.b);
		ctx.xcross(w/2, h/2, 200);
	}

	override function draw(){
		trace('draw: ${toString()}');
		stop();
	}
}