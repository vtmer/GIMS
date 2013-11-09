package main.model 
{
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public interface IDrawer extends IEventDispatcher
	{
		function InAnimation():void;
		function OutAnimation():void;
		function ChangeView():void;
		function inputFieldTips():void;
		function resetForm():void;
	}
	
}