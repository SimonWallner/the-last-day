package at.simonwallner.lastDay.actors
{
	import at.simonwallner.lastDay.data.Assets;
	
	public class Ship extends WorldObject
	{
		public function Ship()
		{
			super();
			this.loadGraphic(Assets.IMG_PROPS_SHIP);
		}
		
	}
}