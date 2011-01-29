package at.simonwallner.lastDay.data
{
	public final class Assets
	{
		// images
		[Embed(source="../resources/title_screen.png")] public static const IMG_TITLE_SCREEN:Class;
		[Embed(source="../resources/walk.png")] public static const IMG_PLAYER:Class;
		
		// props
		[Embed(source="../resources/props/ship.png")] public static const IMG_PROPS_SHIP:Class;
		
		// hand props
		[Embed(source="../resources/handProps/radio.png")] public static const IMG_HANDPROPS_RADIO:Class;
		
		// scenery background
		[Embed(source="../resources/scene/first.png")] public static const IMG_BG_FIRST:Class;
		[Embed(source="../resources/scene/second.png")] public static const IMG_BG_SECOND:Class;
		[Embed(source="../resources/scene/third.png")] public static const IMG_BG_THIRD:Class;
		[Embed(source="../resources/scene/fourth.png")] public static const IMG_BG_FOURTH:Class;
		
		// sounds
		[Embed(source="../resources/music/track_1.mp3")] public static const MUSIC_TRACK_1:Class;
	}
}