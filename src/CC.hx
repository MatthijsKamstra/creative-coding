package;

import js.html.*;
import js.html.MouseEvent;
import js.html.Event;

import Global.*;

class CC {

	public var window = js.Browser.window;
	public var document = js.Browser.document;

	public var MOUSE_DOWN : String = 'mousedown';
	public var MOUSE_UP : String = 'mouseup';
	public var MOUSE_MOVE : String = 'mousemove';
	public var KEY_DOWN : String = 'keydown';
	public var KEY_UP : String = 'keyup';



	public function new() {
		// trace('cc');



		window.addEventListener(MOUSE_MOVE, function(e:MouseEvent) {
			mouseX = e.clientX;
			mouseY = e.clientY;
			mouseMoved = true;
			// trace(mouseX, mouseY);
		});

		window.addEventListener(MOUSE_DOWN, function(e){
			mouseDown = true;
			// if(typeof onMouseDown == 'function') onMouseDown();
		});

		window.addEventListener(MOUSE_UP, function(e){
			mouseDown = false;
			// if(typeof onMouseUp == 'function') onMouseUp();
		});

		window.addEventListener(KEY_DOWN, function(e){
			// if(typeof onKeyDown == 'function') onKeyDown(e);
		});

		window.addEventListener(KEY_UP, function(e){
			// if(typeof onKeyUp == 'function') onKeyUp(e);
		});



	}



	// document.onmousedown = function() {
	// 	mousePressed = 1;
	// 	//window.mousePressed();
	// }
	// document.onmouseup = function() {
	// 	mousePressed = 0;
	// 	mouseReleased = 1;
	// 	//window.mouseup();
	// }

}