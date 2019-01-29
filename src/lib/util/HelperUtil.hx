package lib.util;

import js.Browser.*;

class HelperUtil {
	public function new() {}

	/**
	 * @url 	https://github.com/mrdoob/stats.js/
	 *
	 * @example		li.util..HelperUtil.stats();
	 */
	static public function stats() {
		untyped __js__("var script = document.createElement('script');script.onload = function() {var stats = new Stats();document.body.appendChild(stats.dom);requestAnimationFrame(function loop() {stats.update();requestAnimationFrame(loop)});};script.src = '//mrdoob.github.io/stats.js/build/stats.min.js';document.head.appendChild(script);");

		/*
		var script = document.createElement('script');
		script.onload = function() {
			var stats = new Stats();
			document.body.appendChild(stats.dom);
			requestAnimationFrame(function loop() {
				stats.update();
				requestAnimationFrame(loop)
			});
		};
		script.src = '//mrdoob.github.io/stats.js/build/stats.min.js';
		document.head.appendChild(script);
		*/
	}
}
