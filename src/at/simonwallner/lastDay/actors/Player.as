package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;

	public class Player extends WorldObject
	{
		private var cameraEmpty : FlxObject;
		private var pickedObject : WorldObject;
		
		private const pickOffset : Number = 20;
			
		public function Player()
		{
			this.loadGraphic(Assets.IMG_PLAYER);
			cameraEmpty = new FlxObject();
			cameraEmpty.y = this.y - 55;
			this.x = 200;
			
			pickedObject = null;
		}
		
		private function move(offset:Number) : void
		{
			this.x += offset * FlxG.elapsed;
			cameraEmpty.x = this.x;
			if (pickedObject != null)
				pickedObject.x = this.x;
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
		
		public function pick(thingy : WorldObject) : void
		{
			thingy.setY(-pickOffset)
			this.pickedObject = thingy;
		}
		
		public function drop():void
		{
			this.pickedObject.setY(0);
			this.pickedObject = null;
		}
		
		public function carriesObject() : Boolean
		{
			return pickedObject != null;
		}
	}
}