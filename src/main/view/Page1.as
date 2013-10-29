package main.view
{
	import flash.display.NativeWindowResize;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import main.database.UserDatabase;
	import main.events.DataActionEvent;
	import main.events.DataActionEventKind;
	import main.model.UserInfo;
	import main.ui.Page1UI;
	import flash.events.FocusEvent;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class Page1 extends Page1UI
	{
		private var _isDrawerIn:Boolean = false;
		private var editUser:UserInfo;
		private var database:UserDatabase;
		
		public function Page1()
		{
			//初始化
			database = new UserDatabase;
			database.addEventListener(DataActionEvent.DATA_ACTION_EVENT, onDataActionHandler);
			//窗口操作
			windowsBtn();
			//drawer动画
			btn_block.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			btn_new.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			//表单提示信息
			inputFieldTips();
			//表单确认
			inputEnter();
		}
		
		//drawer动画
		private function IOAnimation(e:MouseEvent):void
		{
			if (_isDrawerIn)
			{
				drawer.x = 674;
				drawer.alpha = 1;
				_isDrawerIn = false;
			}
			else
			{
				drawer.x = 1010;
				drawer.alpha = .1;
				_isDrawerIn = true;
			}
		}
		
		//新建表单提示信息
		private function inputFieldTips():void
		{
			inputTips(input_name, "请输入姓名");
			inputTips(input_dorNum, "宿舍号");
			inputTips(input_phone, "请输入长号或者短号");
			inputTips(input_email, "请输入Email");
			inputTips(input_photoId, "电子版相片编码");
			inputTips(input_printPhotoId, "冲洗版相片编码");
		}
		
		private function inputTips(inputField:Object, tipsText:String):void
		{
			inputField.addEventListener(FocusEvent.FOCUS_OUT, showTips);
			inputField.addEventListener(FocusEvent.FOCUS_IN, input);
			
			function input(e:FocusEvent):void
			{
				if (inputField.text == tipsText)
				{
					inputField.text = "";
					inputField.color = 0x666666;
				}
			}
			
			function showTips(e:FocusEvent):void
			{
				if (inputField.text == "")
				{
					inputField.text = tipsText;
					inputField.color = 0xc9cdcc;
				}
			}
		
		}
		
		//表单确认
		private function inputEnter():void
		{
			btn_Enter.addEventListener(MouseEvent.MOUSE_DOWN, enterDown);
		}
		
		private function enterDown(e:MouseEvent):void
		{
			editUser.userName = input_name.text;
			editUser.userIsTown = Number(input_isTown.selectedValue);
			editUser.userDormitory = input_dor.selectedLabel;
			editUser.userDorNumber = Number(input_dorNum.text);
			editUser.userPhone = Number(input_phone.text);
			editUser.userEmail = input_email.text;
			editUser.userPhotoId = input_photoId.text;
			editUser.userPrintPhotoId = input_printPhotoId.text;
			
			onActionHandler(DataActionEventKind.KIND_SAVE);
		}
		
		//处理派发事件
		private function onDataActionHandler(e:DataActionEvent):void
		{
			switch (e.kind)
			{
				case DataActionEventKind.KIND_SAVE: 
					if (editUser.userId)
					{
						database.update(editUser);
					}
					else
					{
						database.insert(editUser);
					}
				break;
			}
		}
		
		//新建数据派发事件
		protected function onActionHandler(kind:String):void
		{
			var event:DataActionEvent;
			switch (kind)
			{
				case DataActionEventKind.KIND_SAVE: 
					event = new DataActionEvent(kind, editUser);
					break;
			}
			if (event)
			{
				dispatchEvent(event);
			}
			resetForm();
		}
		
		protected function resetForm():void
		{
			input_name.text = "";
			input_isTown.selectedIndex = 0;
			input_dor.selectedIndex = 4;
			input_dorNum.text = "";
			input_phone.text = "";
			input_email.text = "";
			input_photoId.text = "";
			input_printPhotoId.text = "";
		}
		
		//窗口操作
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