package at.simonwallner.lastDay.states

{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class GameState extends FlxState
	{
		private var _startTxt : FlxText;
		private var _startTxtCnt : uint;
		
		public function TitleState()
		{
			FlxG.mouse.show();
		}
		
		override public function create():void
		{
//			add(new FlxSprite(0, 0, Assets.IMG_TITLE_SCREEN));
			
			_startTxt = new FlxText(FlxG.width/2 - 150, FlxG.height/2 + 70, 300, "Click To Start");
			_startTxt.size = 16; // multiple of 8 to keep text crisp
			_startTxt.alignment = "center";
			add(_startTxt);
			
//			FlxG.playMusic(Assets.MUS_GAME);
		}
		
		override public function update():void
		{
			super.update();
			
			_startTxt.visible = (_startTxtCnt++ % 80 < 50);			
		}
	}
}