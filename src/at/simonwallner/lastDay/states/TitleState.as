package at.simonwallner.lastDay.states
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;

	public class TitleState extends FlxState
	{
		private var startTxt:FlxText;
		private var titleTxt:FlxText;
		private var startTxtCnt : uint
		private var instructionTxt1:FlxText;
		
		private var instruction:Boolean;
		
		public function TitleState()
		{
			super();
			
			instruction = false;
			
			add(new FlxSprite(0, 0, Assets.IMG_TITLE_SCREEN));
			
			titleTxt = new FlxText(FlxG.width/2 - 150, FlxG.height/2, 300, "The last Day");
			titleTxt.size = 32;
			titleTxt.shadow = 8;
			titleTxt.alignment = "center";
			add(titleTxt);
			
			startTxt = new FlxText(FlxG.width/2 - 150, FlxG.height/2 + 70, 300, "Click To Start");
			startTxt.size = 16; // multiple of 8 to keep text crisp
			startTxt.alignment = "center";
			
			
			instructionTxt1 = new FlxText(FlxG.width/2 - 150, FlxG.height/2 + 0, 300, "You are the last person on earth and finally decide to \npack your things, and make your way towards an unknown \n future in space. \n\n Press SPACE to interact.");
			instructionTxt1.size = 8;
			instructionTxt1.alignment = "center";
			instructionTxt1.shadow = 8;
			
			add(startTxt);
			FlxG.playMusic(Assets.MUSIC_ROVER);
		}
		
		public override function update():void
		{
			super.update();
			
			if (instruction)
			{
				this.add(instructionTxt1);
				titleTxt.kill();
				startTxt.kill();
			}
			else
			{
				startTxt.visible = (startTxtCnt++ % 80 < 50);
			}
			
			if (FlxG.mouse.justPressed() || FlxG.keys.justReleased("SPACE"))
			{
				if (!instruction)
					instruction = true;
				else
				{
					FlxG.mouse.hide();
					FlxG.state = new GameState();
				}
			}
		}
		
	}
}