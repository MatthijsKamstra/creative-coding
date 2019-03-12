package art;

import quicksettings.QuickSettings;

using cc.util.FilterUtil;

/**
 * short description what this does
 */
class CC039a extends CCBase implements ICCBase {
	var ctxHidden:CanvasRenderingContext2D;
	var panel1:QuickSettings;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Image manipulation';

		createQuickSettings();

		super(ctx);
	}

	function QuicksettingsDefaults() {
		panel1.setValue('grayscale', 0);
		panel1.setValue('brightness', 100);
		panel1.setValue('contrast', 100);
		panel1.setValue('invert', 0);
		panel1.setValue('opacity', 100);
		panel1.setValue('saturate', 100);
		panel1.setValue('sepia', 0);
		panel1.setValue('mirrorfran', 0);
		drawShape();
	}

	/**
	 *
	 * https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/filter#Browser_compatibility
	 */
	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Filters")
			.addRange("grayscale", 0, 100, 0, 1, function(value) setFilter("grayscale", value))
			.addRange("brightness", 0, 300, 100, 1, function(value) setFilter("brightness", value))
			.addRange("contrast", 0, 100, 100, 1, function(value) setFilter("contrast", value))
			.addRange("invert", 0, 100, 0, 1, function(value) setFilter("invert", value))
			.addRange("opacity", 0, 100, 100, 1, function(value) setFilter("opacity", value))
			.addRange("saturate", 0, 100, 100, 1, function(value) setFilter("saturate", value))
			.addRange("sepia", 0, 100, 0, 1, function(value) setFilter("sepia", value))
				// .addRange("Range", 0, 100, 30, 1, function(value) output("Range", value))
				// .addNumber("Number", 0, 100, 50, 1, function(value) output("Number", value))
				// .addColor("Color", "#ff0000", function(value) output("Color", value))
				// .addBoolean("Boolean", true, function(value) output("Boolean", value))
			.addDropDown("mirror",["none","horizontal","vertical","both"], function(value) dropdown("DropDown", value))
			// .addBoolean("mirror horizontal", false, function(value) setMirror("mirror horizontal", value)) // .addText("Text", "some text", function(value) output("Text", value))
			// .addBoolean("mirror vertical", false, function(value) setMirror("mirror vertical", value)) // .addText("Text", "some text", function(value) output("Text", value))
			// .addBoolean("mirror both", false, function(value) setMirror("mirror both", value)) // .addText("Text", "some text", function(value) output("Text", value))
			.addBoolean("flip horizonal", false, function(value) setFlip("flip horizonal", value)) // .addText("Text", "some text", function(value) output("Text", value))
			.addBoolean("flip vertical", false, function(value) setFlip("flip vertical", value)) // .addText("Text", "some text", function(value) output("Text", value))
				// .addTextArea("TextArea", "a whole bunch of text can go here", function(value) output("TextArea", value))
			.addButton("Defaults", function(value) QuicksettingsDefaults()) // .addButton("Button", function(value) output("Button", "clicked"))
			.addHTML("Info", "Info. This is a description...");
		// .setKey("s")
		// .saveInLocalStorage("localstoragedemo_v3.0");
	}

	inline function output<T>(name:String, value:T) {
		console.log("Output", '$name: $value');
	}

	function dropdown(value:String, index:Dynamic){
		// trace( 'value: ' + value );
		// trace( 'index: ' + index );
		// trace( 'index.label: ' + index.label );
		switch (index.label) {
			case 'none':
				ctx.drawImage(ctxHidden.canvas, 0, 0, w, h);
			case 'horizontal':
				ctx.drawImage(ctxHidden.canvas, 0, 0, w, h);
				EffectUtil.mirror(ctx, true);
			case 'vertical':
				ctx.drawImage(ctxHidden.canvas, 0, 0, w, h);
				EffectUtil.mirror(ctx, false);
			case 'both':
				ctx.drawImage(ctxHidden.canvas, 0, 0, w, h);
				EffectUtil.mirror(ctx, false);
				EffectUtil.mirror(ctx, true);
				trace ('both');
			default : trace ("case '"+index.label+"': trace ('"+index.label+"');");
		}
	}

	function setFlip(type:String, isTrue:Bool) {
		var isHorizontal = false;
		if (type == 'flip horizonal') isHorizontal = true;
		if (isTrue) {
			EffectUtil.flip(ctx, isHorizontal);
		} else {
			ctx.drawImage(ctxHidden.canvas, 0, 0, w, h);
		}
	}
	function setMirror(type:String, isTrue:Bool) {
		switch (type) {
			case 'mirror horizontal': trace ('mirror horizontal');
			case 'mirror vertical': trace ('mirror vertical');
			case 'mirror both': trace ('mirror both');
			default : trace ("case '"+type+"': trace ('"+type+"');");
		}
		if (isTrue) {
			trace('mirror');
			EffectUtil.mirror(ctx);
		} else {
			trace('reset mirror');
			ctx.drawImage(ctxHidden.canvas, 0, 0, w, h);
		}
	}

	function setFilter(type:String, value:Float) {
		if (ctx == null) return;
		switch (type.toLowerCase()) {
			case 'grayscale': ctx.grayscale(value);
			case 'brightness': ctx.brightness(value);
			case 'contrast': ctx.contrast(value);
			case 'invert': ctx.invert(value);
			case 'opacity': ctx.opacity(value);
			case 'saturate': ctx.saturate(value);
			case 'sepia': ctx.sepia(value);
			default:
				trace("case '" + type + "': trace ('" + type + "');");
		}
		drawShape();
	}

	function drawShape() {
		if (ctxHidden == null) return;

		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// ctx.filter = 'blur(4px)';
		// ctx.grayscale(50);
		ctx.drawImage(ctxHidden.canvas, 0, 0, w, h);
	}

	override function setup() {
		trace('setup: ${toString()}');

		isDebug = true;

		// start loading image
		var img = new Image();
		img.src = 'assets/img/lotus.jpg';
		img.onload = function() {
			var option = new Sketch.SketchOption();
			option.width = img.width;
			option.height = img.height;
			ctxHidden = Sketch.createHiddenCanvas('imageholder', option, false);
			ctxHidden.drawImage(img, 0, 0, img.width, img.height);
			img.style.display = 'none';
			drawShape();
		};
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
