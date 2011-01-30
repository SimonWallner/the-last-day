package at.simonwallner.lastDay.props
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	
	public class SodaMachine extends HandProp
	{
		public function SodaMachine(name:String, isInteractive:Boolean=true)
		{
			super(name, isInteractive);
		}
		
		public override function interact():void
		{
			FlxG.play(Assets.SND_SODA).play();
			this.isInteractive = false;
		}
		
	}
}