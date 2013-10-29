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
		private var _isDrawerIn:Boolean = true;
		private var editUser:UserInfo;
		private var database:UserDatabase;
		
		public function Page1()
		{
			//初始化
			editUser = new UserInfo();
			database = new UserDatabase;
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
				//drawer.x = 674;
				drawer.visible = true;
				_isDrawerIn = false;
			}
			else
			{
				//drawer.x = 1010;
				drawer.visible = false;
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
			
			trace(editUser.userName);
			onActionHandler(DataActionEventKind.KIND_SAVE);
		}
		
		//根据操作处理数据
		protected function onActionHandler(kind:String):void
		{
			var event:DataActionEvent;
			switch (kind)
			{
				case DataActionEventKind.KIND_SAVE: 
					event = new DataActionEvent(kind, editUser);
					event.kind = kind;
					break;
			}
			//if (event)
			//{
			//dispatchEvent(event);
			//trace("派发事件");
			//}
			resetForm();
			
			switch (event.kind)
			{
				case DataActionEventKind.KIND_SAVE: 
					if (editUser.userId)
					{
						trace("数据更新");
						database.update(editUser);
					}
					else
					{
						trace("数据插入");
						database.insert(editUser);
					}
					break;
			}
		}
		
		protected function resetForm():void
		{
			input_name.text = "";
			input_isTown.selectedIndex = 0;
			input_dor.selectedIndex = -1;
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
			block_remove.addEventListener(MouseEvent.MOUSE_DOWN, md_remove);
			block_resize.addEventListener(MouseEvent.MOUSE_DOWN, md_resize);
		}
		
		private function md_resize(e:MouseEvent):void
		{
			this.stage.nativeWindow.startResize(NativeWindowResize.BOTTOM_RIGHT);
			stage.addEventListener(Event.ENTER_FRAME, ef);
		}
		
		private function ef(e:Event):void
		{
			bg.width = stage.stageWidth;
			bg.height = stage.stageHeight;
			windows_btn.right = 20;
			windows_btn.top = 12;
			block_resize.right = 12;
			block_resize.bottom = 12;
		
		}
		
		private function md_remove(e:MouseEvent):void
		{
			this.stage.nativeWindow.startMove();
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