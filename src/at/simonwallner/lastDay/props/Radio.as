package at.simonwallner.lastDay.props
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	
	public class Radio extends HandProp
	{
		private var playing : Boolean;
		
		public function Radio(name : String)
		{
			super(name);
			playing = false;
		}
		
		public override function interact():void
		{
			if (!playing)
			{
				FlxG.playMusic(Assets.MUSIC_TRACK_1)
				playing = true;
			}
		}

	}
}