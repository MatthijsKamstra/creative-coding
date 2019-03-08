package;

import js.Browser.*;
import js.html.*;
import lib.model.constants.App;
import art.*;
import Sketch;
import Sketch.Global.*;

using StringTools;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {
	var count:Int;
	var hash:String;
	var ccTypeArray : Array <Class<Dynamic>> = [
			CC000,
			CC001,
			CC002,
			CC003,
			CC004,
			CC005,
			CC006,
			CC007,
			CC008,
			CC009,
			CC010,
			CC011,
			CC012,
			CC013,
			CC014,
			CC015,
			CC016,
			CC017,
			CC018,
			CC019,
			CC020,
			CC021,
			CC022,
			CC023,
			CC024,
			CC025,
			CC026,
			CC027,
			CC028,
			CC029,
			CC030,
			CC031,
			CC031a,
			CC032,
			CC033,
			CC034,
			CC035,
			CC036,
			CC037,
			CC038,
			CC039,
			CC040,
			CC041,
			CC042,
			CC043,
			CC044,
			CC045,
			CC046,
			CC047,
			CC048,
			CC049,
			CC050,
			CC051,
			CC051a,
			// CCtest01,
			// CCtest00,
		];

	public function new() {
		document.addEventListener("DOMContentLoaded", function(event) {
			// DOM ready
			console.log('${App.NAME} :: build: ${App.BUILD}');
			setupCC();
			setupNav();
		});
	}

	function setupCC(){
		// setup canvas
		var ctx:CanvasRenderingContext2D = Sketch.create("creative_code_mck");

		// get hash from url
		hash = js.Browser.location.hash;
		hash = hash.replace('#', '');

		var clazz = Type.resolveClass('art.${hash}');
		if(clazz == null) {
			// make sure if it's not in the list, show the latest Sketch
			clazz = ccTypeArray[ccTypeArray.length-1];
		}
		count = ccTypeArray.indexOf(clazz);
		var cc = Type.createInstance(clazz,[ctx]);
		changeHash();
	}

	function setupNav(){
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
					count = ccTypeArray.length-1;
				case 'ArrowDown':
					count = 0;
					// default : trace ("case '"+e.key+"': trace ('"+e.key+"');");
			}
			changeHash();
		}, false);

	}

	function changeHash() {
		location.hash = Type.getClassName(ccTypeArray[count]).replace('art.','');
	}

	static public function main() {
		var app = new Main();
	}
}
