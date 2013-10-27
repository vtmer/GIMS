package main.view
{
	import flash.display.NativeWindowResize;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import main.events.DataActionEvent;
	import main.events.DataActionEventKind;
	import main.ui.Page1UI;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class Page1 extends Page1UI
	{
		
		public function Page1()
		{
			//窗口操作
			windowsBtn();
			//新建提示信息
			

			
		}
		
		//新建数据派发事件
		//protected function onActionHandler(kind:String):void {
			//var event:DataActionEvent;
			//switch(kind) {
				//case DataActionEventKind.KIND_CANCEL:
				    //event = new DataActionEvent(kind);
				//break;
				//
			    //case DataActionEventKind.KIND_SAVE:
				    //var errors.Array = Validator.validateAll(validatorArray);
					//if (errors.length)
					//{
						//return;
					//}
					//event = new DataActionEvent(kind, editUser);
				//break;	
			//}
			//if (event) {
				//dispatchEvent(evnet);
			//}
			//resetForm();
		//}
		//
		//protected function resetForm():void 
		//{
			//input_name.text = "";
			//input_
		//}
		//
		private function windowsBtn():void 
		{
			btn_min.addEventListener(MouseEvent.MOUSE_DOWN, md_min);
			btn_max.addEventListener(MouseEvent.MOUSE_DOWN, md_max);
			btn_close.addEventListener(MouseEvent.MOUSE_DOWN, md_close);
			btn_restore.addEventListener(MouseEvent.MOUSE_DOWN, md_restore);
		}
		
		private function md_restore(e:MouseEvent):void
		{
			restoreWindow();
			btn_max.visible = true;
			btn_restore.visible = false;
		}
		
		private function md_close(e:MouseEvent):void
		{
			closeWindow();
		}
		
		private function md_max(e:MouseEvent):void
		{
			maximizeWindow();
			btn_max.visible = false;
			btn_restore.visible = true;
		}
		
		private function md_min(e:MouseEvent):void
		{
			minimizeWindow();
		}
		
		public function minimizeWindow():void
		{
			this.stage.nativeWindow.minimize();
		}
		
		public function maximizeWindow():void
		{
			this.stage.nativeWindow.maximize();
		}
		
		public function restoreWindow():void
		{
			this.stage.nativeWindow.restore();
		}
		
		public function closeWindow():void
		{
			this.stage.nativeWindow.close();
		}
		
	}

}