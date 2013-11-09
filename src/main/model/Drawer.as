package main.model
{
	import main.state.*;
	import main.ui.Page1UI;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class Drawer extends EventDispatcher implements IDrawer
	{
		protected var title:String;
		
		public function Drawer()
		{
		
		}
		
		public function InAnimation():void
		{
			this.visible = false;
		}
		
		public function OutAnimation():void
		{
			this.visible = true;
		}
		
		public function ChangeView(state:String,title:String):void
		{
			this.title = title;
		}
	}

}