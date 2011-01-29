package at.simonwallner.lastDay.props
{
	import at.simonwallner.lastDay.actors.WorldObject;
	
	public class HandProp extends WorldObject
	{
		public var name : String;
		public var isInteractive : Boolean;
		
		public function HandProp(name : String, isInteractive : Boolean = false)
		{
			super();
			this.name = name;
			this.isInteractive = isInteractive;
		}
		
		public function interact() : void
		{
			
		}
		
//		public function pickUp() void;
		
//		public function drop() void;
		
	}
}