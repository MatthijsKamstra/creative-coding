package art;

interface ICCBase {
	/**
	 * setup data, setup animation
	 */
	public function init():Void;

	/**
	 * draw on framerate, only usefull for animation
	 */
	public function draw():Void;
}