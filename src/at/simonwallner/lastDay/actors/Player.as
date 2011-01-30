package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	public class Player extends WorldObject
	{
		private var cameraEmpty : FlxObject;
		private var pickedObject : WorldObject;
		
		private const pickOffset : Number = 24;
			
		public function Player()
		{
			this.loadGraphic(Assets.IMG_PLAYER, true, true, 16, 24);
			this.addAnimation("idle", [0]);
			this.addAnimation("walk", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 20, true);
			this.addAnimation("raise", [14]);
			
			this.play("idle");
			
			cameraEmpty = new FlxObject();
			cameraEmpty.y = this.y - 67;
			this.x = 200;
			
			pickedObject = null;
		}
		
		private function move(offset:Number) : void
		{
			this.x += offset * FlxG.elapsed;
			cameraEmpty.x = this.x;
			if (pickedObject != null)
				pickedObject.x = this.x;
			
			if (pickedObject == null)
				this.play("walk");
			else
				this.play("raise");
		}
		
		public override function update() : void
		{
			super.update();
			
			var walking : Boolean = false;
			
			if (FlxG.keys.pressed("LEFT") && this.x > 20)
			{
				this.move(-50);
				walking = true;
				this.facing = FlxSprite.RIGHT;
			}
			else if (FlxG.keys.pressed("RIGHT") && this.x < 780)
			{
				this.move(50);
				walking = true
				this.facing = FlxSprite.LEFT;
			}
			
			if (!walking)
			{
				if (pickedObject == null)
					this.play("idle");
				else
					this.play("raise");
			}
		}
		
		public function getCameraEmpty() : FlxObject
		{
			return cameraEmpty;
		}
		
		public function pick(thingy : WorldObject) : void
		{
			thingy.setY(-pickOffset)
			this.pickedObject = thingy;
			pickedObject.x = this.x;
			FlxG.play(Assets.SND_PICK).play();
		}
		
		public function drop(inShip:Boolean = false):void
		{
			if (this.pickedObject != null)
			{
				if (!inShip)
				{
					this.pickedObject.setY(0);
					FlxG.play(Assets.SND_DROP).play();
				}
				this.pickedObject = null;
			}
			this.play("idle");
		}
		
		public function carriesObject() : Boolean
		{
			return pickedObject != null;
		}
		
		public override function kill():void
		{
			if (pickedObject != null)
				pickedObject.kill();
			super.kill();
		}
		
		public function hippy():void
		{
			this.loadGraphic(Assets.IMG_PLAYER_HIPPY, true, true, 16, 24);
			FlxG.play(Assets.SND_SHIRT);
		}
	}
}