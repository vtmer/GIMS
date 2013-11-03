package main.view
{
	import flash.display.NativeWindowResize;
	import flash.events.FileListEvent;
	import flash.filesystem.File;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import main.database.UserDatabase;
	import main.events.DataActionEvent;
	import main.events.DataActionEventKind;
	import main.model.UserInfo;
	import main.ui.Page1UI;
	import flash.events.FocusEvent;
	import morn.core.components.Component;
	import morn.core.components.Label;
	import morn.core.components.TextInput;
	import morn.core.handlers.Handler;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class Page1 extends Page1UI
	{
		private var _isDrawerIn:Boolean = true;
		private var _isNewInfo:Boolean = true;
		private var editUser:UserInfo;
		private var listSelectIndex:int;
		private var database:UserDatabase;
		private var userData:UserInfo;
		private var infoData:UserInfo;
		private var photoFile:File;
		private var outputFile:File;
		private var photoFileName:String;
		
		public function Page1()
		{
			//初始化
			photoFile = new File();
			photoFile.url = "file:///D:/新建文件夹/东区/056";
			outputFile = photoFile.resolvePath("整理输出");
			outputFile.createDirectory();
			
			database = new UserDatabase();
			database.addEventListener(DataActionEvent.DATA_ACTION_EVENT, onDataActionHandler);
			//窗口操作
			windowsBtn();
			//drawer动画
			btn_block.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			btn_new.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			block_blank.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			//drawer按钮
			btn_infoEdit.addEventListener(MouseEvent.MOUSE_DOWN, infoEdit);
			btn_infoDelete.addEventListener(MouseEvent.MOUSE_DOWN, infoDelete);
			//匹配整理
			btn_arrange.addEventListener(MouseEvent.MOUSE_DOWN, arrange);
			//表单提示信息
			inputFieldTips();
			//表单确认
			inputEnter();
			//list
			initList();
		}
		
		//整理相片
		private function arrange(e:MouseEvent):void
		{
			photoFile.getDirectoryListingAsync();
			photoFile.addEventListener(FileListEvent.DIRECTORY_LISTING, directoryListiningHandler);
		}
		
		private function directoryListiningHandler(e:FileListEvent):void
		{
			var contents:Array = e.files;
			for (var i:uint = 0; i < contents.length; i++)
			{
				
				for (var j:int = 0; j < list.array.length; j++)
				{
					photoFileName = list.array[j].userPhotoId + ".JPG";
					if (contents[i].name == photoFileName)
					{
						var sameFile:File;
						trace("匹配" + list.array[j].userName + "的相片" + photoFileName);
						outputFile = photoFile.resolvePath("整理输出/" + list.array[j].userId + "/" + photoFileName);
						
						if (contents[i].exists)
						{
							
							contents[i].moveTo(outputFile, true);
							
							sameFile = outputFile.resolvePath("");
						}
						else
						{
							sameFile.copyTo(outputFile, true);
						}
					}
					
				}
			}
			
			adaptation();
		}
		
		private function adaptation():void
		{
		
		}
		
		//选择被改变时
		private function listSelect(index:int):void
		{
			if (list.selectedIndex != -1)
			{
				listSelectIndex = list.selectedIndex;
				editUser = list.array[listSelectIndex];
				
				if (_isDrawerIn)
				{
					drawerInfo(index);
					trace("显示" + index);
				}
				else
				{
					trace(listSelectIndex);
					trace(_isNewInfo);
					if (_isNewInfo)
					{
						changeInfo(index);
						trace("变更" + index);
					}
					else
					{
						editInfoChange(index);
					}
				}
			}
		}
		
		private function changeInfo(selectedIndex:int):void
		{
			infoView(selectedIndex);
		}
		
		//信息详情
		private function drawerInfo(index:int):void
		{
			drawer.visible = true;
			_isDrawerIn = false;
			box_new.visible = false;
			box_info.visible = true;
			
			//显示选择项信息
			infoView(index);
		}
		
		private function infoView(index:int):void
		{
			infoData = list.array[index];
			//01-10
			if (infoData.userId < 10)
			{
				label_name.text = "0" + infoData.userId.toString() + "   " + infoData.userName;
			}
			else
			{
				label_name.text = infoData.userId.toString() + "   " + infoData.userName;
			}
			
			label_info.text = "宿舍：" + infoData.userDormitory + "-" + infoData.userDorNumber.toString() + "\n电话：" + infoData.userPhone.toString() + "\nEmail：" + infoData.userEmail + "\n相片信息\n电子版：" + infoData.userPhotoId + "\n冲洗版：" + infoData.userPrintPhotoId + "\n\n备注：";
		
		}
		
		//编辑信息
		private function infoEdit(e:MouseEvent):void
		{
			box_new.visible = true;
			box_info.visible = false;
			_isNewInfo = false;
			editInfoChange(listSelectIndex);
			label_title.text = "编辑信息";
		
		}
		
		private function editInfoChange(index:int):void
		{
			
			trace("编辑" + index);
			input_name.text = editUser.userName;
			input_isTown.selectedIndex = editUser.userIsTown;
			input_dor.selectedLabel = editUser.userDormitory;
			input_dorNum.text = editUser.userDorNumber.toString();
			input_phone.text = editUser.userPhone.toString();
			input_email.text = editUser.userEmail;
			input_photoId.text = editUser.userPhotoId;
			input_printPhotoId.text = editUser.userPrintPhotoId;
			input_name.color = 0x666666;
			input_dorNum.color = 0x666666;
			input_phone.color = 0x666666;
			input_email.color = 0x666666;
			input_photoId.color = 0x666666;
			input_printPhotoId.color = 0x666666;
		}
		
		//删除项
		private function infoDelete(e:MouseEvent):void
		{
			drawer.visible = false;
			_isDrawerIn = true;
			list.selectedIndex = -1;
		
		}
		
		private function initList():void
		{
			//自定义渲染方式
			list.renderHandler = new Handler(listRender);
			//自定义选择变更处理
			list.selectHandler = new Handler(listSelect);
		
		/**自定义List项渲染*/
		
		}
		
		private function listRender(item:Component, index:int):void
		{
			
			if (index < list.array.length)
			{
				list.repeatX = 1;
				list.repeatY = list.array.length;
				userData = list.array[index];
				var userId:Label = item.getChildByName("userId") as Label;
				var userName:Label = item.getChildByName("userName") as Label;
				var userDor:Label = item.getChildByName("userDor") as Label;
				var userPhone:Label = item.getChildByName("userPhone") as Label;
				var userEmail:Label = item.getChildByName("userEmail") as Label;
				
				if (userData.userId < 10)
				{
					userId.text = "0" + userData.userId.toString();
				}
				else
				{
					userId.text = userData.userId.toString();
				}
				
				if (userData.userDormitory == null)
				{
					userDor.text = "无";
				}
				else
				{
					userDor.text = userData.userDormitory + "-" + userData.userDorNumber.toString();
				}
				
				userName.text = userData.userName;
				userPhone.text = userData.userPhone.toString();
				userEmail.text = userData.userEmail;
				
			}
		}
		
		//新建drawer动画
		private function IOAnimation(e:MouseEvent):void
		{
			_isNewInfo = true;
			label_title.text = "新建";
			
			if (_isDrawerIn)
			{
				//drawer.x = 674;
				drawer.visible = true;
				_isDrawerIn = false;
				box_new.visible = true;
				box_info.visible = false;
				editUser = new UserInfo();
			}
			else
			{
				//drawer.x = 1010;
				drawer.visible = false;
				_isDrawerIn = true;
				list.selectedIndex = -1;
				
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
			btn_enter.addEventListener(MouseEvent.MOUSE_DOWN, enterDown);
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
			trace("提交编辑信息" + listSelectIndex);
			
			drawer.visible = false;
			_isDrawerIn = true;
		
		}
		
		//处理派发的事件
		protected function onDataActionHandler(event:DataActionEvent):void
		{
			switch (event.kind)
			{
				case DataActionEventKind.KIND_DATA_CHANGE: 
					list.array = event.data as Array;
					trace("数据变更");
					break;
			
				//case DataActionEventKind.KIND_REFRESH: 
				//database.select();
				//break;
			
				//case DataActionEventKind.KIND_SAVE: 
				//if (editUser.userId)
				//{
				//trace("数据更新");
				//database.update(editUser);
				//}
				//else
				//{
				//trace("数据插入");
				//database.insert(editUser);
				//}
				//break;
			}
		
		}
		
		//根据操作处理数据
		protected function onActionHandler(kind:String):void
		{
			var event:DataActionEvent;
			switch (kind)
			{
				case DataActionEventKind.KIND_REFRESH: 
				case DataActionEventKind.KIND_SAVE: 
					event = new DataActionEvent(kind, editUser);
					event.kind = kind;
					break;
				case DataActionEventKind.KIND_EDIT: 
				case DataActionEventKind.KIND_DELETE: 
					event = new DataActionEvent(kind, editUser);
					break;
			}
			if (event)
			{
				dispatchEvent(event);
				trace("派发事件" + event.kind);
			}
			resetForm();
			
			switch (event.kind)
			{
				case DataActionEventKind.KIND_REFRESH: 
					database.select();
					break;
				
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
			
			inputRefresh(input_name, "请输入姓名");
			inputRefresh(input_dorNum, "宿舍号");
			inputRefresh(input_phone, "请输入长号或者短号");
			inputRefresh(input_email, "请输入Email");
			inputRefresh(input_photoId, "电子版相片编码");
			inputRefresh(input_printPhotoId, "冲洗版相片编码");
		}
		
		private function inputRefresh(inputField:TextInput, tipsText:String):void
		{
			inputField.text = tipsText;
			inputField.color = 0xc9cdcc;
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