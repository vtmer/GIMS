package main.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class DataActionEvent extends Event 
	{
		static public const DATA_ACTION_EVENT:String = "dataActionEvent";
		
		public var kind:String;
		
		public var data:Object;
		
		public function DataActionEvent(kind:String, data:Object=null) 
		{ 
			super(DATA_ACTION_EVENT,false,false);
			
		} 
		
		public override function clone():Event 
		{ 
			return new DataActionEvent(kind, data);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("DataActionEvent","kind" "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}