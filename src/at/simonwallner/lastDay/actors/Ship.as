package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	import at.simonwallner.lastDay.props.HandProp;
	
	import org.flixel.FlxG;
	
	public class Ship extends WorldObject
	{
		private var flying : Boolean;
		private var speed : Number;
		
		private var slot1 : HandProp;
		private var slot2 : HandProp;
		private var slot3 : HandProp;
		
		private static const SLOT1_Y:Number = -39;
		private static const SLOT2_Y:Number = -90;
		private static const SLOT3_Y:Number = -140;
		
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
		
		public function storeItem(item:HandProp):Boolean
		{
			if (slot1 == null)
			{
				slot1 = item;
				slot1.setY(SLOT1_Y + item.height/2);
				slot1.x = centerX + this.x - item.width/2;
				return true;
			}
			else if (slot2 == null)
			{
				slot2 = item;
				slot2.setY(SLOT2_Y + item.height/2);
				slot2.x = centerX + this.x - item.width/2;
				return true;
			}
			else if (slot3 == null)
			{
				slot3 = item;
				slot3.setY(SLOT3_Y + item.height/2);
				slot3.x = centerX + this.x - item.width/2;
				return true;
			}
			return false;
		}
		
		public function getPayloadString():String
		{
			var result:String = "a "
			if (slot1 != null)
				result += slot1.name;
			
			if (slot2 != null)
				result += "and a " + slot2.name;
				
			if (slot3 != null)
				result += "and a " + slot3.name;
				
			return result;
		}
	}
}