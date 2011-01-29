package at.simonwallner.lastDay.actors
{
	import org.flixel.FlxSprite;

	public class WorldObject extends FlxSprite
	{
		private var baseline : Number;
		
		public function WorldObject()
		{
			baseline = 100;
		}
		
		public override function loadGraphic(Graphic:Class,Animated:Boolean=false,Reverse:Boolean=false,Width:uint=0,Height:uint=0,Unique:Boolean=false):FlxSprite
		{
			super.loadGraphic(Graphic, Animated, Reverse, Width, Height, Unique);
			initPosition();
			return this;
		}
		
		private function initPosition():void
		{
			this.y = baseline;
		}
		
	}
}