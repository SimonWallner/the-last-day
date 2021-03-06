package at.simonwallner.lastDay.states
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class CreditsState extends FlxState
	{
		
		public function CreditsState()
		{
			super();
		}
		
		public override function create():void
		{
			
			var credits1:FlxText = new FlxText(0, 50, FlxG.width, "created by:");
			credits1.alignment = "center"
			this.add(credits1);
			
			var credits2:FlxText = new FlxText(0, 60, FlxG.width, "Simon Wallner: design, programming");
			credits2.alignment = "center"
			this.add(credits2);
			
			var credits3:FlxText = new FlxText(0, 70, FlxG.width, "Vincent Wagner: music, sounds");
			credits3.alignment = "center"
			this.add(credits3);
			
			var credits4:FlxText = new FlxText(0, 90, FlxG.width, "...as part of the global game jam 2011");
			credits4.alignment = "center"
			this.add(credits4);
			
			var credits5:FlxText = new FlxText(0, 100, FlxG.width, "made with flixel");
			credits5.alignment = "center"
			this.add(credits5);
			
			var external:FlxText = new FlxText(0, 140, FlxG.width, " additional samples by: Splashdust@freesound.org, juskiddink@freesound.org, morgantj@freesound.org,\n DrNI@freesound.org, John F. Kennedy");
			external.alignment = "center";
			this.add(external);
			
		}

		public override function update():void
		{
			super.update();
			
			if (FlxG.mouse.justPressed() || FlxG.keys.justReleased("SPACE"))
			{
				FlxG.mouse.hide();
				FlxG.state = new TitleState();
			}
		}
		
	}
}