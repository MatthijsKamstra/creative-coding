package art;

/**
 * short description what this does
 */
class CC053 extends CCBase implements ICCBase {
	var _isEmbedded = false;
	var panel1:QuickSettings;
	var defaultText = "Hier moet iets staan dat de moeite waard is";
	var _text:String;
	var _radius:Int = 180;
	var _angle:Float = 10;

	public function new(ctx:CanvasRenderingContext2D) {
		// setup Sketch
		var option = new SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		_text = defaultText;

		Text.embedGoogleFont('PT+Mono', onEmbedHandler);
		createQuickSettings();
		super(ctx);
	}

	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Test rotation")
			.setGlobalChangeHandler(untyped drawShape)
			.addTextArea('Reason', 'Test this text in circle thing', null)
			.addTextArea('Quote', defaultText, function(value) setText(value))
			.addRange('angle', 0.0, 10.0, 5.5, .05, function(value) setAngle(value))
			.addRange('radius', 200, 400, 180, 1, function(value) setRadius(value))
			.addNumber('angle2', 0.0, 10.0, 5.5, .05, function(value) setAngle(value))
			.addButton('default', function(e) setText(defaultText))
			.saveInLocalStorage('store-data-${toString()}');
		// .addBoolean('All Caps', false, function(value) trace(value))
	}

	function setText(str:String):Void {
		this._text = str;
	}

	function setRadius(px:Int):Void {
		this._radius = px;
	}

	function setAngle(angle:Float):Void {
		this._angle = angle;
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		this._isEmbedded = true;
		drawShape();
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		if (!_isEmbedded)
			return;

		var centerX = w2;
		var centerY = h2;
		// var angle = Math.PI * 0.8; // radians
		// var radius = 180;
		ctx.fillColourRGB(BLACK);

		// important to have a example text in the canvas, otherwise the measurement don't work
		// important to have the font loaded
		ctx.fillStyle = getColourObj(PINK);
		Text.fillText(ctx, _text, w2, h2, "PT Mono", 20);

		// use and create with the correct fonr
		ctx.fillColourRGB(BLACK);
		ctx.textAlign = "center";
		ctx.textBaseline = "bottom";
		ctx.font = '20px PT Mono';
		TextUtil.drawTextAlongArc4(ctx, _text, centerX, centerY, this._radius, this._angle);

		ctx.strokeColourRGB(GRAY);
		ctx.circleStroke(centerX, centerY, this._radius);
	}

	override function setup() {
		trace('setup: ${toString()}');

		isDebug = true;
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}

	var song = "Rapper's Delight";
	var preformer = "The Sugarhill Gang";
	var lyrics = "I said a hip hop
Hippie to the hippie
The hip, hip a hop, and you don't stop, a rock it out
Bubba to the bang bang boogie, boobie to the boogie
To the rhythm of the boogie the beat
Now, what you hear is not a test I'm rappin' to the beat
And me, the groove, and my friends are gonna try to move your feet
See, I am Wonder Mike, and I'd like to say hello
To the black, to the white, the red and the brown
The purple and yellow, but first, I gotta
Bang bang, the boogie to the boogie
Say up jump the boogie to the bang bang boogie
Let's rock, you don't stop
Rock the rhythm that'll make your body rock
Well so far you've heard my voice but I brought two friends along
And the next on the mic is my man Hank
C'mon, Hank, sing that song, check it out
Well, I'm Imp the Dimp, the ladies' pimp
The women fight for my delight
But I'm the grandmaster with the three MCs
That shock the house for the young ladies
And when you come inside, into the front
You do the Freak, Spank, and do the Bump
And when the sucker MC's try to prove a point
We're Treacherous Trio, we're the serious joint
A from sun to sun and day to day
I sit down and write a brand new rhyme
Because they say that miracles never cease
I've created a devastating masterpiece
I'm gonna rock the mic 'til you can't resist
Everybody, I say it goes like this
Well, I was coming home late one dark afternoon
A reporter stopped me for an interview
She said she's heard stories and she's heard fables
That I'm vicious on the mic and the turntable
This young reporter I did adore
So I rocked some vicious rhymes like I never did before
She said, \"damn, fly guy, I'm in love with you
The Casanova legend must have been true\"
I said, \"by the way, baby, what's your name?\"
Said, \"I go by name of Lois Lane\"
\"And you could be my boyfriend, you surely can
Just let me quit my boyfriend called Superman\"
I said, \"he's a fairy, I do suppose
Flyin' through the air in pantyhose
He may be very sexy, or even cute
But he looks like a sucker in a blue and red suit\"
I said, \"you need a man man who's got finesse
And his whole name across his chest
He may be able to fly all through the night
But can he rock a party 'til the early light?
He can't satisfy you with his little worm
But I can bust you out with my super sperm!\"
I go do it, I go do it, I go do it, do it, do it
An' I'm here an' I'm there, I'm Big Ban Hank, I'm everywhere
Just throw your hands up in the air
And party hardy like you just don't care
Let's do it, don't stop, y'all, a tick tock, y'all, you don't stop!
Go ho-tel, mo-tel, whatcha gonna do today? (say what?)
I'm gonna get a fly girl, gonna get some spank, drive off in a def OJ
Everybody go, \"ho-tel, mo-tel, Holiday Inn\"
You say if your girl starts actin' up, then you take her friend
I say skip, dive, what can I say?
I can't fit 'em all inside my OJ
So I just take half, and bust 'em out
I give the rest to Master Gee so he can shock the house
I said M-A-S, T-E-R, a G with a double E
I said I go by the unforgettable name
Of the man they call the Master Gee
Well, my name is known all over the world
By all the foxy ladies and the pretty girls
I'm goin' down in history
As the baddest rapper there ever could be
Now I'm feelin' the highs and you're feelin' the lows
The beat starts gettin' into your toes
You start poppin' your fingers and stompin' your feet
And movin' your body while while you're sitting in your seat
And then damn! Ya start doin' the freak, I said
Damn! Right outta your seat
Then you throw your hands high in the air
Ya rockin' to the rhythm, shake your derriere
Ya rockin' to the beat without a care
With the sureshot MCs for the affair
Now, I'm not as tall as the rest of the gang
But I rap to the beat just the same
I got a little face, and a pair of brown eyes
All I'm here to do, ladies, is hypnotize
Singin' on'n'n'on'n'on on'n'on
The beat don't stop until the break of dawn
Singin' on'n'n'on'n'on on'n'on
Like a hot buttered pop da pop da pop dibbie dibbie
Pop da pop pop, don't you dare stop
Come alive y'all, gimme whatcha got
I guess by now you can take a hunch
And find that I am the baby of the bunch
But that's okay, I still keep in stride
'Cause all I'm here to do is just wiggle your behind
Singin' on'n'n'on'n'on on'n'on
The beat don't stop until the break of dawn
Singin' on'n'n'on'n'on on'n'on
Rock rock, y'all, throw it on the floor
I'm gonna freak you here, I'm gona freak you there
I'm gonna move you outta this atmosphere
'Cause I'm one of a kind and I'll shock your mind
I'll put TNT in your behind. I said
One, two, three, four, come on, girls, get on the floor
A-come alive, y'all, a-gimme whatcha got
'Cause I'm guaranteed to make you rock
I said one, two, three, four, tell me, Wonder Mike
What are you waiting for?
I said a hip hop
The hippie to the hippie
The hip hip a hop, and you don't stop, a rock it
To the bang bang boogie, say up jump the boogie
To the rhythm of the boogie, the beat
A skiddleebebop, we rock, scooby doo
And guess what, America, we love you
'Cause you rocked and a rolled with so much soul
You could rock 'til a hundred and one years old
I don't mean to brag, I don't mean to boast
But we like hot butter on our breakfast toast
Rock it up, Baby Bubba!
Baby Bubba to the boogie da bang bang da boogie
To the beat, beat, it's unique
Come on everybody and dance to the beat!
Have you ever went over a friends house to eat
And the food just ain't no good?
I mean the macaroni's soggy, the peas are mushed
And the chicken tastes like wood
So you try to play it off like you think you can
By saying that you're full
And then your friend says, \"mama, he's just being polite
He ain't finished, uh-uh, that's bull!\"
So your heart starts pumpin' and you think of a lie
And you say that you already ate
And your friend says \"man, there's plenty of food\"
So you pile some more on your plate
While the stinky food's steamin', your mind starts to dreamin'
Of the moment that it's time to leave
And then you look at your plate and your chicken's slowly rottin'
Into something that looks like cheese
Oh so you say \"that's it, I gotta leave this place
I don't care what these people think
I'm just sittin' here makin' myself nauseous
With this ugly food that stinks\"
So you bust out the door while it's still closed
Still sick from the food you ate
And then you run to the store for quick relief
From a bottle of Kaopectate
And then you call your friend two weeks later
To see how he has been
And he says, \"I understand about the food
Baby Bubba, but we're still friends\"
With a hip hop the hippie to the hippie
The hip hip a hop, a you don't stop the rockin'
To the bang bang boogie
Say up jump the boogie to the rhythm of the boogie the beat";
}
