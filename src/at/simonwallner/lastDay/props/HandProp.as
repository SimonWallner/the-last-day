package at.simonwallner.lastDay.props
{
	import at.simonwallner.lastDay.actors.WorldObject;
	
	public class HandProp extends WorldObject
	{
		public var name : String;
		
		public function HandProp(name : String)
		{
			super();
			this.name = name;
		}
		
		public function interact() : void
		{
			
		}
		
//		public function pickUp() void;
		
//		public function drop() void;
		
	}
}