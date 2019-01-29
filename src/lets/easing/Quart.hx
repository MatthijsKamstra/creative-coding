/**
 * @author Joshua Granick
 * @author Philippe / http://philippe.elsass.me
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */
package lets.easing;

class Quart {
	static public var easeIn(get_easeIn, never):IEasing;
	static public var easeInOut(get_easeInOut, never):IEasing;
	static public var easeOut(get_easeOut, never):IEasing;

	private static function get_easeIn():IEasing {
		return new QuartEaseIn();
	}

	private static function get_easeInOut():IEasing {
		return new QuartEaseInOut();
	}

	private static function get_easeOut():IEasing {
		return new QuartEaseOut();
	}
}

class QuartEaseIn implements IEasing {
	public function new() {}

	public function calculate(k:Float):Float {
		return k * k * k * k;
	}

	public function ease(t:Float, b:Float, c:Float, d:Float):Float {
		return c * (t /= d) * t * t * t + b;
	}
}

class QuartEaseInOut implements IEasing {
	public function new() {}

	public function calculate(k:Float):Float {
		if ((k *= 2) < 1)
			return 0.5 * k * k * k * k;
		return -0.5 * ((k -= 2) * k * k * k - 2);
	}

	public function ease(t:Float, b:Float, c:Float, d:Float):Float {
		if ((t /= d / 2) < 1) {
			return c / 2 * t * t * t * t + b;
		}
		return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
	}
}

class QuartEaseOut implements IEasing {
	public function new() {}

	public function calculate(k:Float):Float {
		return -(--k * k * k * k - 1);
	}

	public function ease(t:Float, b:Float, c:Float, d:Float):Float {
		return -c * ((t = t / d - 1) * t * t * t - 1) + b;
	}
}
