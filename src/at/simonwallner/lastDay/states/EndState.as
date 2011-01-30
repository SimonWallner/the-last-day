package at.simonwallner.lastDay.states
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;

	public class EndState extends FlxState
	{
		private var message:String;
		private var endings:Array;
		
		public function EndState(message:String)
		{
			super();
			this.message = message;
			
			endings = new Array();
			endings[0] = ", stranded on a deserted water planet and survived 3 more days.";
			endings[1] = ", stranded on a discarded space station in the orbit of jupiter. You found a box of astronauts food and survived 7 more days.";
			endings[2] = ", took the wrong turn after you left the orbit and flew directly into the sun.";
			endings[3] = ", stranded on a hot desert planet and survived 5 more days on a sixpack of beer and dry cookies.";
			endings[4] = ", stranded nowhere and diedly lonely in the spaceship";
			endings[5] = ", stranded on a mysterious ferry planet, found the holy grail, found the true meaning of life, but died trying to roast a slice of bread in your spaceships thrusters.";
		}
		
		public override function create():void
		{
			var rand:uint = FlxU.random() * (endings.length - 1) + 0.49;
			var end:String = endings[rand];
			var text:FlxText = new FlxText(0, 80, FlxG.width, "you packed " + message + end);
			text.alignment = "center";
			
			this.add(text);
		}

		public override function update():void
		{
			super.update();
			
			if (FlxG.mouse.justPressed() || FlxG.keys.justReleased("SPACE"))
			{
				FlxG.mouse.hide();
				FlxG.state = new CreditsState();
			}
		}
	}
}