package at.simonwallner.lastDay.props
{
	import at.simonwallner.lastDay.data.Assets;
	
	import org.flixel.FlxG;
	
	public class Radio extends HandProp
	{
		private var playing : Boolean;
		private var channel:uint;
		
		public function Radio(name : String)
		{
			super(name, true);
			playing = false;
		}
		
		public override function interact():void
		{
			if (!playing)
			{
				if (channel == 1)
					FlxG.playMusic(Assets.MUSIC_TRACK_1);
				else
					FlxG.playMusic(Assets.MUSIC_TRACK_2);
					
				playing = true;
				this.isInteractive = false;
			}
		}
		
		public function soundSelect(channel:uint):void
		{
			this.channel = channel;
		}

	}
}