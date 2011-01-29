package at.simonwallner.lastDay.states

{
	import at.simonwallner.lastDay.actors.Player;
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;

	public class GameState extends FlxState
	{
		private var player : Player;
		 		
		public function GameState()
		{
			FlxG.mouse.show();
		}
		
		override public function create():void
		{
			add(new FlxSprite(0, 0, Assets.IMG_TITLE_SCREEN));
			player = new Player();
			add(player);
			FlxG.follow(player);
			
			
//			FlxG.playMusic(Assets.MUS_GAME);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}