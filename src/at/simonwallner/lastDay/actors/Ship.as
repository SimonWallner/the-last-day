package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	
	public class Ship extends WorldObject
	{
		private var flying : Boolean;
		private var speed : Number;
		
		private var slot1 : WorldObject;
		private var slot2 : WorldObject;
		private var slot3 : WorldObject;
		
		private static const SLOT1_Y:Number = -30;
		private static const SLOT2_Y:Number = -60;
		private static const SLOT3_Y:Number = -90;
		
		private var centerX:Number; 
		
		public function Ship()
		{
			super();
			this.loadGraphic(Assets.IMG_PROPS_SHIP);
			speed = 0;
			
			slot1 = null;
			slot2 = null;
			slot3 = null;
			centerX = this.width/2;
		}
		
		public function start():void
		{
			flying = true;
		}
		
		public override function update():void
		{
			if (flying)
			{
				speed += 0.5 * FlxG.elapsed;
				
				this.y = this.y - speed;
				
				if (slot1 != null)
					slot1.y -= speed;
					
				if (slot2 != null)
					slot2.y -= speed;
					
				if (slot3 != null)
					slot3.y -= speed;
			}
			
			if (this.x < -200)
				this.kill();
		}
		
		public function storeItem(item:WorldObject):Boolean
		{
			if (slot1 == null)
			{
				slot1 = item;
				slot1.setY(SLOT1_Y);
				slot1.x = centerX + this.x;
				return true;
			}
			else if (slot2 == null)
			{
				slot2 = item;
				slot2.setY(SLOT2_Y);
				slot2.x = centerX + this.x;
				return true;
			}
			else if (slot3 == null);
			{
				slot3 = item;
				slot3.setY(SLOT3_Y);
				slot3.x = centerX + this.x;
				return true;
			}
			return false;
		}
	}
}