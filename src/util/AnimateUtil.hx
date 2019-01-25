package util;

class AnimateUtil {

	public function new() {	}

	public static function tween(pos:Float, target, ?speed) {
		if (speed == null) speed = 20;
		pos += (target - pos) / speed;
		return pos;
	}

	/**
	 * check if this `num` is still inbetween `min` and `max` return a true, otherwise a false
	 *
	 * primarily used for bouncing balls
	 *
	 * @param num	value to check
	 * @param min	minimum value
	 * @param max	maximum value
	 * @param sz	(optional) works with centered shapes, is the width of this shape
	 * @return Bool
	 */
	public static function bounce(num:Float, min:Float, max:Float, ?sz:Float = 0) : Bool {
		if (num >= max - sz / 2 || num - sz / 2 <= min) {
			return true;
		} else {
			return false;
		}
	}

}