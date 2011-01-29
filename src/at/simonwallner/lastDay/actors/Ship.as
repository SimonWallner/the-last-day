package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	
	public class Ship extends WorldObject
	{
		private var flying : Boolean;
		private var speed : Number;
		
		public function Ship()
		{
			super();
			this.loadGraphic(Assets.IMG_PROPS_SHIP);
			speed = 0;
		}
		
		public function start():void
		{
			flying = true;
		}
		
		public override function update():void
		{
			if (flying)
			{
				this.y = this.y - speed;
				speed += 0.5 * FlxG.elapsed;
			}
			
			if (this.x < -200)
				this.kill();
		}
	}
}