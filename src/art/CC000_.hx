package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

// easy access to Globals
import Global.*;
// easy access to the utils
import util.MathUtil.*;
import util.ColorUtil.*;
import util.AnimateUtil.*;
// easy access to typedef
import AST;

// syntactic sugar to extend CanvasRenderingContext2D
using CanvasTools;
using util.ShapeUtil;

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