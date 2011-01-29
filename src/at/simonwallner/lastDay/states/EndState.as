package at.simonwallner.lastDay.states
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class EndState extends FlxState
	{
		private var message:String;
		
		public function EndState(message:String)
		{
			super();
			this.message = message;
		}
		
		public override function create():void
		{
			var text:FlxText = new FlxText(0, 80, FlxG.width, "you packed " + message + " stranded on a deserted water planet and survived 3 more days");
			text.alignment = "center"; 
			this.add(text);
		}

		public override function update():void
		{
			super.update();
			
			if (FlxG.mouse.justPressed())
			{
				FlxG.mouse.hide();
				FlxG.state = new TitleState();
			}
		}
		
	}
}