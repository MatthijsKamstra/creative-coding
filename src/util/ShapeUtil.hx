package util;

/**
 * predefined shapes that are every useful
 */
class ShapeUtil {
	public function new() {}

	/**
	 * [Description]
	 * @param x
	 * @param y
	 * @param width
	 * @param height
	 */
	function cross(x, y, ?width:Float = 20, ?height:Float = 60) {
		ctx.fillRect(x - width / 2, y - height / 2, width, height);
		ctx.fillRect(x - height / 2, y - width / 2, height, width);
	}
}
