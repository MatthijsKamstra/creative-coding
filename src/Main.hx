package;

import js.Browser.*;
import js.html.*;

import Sketch;
import art.*;
import model.constants.App;

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
				default :
					trace ("case '"+hash+"': new "+hash+"(ctx);");
					location.hash = 'CC006';
					new CC006(ctx);

			}

			// make sure the browser updates after chang hash
			window.addEventListener("hashchange", function (){
				location.reload();
			} , false);
		});
	}

	static public function main () {
		var app = new Main ();
	}
}
