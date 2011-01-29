package at.simonwallner.lastDay.states
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class EndState extends FlxState
	{
		public function EndState()
		{
			super();
		}
		
		public override function create():void
		{
			this.add(new FlxText(0, 50, 500, "you, bla bla bla bla..."));
		}
		
	}
}