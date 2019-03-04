package;

import js.Browser.*;
import js.html.*;
import Sketch;
import art.*;
import lib.model.constants.App;
import Sketch.Global.*;

using StringTools;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {
	var count:Int;

	public function new() {
		document.addEventListener("DOMContentLoaded", function(event) {
			// DOM ready
			console.log('${App.NAME} :: build: ${App.BUILD}');

			// setup canvas
			var ctx:CanvasRenderingContext2D = Sketch.create("creative_code_mck");

			// get hash from url
			var hash = js.Browser.location.hash;
			hash = hash.replace('#', '');

			// trace(Type.resolveClass('CCtest00'));
			// trace(Type.resolveClass('art.CCtest00'));

			// trace(Type.createInstance(Type.resolveClass('art.CCtest00'),[ctx]));

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
				case 'CC013': new CC013(ctx);
				case 'CC014': new CC014(ctx);
				case 'CC015': new CC015(ctx);
				case 'CC016': new CC016(ctx);
				case 'CC017': new CC017(ctx);
				case 'CC018': new CC018(ctx);
				case 'CC019': new CC019(ctx);
				case 'CC020': new CC020(ctx);
				case 'CC021': new CC021(ctx);
				case 'CC022': new CC022(ctx);
				case 'CC023': new CC023(ctx);
				case 'CC024': new CC024(ctx);
				case 'CC025': new CC025(ctx);
				case 'CC026': new CC026(ctx);
				case 'CC027': new CC027(ctx);
				case 'CC028': new CC028(ctx);
				case 'CC029': new CC029(ctx);
				case 'CC030': new CC030(ctx);
				case 'CC031': new CC031(ctx);
				case 'CC032': new CC032(ctx);
				case 'CC033': new CC033(ctx);
				case 'CC034': new CC034(ctx);
				case 'CC035': new CC035(ctx);
				case 'CC036': new CC036(ctx);
				case 'CC037': new CC037(ctx);
				case 'CC038': new CC038(ctx);
				case 'CC039': new CC039(ctx);
				case 'CC040': new CC040(ctx);
				case 'CC041': new CC041(ctx);
				case 'CC042': new CC042(ctx);
				case 'CC043': new CC043(ctx);
				case 'CC044': new CC044(ctx);
				case 'CC045': new CC045(ctx);
				case 'CC046': new CC046(ctx);
				case 'CC047': new CC047(ctx);
				case 'CC048': new CC048(ctx);
				case 'CC049': new CC049(ctx);
				case 'CC050': new CC050(ctx);
				default:
					trace("case '" + hash + "': new " + hash + "(ctx);");
					location.hash = 'CC050';
					new CC050(ctx);
			}

			count = Std.parseInt(hash.toLowerCase().replace('cc', ''));

			var snackbar = new lib.html.Snackbar();
			snackbar.show('sketch $hash');

			var left = new lib.html.Nav();
			var ldiv = left.dir('left');
			ldiv.onclick = function() {
				trace('left');
				count--;
				changeHash();
			};
			var right = new lib.html.Nav();
			var rdiv = right.dir('right');
			rdiv.onclick = function() {
				trace('right');
				count++;
				changeHash();
			};

			// make sure the browser updates after changing the hash
			window.addEventListener("hashchange", function() {
				location.reload();
			}, false);

			// use cursor key lef and right to switch sketches
			window.addEventListener(KEY_DOWN, function(e:js.html.KeyboardEvent) {
				switch (e.key) {
					case 'ArrowRight':
						count++;
					case 'ArrowLeft':
						count--;
					case 'ArrowUp':
						count = 1000000;
					case 'ArrowDown':
						count = 0;
						// default : trace ("case '"+e.key+"': trace ('"+e.key+"');");
				}
				location.hash = 'CC' + Std.string(count).lpad('0', 3);
			}, false);
		});
	}

	function changeHash() {
		location.hash = 'CC' + Std.string(count).lpad('0', 3);
	}

	static public function main() {
		var app = new Main();
	}
}
