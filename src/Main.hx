package;

import js.Browser.*;
import js.html.*;

import Sketch;
import art.*;
import lib.model.constants.App;
import lib.Global.*;


using StringTools;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {

	public function new () {
		document.addEventListener("DOMContentLoaded", function(event) {
			// DOM ready
			console.log('${App.NAME} :: build: ${App.BUILD}');

			// setup canvas
			var ctx : CanvasRenderingContext2D = Sketch.create("creative_code_mck");

			// get hash from url
			var hash = js.Browser.location.hash;
			hash = hash.replace('#', '');
			switch (hash) {
				case 'CC000': new CC000(ctx);
				case 'CC001': new CC001(ctx);
				case 'CC002': new CC002(ctx);
				case 'CC003': new CC003(ctx);
				case 'CC004': new CC004(ctx);
				case 'CC005': new CC005(ctx);
				case 'CC006': new CC006(ctx);
				case 'CC007': new CC007(ctx);
				case 'CC008': new CC008(ctx);
				case 'CC009': new CC009(ctx);
				case 'CC010': new CC010(ctx);
				case 'CC011': new CC011(ctx);
				case 'CC012': new CC012(ctx);
				default :
					trace ("case '"+hash+"': new "+hash+"(ctx);");
					location.hash = 'CC012';
					new CC012(ctx);

			}

			var count = Std.parseInt(hash.toLowerCase().replace('cc',''));

			// make sure the browser updates after changing the hash
			window.addEventListener("hashchange", function (){
				location.reload();
			} , false);

			// use cursor key lef and right to switch sketches
			window.addEventListener(KEY_DOWN, function (e:js.html.KeyboardEvent){
				switch (e.key) {
					case 'ArrowRight': count++;
					case 'ArrowLeft': count--;
					// default : trace ("case '"+e.key+"': trace ('"+e.key+"');");
				}
				location.hash = 'CC' + Std.string(count).lpad('0',3);
			}, false);

		});
	}

	static public function main () {
		var app = new Main ();
	}
}
