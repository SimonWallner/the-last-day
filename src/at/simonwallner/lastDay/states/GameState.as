package at.simonwallner.lastDay.states

{
	import at.simonwallner.lastDay.actors.Player;
	import at.simonwallner.lastDay.actors.Ship;
	import at.simonwallner.lastDay.actors.WorldObject;
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
		private var radio2 : HandProp;
		
		private var overlayText : FlxText;
		
		private var shipLaunched : Boolean;
		private var postLaunchCountdown : Number;
		 		
		public function GameState()
		{
			FlxG.mouse.show();
			this.shipLaunched = false;
			this.postLaunchCountdown = 5;
			
			FlxG.showBounds = true;
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
			
			radio2 = new HandProp("pick me Radio");
			radio2.loadGraphic(Assets.IMG_HANDPROPS_RADIO);
			radio2.x = 350;
			this.add(radio2);
			handProps.add(radio2);
			
			
			
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
			
			if (this.player.carriesObject())
			{
				if (FlxG.keys.justReleased("SPACE"))
					player.drop();
				
				FlxU.overlap(ship, handProps, overlapPlayer);
			}
			else 
			{
				FlxU.overlap(player, handProps, overlapPlayer);
				FlxU.overlap(player, ship, overlapPlayer);
				
			}
			
			if (this.shipLaunched)
			{
				this.postLaunchCountdown -= FlxG.elapsed;
				if (this.postLaunchCountdown < 0)
					FlxG.state = new EndState();
			}
		}
		
		private function overlapPlayer(first : FlxObject, thingy : FlxObject) : void
		{
			if (first is Player && thingy is HandProp)
			{
				var prop : HandProp = (thingy as HandProp)
				overlayText.text = prop.name;
				overlayText.visible = true;
				
				if (FlxG.keys.justReleased("SPACE"))
				{
					if (prop.isInteractive) 
						prop.interact();
					else
						this.player.pick(prop);
				}
			}
			else if (first is Player && thingy is Ship)
			{
				overlayText.text = "Ship"
				overlayText.visible = true;
				
				if (FlxG.keys.justReleased("SPACE"))
				{
					(thingy as Ship).start();
					shipLaunched = true;
					player.kill();
				}
			}
			
			else if (first is Ship && thingy is HandProp)
			{
				if (ship.storeItem(thingy as WorldObject))
				{
					handProps.remove(thingy);
					player.drop(true);
				}
			}
		}
	}
}