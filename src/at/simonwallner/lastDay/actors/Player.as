package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;

	public class Player extends WorldObject
	{
		
		public function Player()
		{
			this.loadGraphic(Assets.IMG_PLAYER);
		}
		
		private function move(offset:Number) : void
		{
			this.x += offset;
		}
		
		public override function update() : void
		{
			if (FlxG.keys.pressed("LEFT"))
				this.move(-1);
			else if (FlxG.keys.pressed("RIGHT"))
				this.move(1);
		}
		 
	}
}