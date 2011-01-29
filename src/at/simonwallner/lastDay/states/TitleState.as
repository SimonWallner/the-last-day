package at.simonwallner.lastDay.states
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class TitleState extends FlxState
	{
		private var startTxt:FlxText;
		private var titleTxt:FlxText;
		private var startTxtCnt : uint
		
		public function TitleState()
		{
			super();
			
			add(new FlxSprite(0, 0, Assets.IMG_TITLE_SCREEN));
			
			titleTxt = new FlxText(FlxG.width/2 - 150, FlxG.height/2, 300, "The last Day");
			titleTxt.size = 32;
			titleTxt.shadow = 8;
			titleTxt.alignment = "center";
			add(titleTxt);
			
			startTxt = new FlxText(FlxG.width/2 - 150, FlxG.height/2 + 70, 300, "Click To Start");
			startTxt.size = 16; // multiple of 8 to keep text crisp
			startTxt.alignment = "center";
			
			add(startTxt);
		}
		
		public override function update():void
		{
			super.update();
			
			startTxt.visible = (startTxtCnt++ % 80 < 50);
			
			if (FlxG.mouse.justPressed())
			{
				FlxG.mouse.hide();
				FlxG.state = new GameState();
			}
		}
		
	}
}