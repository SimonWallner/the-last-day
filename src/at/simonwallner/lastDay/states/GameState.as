package at.simonwallner.lastDay.states

{
	import at.simonwallner.lastDay.actors.Player;
	import at.simonwallner.lastDay.actors.Ship;
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;

	public class GameState extends FlxState
	{
		private var player : Player;
		
		private var bgFirst : FlxSprite;
		private var bgSecond : FlxSprite;
		private var bgThird : FlxSprite;
		private var bgFourth : FlxSprite;
		
		private var ship : Ship;
		 		
		public function GameState()
		{
			FlxG.mouse.show();
		}
		
		override public function create():void
		{
			
			// add background layers
			bgFirst = new FlxSprite(0, 0, Assets.IMG_BG_FIRST);
			bgFirst.scrollFactor = new FlxPoint(1, 0);
			
			bgSecond = new FlxSprite(0, 0, Assets.IMG_BG_SECOND);
			bgSecond.scrollFactor = new FlxPoint(0.8, 0);
			
			bgThird = new FlxSprite(0, 0, Assets.IMG_BG_THIRD);
			bgThird.scrollFactor = new FlxPoint(0.5, 0);
			
			bgFourth = new FlxSprite(0, 0, Assets.IMG_BG_FOURTH);
			bgFourth.scrollFactor = new FlxPoint(0.1, 0);

			this.add(bgFourth);
			this.add(bgThird);
			this.add(bgSecond);
			this.add(bgFirst)
			
			ship = new Ship();
			ship.x = 30;
			this.add(ship);
			
			
			player = new Player();
			add(player);
			FlxG.follow(player.getCameraEmpty());
			FlxG.followBounds(0, 0, 500, 500);
			
//			FlxG.playMusic(Assets.MUS_GAME);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}