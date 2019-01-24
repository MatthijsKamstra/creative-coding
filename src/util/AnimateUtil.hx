package util;

class AnimateUtil {
	public function new() {

	}


	public static function tween(pos:Float, target, ?speed) {
		if (speed == null) speed = 20;
		pos += (target - pos) / speed;
		return pos;
	}

	public static function bounce(num, min, max, sz) {
		if (sz == null) {
			sz = 0;
		}
		if (num >= max - sz / 2 || num - sz / 2 <= min) {
			return 1;
		} else {
			return 0;
		}
		// return num > max ? -1 : num < min ? -1 : 1
	}

}