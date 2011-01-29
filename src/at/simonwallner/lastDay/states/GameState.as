package at.simonwallner.lastDay.states

{
	import at.simonwallner.lastDay.actors.Player;
	import at.simonwallner.lastDay.actors.Ship;
	import at.simonwallner.lastDay.data.Assets;
	import at.simonwallner.lastDay.props.HandProp;
	import at.simonwallner.lastDay.props.Radio;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;

	public class GameState extends FlxState
	{
		private var player : Player;
		
		private var bgFirst : FlxSprite;
		private var bgSecond : FlxSprite;
		private var bgThird : FlxSprite;
		private var bgFourth : FlxSprite;
		
		private var ship : Ship;
		
		private var handProps : FlxGroup;
		private var radio : HandProp;
		
		private var overlayText : FlxText;
		 		
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
			
			// hand props
			handProps = new FlxGroup();
			radio = new Radio("Vintage '60s Radio");
			radio.loadGraphic(Assets.IMG_HANDPROPS_RADIO);
			radio.x = 300;
			this.add(radio);
			handProps.add(radio);
			
			
			player = new Player();
			add(player);
			FlxG.follow(player.getCameraEmpty());
			FlxG.followBounds(0, 0, 500, 2000);
			
			overlayText = new FlxText(0, 10, FlxG.width);
			overlayText.alignment = "center";
			overlayText.text = "";
			overlayText.scrollFactor = new FlxPoint(0, 0);
			this.add(overlayText);
		}
		override public function update():void
		{
			super.update();
			overlayText.visible = false;
			FlxU.overlap(player, handProps, overlapPlayer);
			FlxU.overlap(player, ship, overlapPlayer);
		}
		
		private function overlapPlayer(player : FlxObject, thingy : FlxObject) : void
		{
			if (thingy is HandProp)
			{
				overlayText.text = (thingy as HandProp).name;
				overlayText.visible = true;
				
				if (FlxG.keys.justPressed("SPACE"))
					(thingy as HandProp).interact();
			}
			else if (thingy is Ship)
			{
				overlayText.text = "Ship"
				overlayText.visible = true;
				
				if (FlxG.keys.justPressed("SPACE"))
					(thingy as Ship).start();

			}
		}
	}
}