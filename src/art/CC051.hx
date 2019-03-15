package art;

import js.Browser.*;

/**
 * short description what this does
 */
class CC051 extends CCBase implements ICCBase {

	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	// font
	var isFondEmbedded = false;

	/**
		*
		* .your-style {
		font-family: 'Gunplay';
		font-weight: normal;
		font-style: normal;
		}
		*
		* @param ctx
	 */
	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.TOOL, CCType.IMAGE];

		super(ctx);

		var font = new FontFace('Gunplay', 'url(assets/font/gunplay/Gunplay-Regular.woff2)', {
			style: 'normal',
			weight: '400',
		});
		document.fonts.add(font);
		font.load();
		font.loaded.then(function(fontface) {
			trace(fontface.family);
			isFondEmbedded = true;
			drawShape();
		});
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(_color4);
		if (isFondEmbedded) {
			ctx.fillStyle = getColourObj(_color0);
			Text.centerFillText(ctx, 'GUNPLAY', w / 2, h / 2, "'Gunplay', sans-serif;", 160);

			ctx.fillStyle = getColourObj(_color1);
			ctx.font = '100px Gunplay';
			ctx.textAlign = 'center';
			ctx.textBaseline = 'middle';
			ctx.fillText('TEQ63: RAVAGER', w / 2, (h / 2) + 200);

			// Text.centerFillText(ctx, 'TEQ63: RAVAGER', w/2, (h/2)+200, "'Gunplay', sans-serif;", 160);
		}
	}

	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = ColorUtil.niceColor100SortedString[randomInt(ColorUtil.niceColor100SortedString.length - 1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);

		isDebug = true;
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
