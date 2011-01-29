package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;

	public class Player extends WorldObject
	{
		private var cameraEmpty : FlxObject;
			
		public function Player()
		{
			this.loadGraphic(Assets.IMG_PLAYER);
			cameraEmpty = new FlxObject();
			cameraEmpty.y = this.y - 55;
			this.x = 200;
		}
		
		private function move(offset:Number) : void
		{
			this.x += offset * FlxG.elapsed;
			cameraEmpty.x = this.x;
		}
		
		public override function update() : void
		{
			if (FlxG.keys.pressed("LEFT"))
				this.move(-50);
			else if (FlxG.keys.pressed("RIGHT"))
				this.move(50);
		}
		
		public function getCameraEmpty() : FlxObject
		{
			return cameraEmpty;
		}
	}
}