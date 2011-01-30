package at.simonwallner.lastDay.actors
{
	import org.flixel.FlxSprite;

	public class WorldObject extends FlxSprite
	{
		private static const BASELINE_OFFSET:Number = 198; 
		
		public function WorldObject()
		{
		}
		
		public override function loadGraphic(Graphic:Class,Animated:Boolean=false,Reverse:Boolean=false,Width:uint=0,Height:uint=0,Unique:Boolean=false):FlxSprite
		{
			super.loadGraphic(Graphic, Animated, Reverse, Width, Height, Unique);
			initPosition();
			return this;
		}
		
		private function initPosition():void
		{
			setY(0);
		}
		
		public function setY(value:Number) : void
		{
			this.y = BASELINE_OFFSET - this.height + value;			
		}
		
	}
}