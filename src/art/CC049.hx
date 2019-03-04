package art;

import lib.model.constants.Onom;

/**
 * short description what this does
 */
class CC049 extends CCBase implements ICCBase {
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;

	var _text:String = '[mck]';
	var _stroke:Int = 20;
	var _grid = 10;
	var _gridX = 10;
	var _gridY = 10;

	var panel1:QuickSettings;
	var onom:Onom = new Onom();

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		createQuickSettings();

		super(ctx);
	}

	// ____________________________________ settings ____________________________________

	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Onom font")
			.setGlobalChangeHandler(untyped drawShape)
			.addHTML("Onom", "how to draw fonts from scratch")

			.addText('Text', '[mck]', function(value) setText(value))

			.addRange('Stroke', 1, 100, _stroke, 1, function(e) setStroke(e)) // .addTextArea('Quote', '[]', function (value) trace(value) )
			.addRange('Grid', 1, 100, _grid, 1, function(e) setGrid(e)) // .addTextArea('Quote', '[]', function (value) trace(value) )
			.addRange('GridX', 1, 100, _grid, 1, function(e) setGridX(e)) // .addTextArea('Quote', '[]', function (value) trace(value) )
			.addRange('GridY', 1, 100, _grid, 1, function(e) setGridY(e)) // .addTextArea('Quote', '[]', function (value) trace(value) )

				// .addBoolean('All Caps', false, function (value) trace(value) )

			.saveInLocalStorage('store-data-${toString()}');
	}

	// ____________________________________ set settings ____________________________________

	function setText(value) {
		_text = value;
	}

	function setStroke(value) {
		_stroke = value;
	}
	function setGrid(value) {
		if(panel1 != null){
			panel1.setValue('GridX' , value);
			panel1.setValue('GridY' , value);
		}
		_grid = value;
	}
	function setGridX(value) {
		_gridX = value;
	}
	function setGridY(value) {
		_gridY = value;
	}


	// ____________________________________ draw shape  ____________________________________
	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		var xpadding = 100;
		var ypadding = 100;

		var offsetx = 0;
		var offsety = 0;

		var inputArray:Array<String> = _text.split('');
		for (i in 0...inputArray.length) {
			var char = inputArray[i];
			var charPointArray = null;
			charPointArray = onom.getChar(char);
			ctx.beginPath();
			ctx.lineCap = 'round';
			ctx.lineJoin = 'round';
			ctx.strokeColourRGB(BLACK);
			ctx.strokeWeight(_stroke);

			for (i in 0...charPointArray.length) {
				var m = charPointArray[i];

				var xpos:Int = (offsetx * (9 * _gridX)) + (m.x * _gridX);
				var ypos = (offsety * (15 * _gridY)) + (m.y * _gridY);

				if (i == 0)
					ctx.moveTo(xpos + xpadding, ypos + ypadding);
				else
					ctx.lineTo(xpos + xpadding, ypos + ypadding);
			}
			ctx.stroke();

			offsetx++;
		}

		// testMe();
	}

	// ____________________________________ override ____________________________________

	override function setup() {
		trace('setup: ${toString()}');
		isDebug = true;
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}

	// ____________________________________ test ____________________________________

	function testMe() {
		var m = onom.getChar('x');

		var xpadding = 100;
		var ypadding = 100;
		var scale = 50;
		trace(m);

		ctx.beginPath();
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';
		ctx.strokeColourRGB(BLACK);
		ctx.strokeWeight(_stroke);
		for (i in 0...m.length) {
			var _m = m[i];
			var xpos = _m.x * scale;
			var ypos = _m.y * scale;
			if (i == 0)
				ctx.moveTo(xpos + xpadding, ypos + ypadding);
			else
				ctx.lineTo(xpos + xpadding, ypos + ypadding);
		}
		ctx.stroke();
	}

}
