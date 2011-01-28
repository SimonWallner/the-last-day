package
{
	import flash.events.Event;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	import at.simonwallner.lastDay.states.GameState;
	
	[SWF(width="512", height="384", backgroundColor="#000000")] // swf properties 
	[Frame(factoryClass="Preloader")] // tell compiler to use the flixel preloader
	
	public class LastDay extends FlxGame
	{
		public function LastDay()
		{
			super(512, 384, GameState, 1);
			FlxG.panel.setup("", 10, "", "", ""); // TODO: fill in real values here
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.showDefaultContextMenu = false; // hide unnecessary stuff from Flash right-click menu
		}
	}
}