package art;

/**
 * short description what this does
 */
class CC011 extends CCBase implements ICCBase {

	var shapeArray : Array<Line> = [];
	var shapeArray2 : Array<{}> = [];
	var shapeMax : Int = Math.round(360/4);
	var radius0 : Int = 150;
	var radius1 : Int = 350;
	var divide : Int = 4;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = 'Equalizer with sound';
	}

	function createShape(i:Int):Line{
		var angle = i*divide;
		var line : Line = {
			_id : i,
			x1 : (w/2)  + Math.cos(radians(angle))*radius0,
			y1 : (h/2)  + Math.sin(radians(angle))*radius0,
			x2 : (w/2)  + Math.cos(radians(angle))*radius1,
			y2 : (h/2)  + Math.sin(radians(angle))*radius1,
			stroke : 10,
			radius : random(radius0, radius1),
		}
		// trace(line);
		onCompleteHandler(line);
		return line;
	}

	function createX(i:Int){
		var obj = {
			_id: i,
			r: WHITE.r,
			g: WHITE.g,
			b: WHITE.b,
			a: 1,
			rotation: 0,
			x: w/2,
			y: h/2,
			size: 160,
			stroke:80
		}
		onXHandler(obj);
		return obj;
	}

	function drawShape(){
		for ( i in 0 ... shapeArray.length ) {
			var line = shapeArray[i];
			var angle = i*divide;
			line.x2 = (w/2)  + Math.cos(radians(angle))*line.radius;
			line.y2 = (h/2)  + Math.sin(radians(angle))*line.radius;
			ctx.lineColour(WHITE.r, WHITE.g, WHITE.b, 1);
			ctx.lineWidth = line.stroke;
			// ctx.lineCap = "round"; // "butt|round|square";
			ctx.line(line.x1,line.y1,line.x2,line.y2);
		}

		for ( i in 0 ... shapeArray2.length ) {
			var shape = shapeArray2[i];
			ctx.save();
			ctx.translate(untyped shape.x, untyped shape.y);
			ctx.rotate(radians(untyped shape.rotation) );
			ctx.strokeColour(untyped shape.r, untyped shape.g, untyped shape.b, untyped shape.a);
			ctx.xcross(0,0, untyped shape.size, untyped shape.stroke);
			ctx.restore();
		}
	}

	// ____________________________________ onHandlers ____________________________________

	function onUpdateHandler(e){
		trace('update: $e');
	}
	function onCompleteHandler(line){
		// trace('complete: $e');
		GoJs.to(line, random(0.5, 1.5)).prop('radius',random(radius0, radius1)).ease(Sine.easeInOut).onComplete(onCompleteHandler,[line]);
	}
	function onXHandler(obj){
		GoJs.to(obj, random(0.5, 1.5)).prop('rotation',random(0, 360)).prop('size',random(150,160)).ease(Sine.easeInOut).onComplete(onXHandler,[obj]).delay(random(0,0.5));
	}

	// ____________________________________ override ____________________________________

	override function init(){
		trace('init: ${toString()}');
		for ( i in 0 ... shapeMax ) {
			shapeArray.push(createShape(i));
		}
		shapeArray2.push(createX(0));
		draw();
	}

	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(BLACK);
		drawShape();
		// stop();
	}
}