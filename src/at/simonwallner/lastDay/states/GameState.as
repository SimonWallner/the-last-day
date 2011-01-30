package at.simonwallner.lastDay.states

{
	import at.simonwallner.lastDay.actors.Player;
	import at.simonwallner.lastDay.actors.Ship;
	import at.simonwallner.lastDay.data.Assets;
	import at.simonwallner.lastDay.props.HandProp;
	import at.simonwallner.lastDay.props.HippyShirt;
	import at.simonwallner.lastDay.props.Radio;
	import at.simonwallner.lastDay.props.SodaMachine;
	
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
		private var radio : Radio;
		private var blaster:Radio;
		private var towel:HandProp;
		private var socks:HandProp;
		private var sodaMachine:SodaMachine;
		private var hippyShirt:HippyShirt;
		
		
		private var overlayText : FlxText;
		
		private var shipLaunched : Boolean;
		private var postLaunchCountdown : Number;
		 		
		public function GameState()
		{
			FlxG.mouse.show();
			this.shipLaunched = false;
			this.postLaunchCountdown = 11
			
			FlxG.mouse.hide();
			
//			FlxG.showBounds = true;
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
			

			
			// hand props
			handProps = new FlxGroup();
			radio = new Radio("Vintage '60s Radio");
			radio.loadGraphic(Assets.IMG_HANDPROPS_RADIO);
			radio.soundSelect(1);
			radio.x = 300;
			this.add(radio);
			handProps.add(radio);
			
			blaster = new Radio("Ghetto Blaster");
			blaster.loadGraphic(Assets.IMG_HANDPROPS_BLASTER);
			blaster.soundSelect(2);
			blaster.x = 700;
			this.add(blaster);
			handProps.add(blaster);
			
			towel = new HandProp("Towel");
			towel.loadGraphic(Assets.IMG_HANDPROPS_TOWEL);
			towel.x = 575;
			towel.setY(-10);
			this.add(towel);
			handProps.add(towel);
			
			socks = new HandProp("pair of Socks");
			socks.loadGraphic(Assets.IMG_HANDPROPS_SOCKS);
			socks.x = 605;
			socks.setY(-20);
			this.add(socks);
			handProps.add(socks);
			
			sodaMachine = new SodaMachine("Soda Machine");
			sodaMachine.loadGraphic(Assets.IMG_HANDPROPS_SODA_MACHINE);
			sodaMachine.x = 410;
			this.add(sodaMachine);
			handProps.add(sodaMachine);
			
			hippyShirt = new HippyShirt("HippyShirt");
			hippyShirt.loadGraphic(Assets.IMG_HANDPROPS_HIPPY_SHIRT);
			hippyShirt.x = 555;
			hippyShirt.setY(-13);
			this.add(hippyShirt);
			handProps.add(hippyShirt);
			
			
			ship = new Ship();
			ship.x = 100;
			this.add(ship);
			
			player = new Player();
			player.x = 230;
			add(player);
			FlxG.follow(player.getCameraEmpty());
			FlxG.followBounds(0, 0, 800, 2000);
			
			overlayText = new FlxText(0, 10, FlxG.width);
			overlayText.alignment = "center";
			overlayText.text = "";
			overlayText.size = 8;
			overlayText.shadow = 8;
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
					FlxG.state = new EndState(ship.getPayloadString());
			}
		}
		
		private function overlapPlayer(first : FlxObject, thingy : FlxObject) : void
		{
			if (first is Player && thingy is HippyShirt && FlxG.keys.justReleased("SPACE"))
			{
				player.hippy();
				thingy.kill();
			}
			else if (first is Player && thingy is HandProp)
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
				if (ship.storeItem(thingy as HandProp))
				{
					handProps.remove(thingy);
					player.drop(true);
				}
			}
		}
	}
}