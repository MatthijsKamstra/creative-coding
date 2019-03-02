package art;



/**
 * short description what this does
 */
class CC010 extends CCBase implements ICCBase {

	var shapeArray : Array<AnimateObj> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = 'Animating text';
		FontUtil.embedGoogleFont('UnifrakturMaguntia', onEmbedHandler);
		FontUtil.embedGoogleFont('Press+Start+2P', onEmbedHandler);
	}
	function onEmbedHandler(e){
		trace('Embed: "${e}"');
		// FontUtil.centerFillText(ctx, toString(), w/2, h/2, "'UnifrakturMaguntia', cursive", 50);
		// FontUtil.centerFillText(ctx, description, Math.round(w/2), 20, "'Press Start 2P', cursive;", 8);
	}

	function createText(){
		var shape : AnimateObj = {
			x: w/2,
			y: (h/2)+20,
			alpha: 1,
			size: 60,
			type: 'text'
		}
		Reflect.setField(shape, 'text', toString());
		Reflect.setField(shape,'r', BLACK.r);
		Reflect.setField(shape,'g', BLACK.g);
		Reflect.setField(shape,'b', BLACK.b);

		var ypos1 = shape.y - 100;
		var ypos2 = shape.y + 100;

		Go.from(shape, 1.0).x(shape.x).y(ypos1).alpha(0).prop('size',50).ease(Sine.easeOut).delay(2);
		Go.to(shape, 1.0).x(shape.x).y(ypos2).alpha(0).prop('size',50).ease(Sine.easeIn).delay(5.5);

		return shape;
	}

	function createBall(){
		var shape : AnimateObj = {
			x: w/2,
			y: h/2,
			size: 50,
			alpha: 1,
			color: getColourObj (FUCHSIA),
			type: 'ball'
		}
		Reflect.setField(shape,'r', FUCHSIA.r);
		Reflect.setField(shape,'g', FUCHSIA.g);
		Reflect.setField(shape,'b', FUCHSIA.b);
		Reflect.setField(shape,'angle', 0);
		return shape;
	}

	override function setup(){
		trace('setup: ${toString()}');
		shapeArray = [];
		shapeArray.push(createBall());
		shapeArray.push(createText());

		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w/2, h/2, 200);
	}



	public function drawShape ()  {
		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
			if(sh.type == 'text'){
				ctx.fillStyle = getColour(untyped sh.r, untyped sh.g, untyped sh.b, sh.alpha);
				FontUtil.centerFillText(ctx, untyped sh.text, sh.x, sh.y, "'UnifrakturMaguntia', cursive", Math.round(sh.size));
			}
			if(sh.type == 'ball') {
				// var xpos = sh.x
				var radius = 50;
				var speed = 2;
				untyped sh.angle += speed;
				// plot the balls x to cos and y to sin
				sh.x = w/2 + Math.cos(radians(untyped sh.angle))*radius;
				sh.y = h/2 + Math.sin(radians(untyped sh.angle))*radius;

				ctx.fillStyle = getColour(untyped sh.r, untyped sh.g, untyped sh.b, sh.alpha);
				ctx.circle(sh.x, sh.y, sh.size);
			}
		}
	}


	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		// ctx.backgroundObj(BLACK);
		drawShape();
	}
}