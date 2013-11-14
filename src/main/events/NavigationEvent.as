package main.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = "changeView";
		
		public var params:Object;
		
		public function NavigationEvent(type:String, _params:Object, bubbles:Boolean = false) 
		{ 
			super(type, bubbles);
			params = _params;
			
		} 
		
	}
	
}