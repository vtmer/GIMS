package main.view
{
	import com.as3xls.xls.ExcelFile;
	import com.as3xls.xls.Sheet;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.NativeWindowResize;
	import flash.events.Event;
	import flash.events.FileListEvent;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.text.ime.CompositionAttributeRange;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import morn.core.components.Box;
	import morn.core.components.List;
	
	import air.update.logging.Level;
	
	import main.database.UserDatabase;
	import main.events.DataActionEvent;
	import main.events.DataActionEventKind;
	import main.model.UserInfo;
	import main.ui.Page1UI;
	
	import morn.core.components.CheckBox;
	import morn.core.components.Clip;
	import morn.core.components.Component;
	import morn.core.components.Label;
	import morn.core.components.TextInput;
	import morn.core.handlers.Handler;
	
	import org.bytearray.smtp.encoding.JPEGEncoder;
	import org.bytearray.smtp.events.SMTPEvent;
	import org.bytearray.smtp.mailer.SMTPMailer;
	
	/**
	 * ...
	 *
	 * @author shengbanx
	 */
	public class Page1 extends Page1UI
	{
		private var _isDrawerIn:Boolean = true;
		private var _isNewInfo:Boolean = true;
		private var editUser:UserInfo;
		private var listSelectIndex:int;
		private var database:UserDatabase;
		private var inputDatabase:UserDatabase;
		private var userData:UserInfo;
		private var infoData:UserInfo;
		private var photoFile:File;
		private var outputFile:File;
		private var printPhotoFile:File;
		private var photoFileName:String;
		private var printPhotoFileName:String;
		private var photoIdArray:Array;
		private var contents:Array;
		private var sameFile:File;
		private var progressRateNum:int;
		private var progressBarMaxWidth:int = 573;
		private var selectedListItemArray:Array;
		private var isFirstRun:Boolean = true;
		private var isArrange:Boolean = false;
		private var isAllSelected:Boolean = false;
		private var photoViewFile:File;
		private var currentOutputFile:File;
		private var userIdArray:Array = new Array();
		private var versonLabel:String = "0.6";
		private var xlsFile:File;
		private var dbFile:File;
		private var currentRepeat:uint;
		private var sheet:Sheet;
		private var inputXls:ExcelFile;
		private var smtpMailer:SMTPMailer;
		private var photoFiles:File;
		
		public function Page1()
		{
			//初始化
			init();
			
			//窗口操作
			windowsBtn();
			
			//按钮事件
			buttonEvent();
			
			//搜索功能
			input_search.addEventListener(FocusEvent.FOCUS_IN, inputSearch);
			
			//表单提示信息功能
			inputFieldTips();
			
			//表单确认功能
			inputEnter();
			
			//list渲染
			initList();
			
			//筛选非本校区
			isTown();
			
			//选择项组
			//selectedListItem();
			
			//第一次运行
		    firstRun();
			
			//读取版本号
			//setVerson();
			//发送邮件
			//btn_send.addEventListener(MouseEvent.MOUSE_DOWN, sendEmail);
			//btn_infoSend.addEventListener(MouseEvent.MOUSE_DOWN, sendEmail);
			
		}
		
		private function init():void 
		{
			outputFile = new File();
			photoFile = new File();
			database = new UserDatabase();
			database.addEventListener(DataActionEvent.DATA_ACTION_EVENT, onDataActionHandler);
		}
		
		private function buttonEvent():void 
		{
			//drawer动画
			btn_block.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			btn_new.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			block_blank.addEventListener(MouseEvent.MOUSE_DOWN, IOAnimation);
			//toolBar按钮
			btn_set.addEventListener(MouseEvent.MOUSE_DOWN, onSetBtnDown);
			//drawer按钮
			btn_infoEdit.addEventListener(MouseEvent.MOUSE_DOWN, infoEdit);
			btn_infoDelete.addEventListener(MouseEvent.MOUSE_DOWN, infoDelete);
			//匹配整理
			btn_arrange.addEventListener(MouseEvent.MOUSE_DOWN, arrange);
			//关于
			btn_quesent.addEventListener(MouseEvent.MOUSE_DOWN, onAboutBtn);
			//导入导出
			btn_io.addEventListener(MouseEvent.MOUSE_DOWN, onIOBtn);
			//最后一次整理
			btn_allSelect.clickHandler = new Handler(lastArrange);
		}
		
		//private function setVerson():void
		//{
		//var prefsXML:XML;
		//var file:File = File.applicationDirectory.resolvePath("application.xml");
		//
		//var fileStream:FileStream = new FileStream();
		//fileStream.open(file, FileMode.READ);
		//prefsXML = XML(fileStream.readUTFBytes(fileStream.bytesAvailable));
		//trace(prefsXML);
		//trace(prefsXML.id[0]);
		//fileStream.close();
		//}
		
		//private function sendEmail(e:MouseEvent):void {
			//smtpMailer = new SMTPMailer("smtp.163.com", 25);
			//smtpMailer.authenticate("testas3smtp", "13152468");
			//smtpMailer.addEventListener(SMTPEvent.AUTHENTICATED, onAuthSuccess);
		//}
		//
		//private function onAuthSuccess(e:SMTPEvent):void 
		//{
			//trace("onAuthSucess");
			//getPhotoData(editUser.userPhotoId, "电子版");
			//
		//}
		//
		//private function getPhotoData(photoId:String, photoType:String):void
		//{
			//photoIdArray = photoId.split(",");
			//photoFileName = photoIdArray[0] + ".jpg";
			//
			//photoFiles = outputFile.resolvePath(photoType + "/" +  userIdArray[listSelectIndex] + "/" + photoFileName);
			//var byteArr:ByteArray = photoFiles.data;
			//var ldr:Loader = new Loader();
			//ldr.loadBytes(byteArr);
			//ldr.contentLoaderInfo.addEventListener(Event.INIT, initLdrOK);
		//}
		//
		//private function initLdrOK(e:Event):void 
		//{
			//var ldrInfo:LoaderInfo = e.currentTarget as LoaderInfo;
			//ldrInfo.removeEventListener(Event.INIT, initLdrOK);
			//var ldr:Loader = ldrInfo.loader;
			//var bmd:BitmapData = new BitmapData(ldr.width, ldr.height);
			//bmd.draw(ldr);
			//var jpg:JPEGEncoder = new JPEGEncoder(50);
			//var jpgBArr:ByteArray = jpg.encode(bmd);
			//smtpMailer.sendAttachedMail("testas3Smtp@163.com", "609665233", "（测试）您的女生节相片", "测试", jpgBArr, photoFileName);
		//}

		//导入导出功能
		private function onIOBtn(e:MouseEvent):void
		{
			IOView.visible = true;
			whiteMask.visible = true;
			IOView.btn_input.addEventListener(MouseEvent.MOUSE_DOWN, onInputBtn);
			IOView.btn_output.addEventListener(MouseEvent.MOUSE_DOWN, onOutputBtn);
			IOView.btn_closeIOView.addEventListener(MouseEvent.MOUSE_DOWN, onCloseIOViewBtn);
		}
		
		private function onCloseIOViewBtn(e:MouseEvent):void
		{
			database.openDb();
			IOView.visible = false;
			whiteMask.visible = false;
		}
		
		private function onOutputBtn(e:MouseEvent):void
		{
			//导出excel
			exportToExcelByList(list);
			//导出数据库
			ouputDb();
		}
		
		//导出数据库
		private function ouputDb():void
		{
			var outputFile:File = File.applicationStorageDirectory.resolvePath("userInfo.db");
			var outputDbFile:File = outputFile.resolvePath("数据库文件/userInfo.db");
			outputFile.copyTo(outputDbFile, true);
		}
		
		//导出Excel表格
		private function exportToExcelByList(list:List, xlsName:String = "导出表格")
		{
			var _sheet:Sheet = new Sheet();
			
			var rowCount:int = list.array.length;
			var columnCount:int = 8;
			_sheet.resize(rowCount + 1, columnCount);
			
			switch (setView.districtSelect.selectedIndex)
			{
				case 0: 
					var _fields:Array = ["No.", "姓名", "是否本校", "宿舍", "电话", "邮箱", "电子版相片ID", "冲洗版相片ID"];
					//循环所有列添加表头项
					for (var i:uint = 0; i < _fields.length; i++)
					{
						_sheet.setCell(0, i, _fields[i]); //设置单元格 参数:1、行号；2、列号；3、单元格的值
						
					}
					
					//循环所有数据,r+1行c列单元格
					for (var r:int = 0; r < rowCount; r++)
					{
						
						//把数据写入某行某列
						for (var c:uint = 0; c < _fields.length; c++)
						{
							switch (c)
							{
								case 0: 
									_sheet.setCell(r + 1, c, userIdArray[r]);
									break;
								case 1: 
									_sheet.setCell(r + 1, c, list.array[r].userName);
									break;
								case 2: 
									var isTownText:String = "是";
									if (list.array[r].userIsTown == 1)
									{
										isTownText = "否";
									}
									_sheet.setCell(r + 1, c, isTownText);
									break;
								
								case 3: 
									if (userData.userDormitory == null)
									{
										_sheet.setCell(r + 1, c, "无");
									}
									else
									{
										_sheet.setCell(r + 1, c, list.array[r].userDormitory + "-" + list.array[r].userDorNumber.toString());
									}
									break;
								
								case 4: 
									_sheet.setCell(r + 1, c, list.array[r].userPhone);
									break;
								case 5: 
									_sheet.setCell(r + 1, c, list.array[r].userEmail);
									break;
								case 6: 
									_sheet.setCell(r + 1, c, list.array[r].userPhotoId);
									break;
								case 7: 
									_sheet.setCell(r + 1, c, list.array[r].userPrintPhotoId);
									break;
							
							}
						}
					}
					break;
				case 1: 
				case 2: 
					var _fields:Array = ["No.", "姓名", "宿舍", "电话", "邮箱", "电子版相片ID", "冲洗版相片ID"];
					//循环所有列添加表头项
					for (var i:uint = 0; i < _fields.length; i++)
					{
						_sheet.setCell(0, i, _fields[i]); //设置单元格 参数:1、行号；2、列号；3、单元格的值
						
					}
					
					//循环所有数据,r+1行c列单元格
					for (var r:int = 0; r < rowCount; r++)
					{
						
						//把数据写入某行某列
						for (var c:uint = 0; c < _fields.length; c++)
						{
							switch (c)
							{
								case 0: 
									_sheet.setCell(r + 1, c, userIdArray[r]);
									break;
								case 1: 
									_sheet.setCell(r + 1, c, list.array[r].userName);
									break;
								
								case 2: 
									if (userData.userDormitory == null)
									{
										_sheet.setCell(r + 1, c, "无");
									}
									else
									{
										_sheet.setCell(r + 1, c, list.array[r].userDormitory + "-" + list.array[r].userDorNumber.toString());
									}
									break;
								
								case 3: 
									_sheet.setCell(r + 1, c, list.array[r].userPhone);
									break;
								case 4: 
									_sheet.setCell(r + 1, c, list.array[r].userEmail);
									break;
								case 5: 
									_sheet.setCell(r + 1, c, list.array[r].userPhotoId);
									break;
								case 6: 
									_sheet.setCell(r + 1, c, list.array[r].userPrintPhotoId);
									break;
							
							}
						}
					}
					break;
			
			}
			
			var xls:ExcelFile = new ExcelFile();
			xls.sheets.addItem(_sheet);
			var bytes:ByteArray = xls.saveToByteArray();
			var fr:FileReference = new FileReference();
			fr.save(bytes, xlsName + ".xls");
			return fr;
		
		}
		
		private function onInputBtn(e:MouseEvent):void
		{
			
			
			var dbFilter:FileFilter = new FileFilter("数据库文件", "*.db");
			
			dbFile = new File();
			
			dbFile.browseForOpen("选择要导入的数据库文件", [dbFilter]);
			dbFile.addEventListener(Event.SELECT, fileSelected);
		
		}
		
		private function fileSelected(e:Event):void
		{
			database.cloceDb();
			
			var localDbFile = File.applicationStorageDirectory.resolvePath("userInfo.db");
			dbFile.copyTo(localDbFile, true);
			
			
			//database.setInputDbFile(dbFile);
			
			//读取xls文件
			//var stream:FileStream = new FileStream();
			//stream.open(xlsFile, FileMode.READ);
			//var ba:ByteArray = new ByteArray();
			//stream.readBytes(ba);
			//stream.close();
			//
			//inputXls = new ExcelFile();
			//
			//inputXls.loadFromByteArray(ba);
			//sheet = inputXls.sheets[0];
			//
			//IOView.visible = false;
			//whiteMask.visible = false;
			//
			//延时调用
			//var repeatCount:uint = sheet.rows - 1;
			//var timer:Timer = new Timer(1000, repeatCount);
			//timer.addEventListener(TimerEvent.TIMER, repeatTimerHandler);
			//timer.start();
			//currentRepeat = 1;
		
		}
		
		//private function repeatTimerHandler(e:TimerEvent):void
		//{
			//
			//insertByXls(sheet);
		//
		//
		//}
		
		//由表格插入数据
		//private function insertByXls(sheet:Sheet):void
		//{
			//currentRepeat++;
			//editUser.userName = String(sheet.getCell(currentRepeat, 2));
			//if (String(sheet.getCell(currentRepeat, 3)) == "是")
				//editUser.userIsTown = 0;
			//else
				//editUser.userIsTown = 1;
			//if (String(sheet.getCell(currentRepeat, 4)) != "无")
			//{
				//var stringArray:Array;
				//stringArray = String(sheet.getCell(currentRepeat, 4)).split("-");
				//editUser.userDormitory = stringArray[0];
				//editUser.userDorNumber = Number(stringArray[1]);
			//}
			//else
			//{
				//editUser.userDormitory = null;
				//editUser.userDorNumber = 0;
			//}
			//editUser.userPhone = Number(sheet.getCell(currentRepeat, 5));
			//editUser.userEmail = String(sheet.getCell(currentRepeat, 6));
			//editUser.userPhotoId = String(sheet.getCell(currentRepeat, 7));
			//editUser.userPrintPhotoId = String(sheet.getCell(currentRepeat, 8));
			//
			//onActionHandler(DataActionEventKind.KIND_SAVE);
		//}
		
		//最后一次整理
		private function lastArrange():void
		{
			if (btn_allSelect.selected)
			{
				isAllSelected = true;
				trace("全选中");
			}
			else
			{
				isAllSelected = false;
			}
		}
		
		//重排序正确显示序号
		private function sortAgain():void
		{
			for (var i:int = 0; i < list.array.length; i++)
			{
				if (i < 10)
				{
					userIdArray[i] = "00" + (i + 1).toString();
				}
				else if (9 < i < 100)
				{
					userIdArray[i] = "0" + (i + 1).toString();
				}
				else
				{
					userIdArray[i] = (i + 1).toString();
				}
			}
		}
		
		
		//关于页面
		private function onAboutBtn(e:MouseEvent):void
		{
			AboutVIew.Version.text = versonLabel;
			AboutVIew.visible = true;
			whiteMask.visible = true;
			AboutVIew.btn_closeAboutView.addEventListener(MouseEvent.MOUSE_DOWN, onCloseAboutViewBtn);
		}
		
		private function onCloseAboutViewBtn(e:MouseEvent):void
		{
			AboutVIew.visible = false;
			whiteMask.visible = false;
		}
		
		//第一次运行&设置
		private function onSetBtnDown(e:MouseEvent):void
		{
			setViewInfo();
		}
		
		private function firstRun():void
		{
			if (isFirstRun)
			{
				whiteMask.visible = true;
				setView.visible = true;
				setView.btn_next.addEventListener(MouseEvent.MOUSE_DOWN, onNextBtn);
				setView.btn_saveSet.disabled = true;
				setView.btn_closeSetView.disabled = true;
			}
			else
			{
				setView.btn_saveSet.disabled = false;
				setView.btn_closeSetView.disabled = false;
			}
		}
		
		private function onNextBtn(e:MouseEvent):void
		{
			
			setView.firstRunInfo.visible = false;
			setView.setInfo.visible = true;
			setViewInfo();
			setView.btn_browse.addEventListener(MouseEvent.MOUSE_DOWN, onBrowseBtn);
			setView.btn_saveSet.addEventListener(MouseEvent.MOUSE_DOWN, onSaveBtn);
			setView.btn_closeSetView.addEventListener(MouseEvent.MOUSE_DOWN, onCloseSetBtn);
			setView.btn_changeFilesPath.addEventListener(MouseEvent.MOUSE_DOWN, onBrowseBtn);
		}
		
		private function setViewInfo():void
		{
			setView.visible = true;
			whiteMask.visible = true;
		
		}
		
		private function onCloseSetBtn(e:MouseEvent):void
		{
			setView.visible = false;
			whiteMask.visible = false;
		}
		
		private function onSaveBtn(e:MouseEvent):void
		{
			//响应校区选择
			switch (setView.districtSelect.selectedIndex)
			{
				case 0: 
					tab_isTown.visible = true;
					image_isTown.visible = true;
					input_dor.labels = "东十二,东十三,西五,西六";
					input_isTown.visible = true;
					Label_newInfo.text = "姓名：<br>是否大学城校区：<br>宿舍：<br>联系电话：<br>邮箱：";
					break;
				case 1:
					
					tab_isTown.visible = false;
					image_isTown.visible = false;
					input_dor.labels = "东,南,北,综南,综北";
					input_isTown.visible = false;
					Label_newInfo.text = "姓名：<br><br>宿舍：<br>联系电话：<br>邮箱：";
					break;
				case 2:
					
					tab_isTown.visible = false;
					image_isTown.visible = false;
					input_dor.labels = "A1,A2,A3,A4,A5,A6,B1,F,G1,G2,G3,G4,G5,G6";
					input_isTown.visible = false;
					Label_newInfo.text = "姓名：<br><br>宿舍：<br>联系电话：<br>邮箱：";
					break;
			}
			
			setView.visible = false;
			whiteMask.visible = false;
		
		}
		
		private function onBrowseBtn(e:MouseEvent):void
		{
			outputFile.browseForDirectory("选择相片输出目录");
			outputFile.addEventListener(Event.SELECT, directorySelected);
		
		}
		
		private function directorySelected(e:Event):void
		{
			isFirstRun = false;
			firstRun();
			
			outputFile = e.target as File;
			setView.btn_browse.visible = false;
			setView.input_filesPath.visible = true;
			setView.input_filesPath.text = outputFile.nativePath;
			setView.btn_changeFilesPath.visible = true;
		}
		
		private function selectedListItem():void
		{
			selectedCheckBox.addEventListener(MouseEvent.CLICK, onCheckBoxClick);
		}
		
		private function onCheckBoxClick():void
		{
			var cell:Component = list.selection;
			var checkBox:CheckBox = cell.getChildByName("selectedCheck") as CheckBox;
			list.array[listSelectIndex].dataSource["selectedCheck"] = checkBox.selected;
			trace("勾选" + listSelectIndex);
		}
		
		//筛选非本校区
		private function isTown():void
		{
			tab_isTown.selectHandler = new Handler(isTownHandler);
		}
		
		private function isTownHandler(index:int):void
		{
			scrollBarView.value = 0;
			onActionHandler(DataActionEventKind.KIND_FILTER);
		}
		
		//搜索
		private function inputSearch(e:FocusEvent):void
		{
			this.addEventListener(KeyboardEvent.KEY_DOWN, onEnter);
		}
		
		private function onEnter(e:KeyboardEvent):void
		{
			if (e.keyCode == 13)
			{
				var searchText:String = input_search.text;
			}
			for (var i:int = 0; i < list.array.length; i++)
			{
				if (list.array[i].userName == searchText)
				{
					scrollBarView.value = i;
					list.selectedIndex = i;
				}
				
			}
		}
		
		//整理相片
		private function arrange(e:MouseEvent):void
		{
			
			if (isArrange)
			{
				
				arrangeFiles();
				
			}
			else
			{
				photoFile = new File();
				photoFile.browseForDirectory("请选择相片所在目录");
				photoFile.addEventListener(Event.SELECT, photoFileSelected);
			}
		}
		
		private function onEnterTipsBtn(e:MouseEvent):void
		{
			TipsView.visible = false;
			whiteMask.visible = false;
			photoFile.getDirectoryListingAsync();
			photoFile.addEventListener(FileListEvent.DIRECTORY_LISTING, directoryListiningHandler);
			progress();
		}
		
		private function onCloseTipsBtn(e:MouseEvent):void
		{
			TipsView.visible = false;
			whiteMask.visible = false;
		}
		
		private function photoFileSelected(e:Event):void
		{
			photoFile = e.target as File;
			isArrange = true;
			arrangeFiles();
		}
		
		private function arrangeFiles():void
		{
			if (isAllSelected)
			{
				TipsView.visible = true;
				whiteMask.visible = true;
				TipsView.btn_closeTipsView.addEventListener(MouseEvent.MOUSE_DOWN, onCloseTipsBtn);
				TipsView.btn_enterTips.addEventListener(MouseEvent.MOUSE_DOWN, onEnterTipsBtn);
				
			}
			else
			{
				photoFile.getDirectoryListingAsync();
				photoFile.addEventListener(FileListEvent.DIRECTORY_LISTING, directoryListiningHandler);
				progress();
			}
		}
		
		private function progress():void
		{
			dialog_progress.visible = true;
			whiteMask.visible = true;
			dialog_progress.btn_ProgressClose.addEventListener(MouseEvent.MOUSE_DOWN, cancelProgress);
			dialog_progress.btn_ProgressCancel.addEventListener(MouseEvent.MOUSE_DOWN, cancelProgress);
			dialog_progress.addEventListener(Event.ENTER_FRAME, progressEF);
			
			progressRateNum = 0;
		}
		
		private function progressEF(e:Event):void
		{
			
			dialog_progress.progressBar.width = progressRateNum / 100 * progressBarMaxWidth;
			dialog_progress.CurrentRate.text = progressRateNum.toString() + "%";
			
			if (progressRateNum == 100)
			{
				dialog_progress.visible = false;
				whiteMask.visible = false;
				dialog_progress.removeEventListener(Event.ENTER_FRAME, progressEF);
			}
		}
		
		private function cancelProgress(e:MouseEvent):void
		{
			dialog_progress.visible = false;
			whiteMask.visible = false;
		}
		
		private function directoryListiningHandler(e:FileListEvent):void
		{
			contents = e.files;
			for (var i:uint = 0; i < contents.length; i++)
			{
				progressRateNum = Math.floor((i + 1) / contents.length * 100);
				trace(progressRateNum);
				for (var j:int = 0; j < list.array.length; j++)
				{
					if (isAllSelected)
					{
						adaptation(list.array[j].userPhotoId, "电子版", i, userIdArray[j]);
						adaptation(list.array[j].userPrintPhotoId, "冲洗版", i, userIdArray[j]);
					}
					else
					{
						adaptation(list.array[j].userPhotoId, "电子版", i, list.array[j].userId);
						adaptation(list.array[j].userPrintPhotoId, "冲洗版", i, list.array[j].userId);
					}
					
				}
			}
		
		}
		
		//分割匹配
		private function adaptation(photoId:String, photoType:String, index:int, userId:String):void
		{
			
			photoIdArray = photoId.split(",");
			
			for (var k:int = 0; k < photoIdArray.length; k++)
			{
				photoFileName = photoIdArray[k] + ".JPG";
				if (contents[index].name == photoFileName)
				{
					
					currentOutputFile = outputFile.resolvePath(photoType + "/" + userId + "/" + photoFileName);
					
					//if (contents[index].exists)
					//{
					//
					contents[index].copyTo(currentOutputFile, true);
						//
						//sameFile = currentOutputFile.resolvePath("");
						//}
						//else
						//{
						//sameFile.copyTo(currentOutputFile, true);
						//}
				}
			}
		
		}
		
		//list选择被改变时
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
			
			label_name.text = userIdArray[index].toString() + "   " + editUser.userName;
			
			label_info.text = "宿舍：" + editUser.userDormitory + "-" + editUser.userDorNumber.toString() + "\n电话：" + editUser.userPhone.toString() + "\nEmail：" + editUser.userEmail + "\n相片信息\n电子版：" + editUser.userPhotoId + "\n冲洗版：" + editUser.userPrintPhotoId + "\n\n备注：";
			
			tab_photoType.selectedIndex = 0;
			getPhoto(editUser.userPhotoId, "电子版");
			
			tab_photoType.selectHandler = new Handler(photoTypeChange);
			tab_circle.selectHandler = new Handler(circleChange);
		
		}
		
		//改变相片类型时
		private function photoTypeChange(index:int):void
		{
			
			switch (index)
			{
				//电子版
				case 0: 
					getPhoto(editUser.userPhotoId, "电子版");
					break;
				//冲洗版
				case 1: 
					getPhoto(editUser.userPrintPhotoId, "冲洗版");
					break;
			}
		}
		
		//获取相片
		private function getPhoto(photoId:String, photoType:String):void
		{
			photoIdArray = photoId.split(",");
			photoFileName = photoIdArray[0] + ".jpg";
			
			//获取相片数作指示器
			var photoNum:Array = [];
			for (var i:int = 0; i < photoIdArray.length; i++)
			{
				photoNum.push("");
			}
			tab_circle.labels = photoNum.toString();
			
			photoViewFile = outputFile.resolvePath(photoType + "/" + editUser.userId + "/" + photoFileName);
			photoView.url = photoViewFile.url;
		}
		
		//改变相片编号指示器
		private function circleChange(index:int):void
		{
			switch (tab_photoType.selectedIndex)
			{
				//电子版
				case 0: 
					changePhoto("电子版", index);
					break;
				//冲洗版
				case 1: 
					changePhoto("冲洗版", index);
					break;
			}
		
		}
		
		private function changePhoto(photoType:String, index:int):void
		{
			trace(photoIdArray);
			photoFileName = photoIdArray[index] + ".jpg";
			photoViewFile = outputFile.resolvePath(photoType + "/" +  editUser.userId + "/" + photoFileName);
			photoView.url = photoViewFile.url;
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
			
			trace("是否大学城" + editUser.userIsTown);
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
			
			onActionHandler(DataActionEventKind.KIND_DELETE);
		
		}
		
		private function initList():void
		{
			//自定义渲染方式
			list.renderHandler = new Handler(listRender);
			//自定义选择变更处理
			list.selectHandler = new Handler(listSelect);
			//滚轮时
			list.addEventListener(MouseEvent.MOUSE_WHEEL, onRollWheelHander);
			//双击编辑
			//render.doubleClickEnabled = true;
			//render.addEventListener(MouseEvent.DOUBLE_CLICK,onListDoubleClick);
		
		}
		
		//private function onListDoubleClick(e:MouseEvent):void
		//{
		//trace("双击");
		//box_new.visible = true;
		//box_info.visible = false;
		//_isNewInfo = false;
		//editInfoChange(listSelectIndex);
		//label_title.text = "编辑信息";
		//editInfoChange(listSelectIndex);
		//}
		
		//滚动条
		private function onRollWheelHander(e:MouseEvent):void
		{
			//初始化判断
			if (list.array.length < 11)
				scrollBarView.value = 0;
			
			scrollBarView.alpha = 1;
			
			var myTimer:Timer = new Timer(1000, 1);
			myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			myTimer.reset();
			myTimer.start();
			
			//list遮蔽底部
			if (scrollBarView.value + 13 > list.array.length || list.array.length < 10)
			{
				block_mask.visible = false;
			}
			else
			{
				block_mask.visible = true;
			}
		}
		
		private function timerHandler(e:Event):void
		{
			scrollBarView.alpha = 0;
		}
		
		/**自定义List项渲染*/
		private function listRender(item:Component, index:int):void
		{
			
			if (index < list.array.length)
			{
				list.repeatX = 1;
				list.repeatY = list.array.length;
				userData = list.array[index] as UserInfo;
				var userId:Label = item.getChildByName("userId") as Label;
				var userName:Label = item.getChildByName("userName") as Label;
				var userDor:Label = item.getChildByName("userDor") as Label;
				var userPhone:Label = item.getChildByName("userPhone") as Label;
				var userEmail:Label = item.getChildByName("userEmail") as Label;
				var userIsFinish:Clip = item.getChildByName("userIsFinish") as Clip;
				var selectedCheck:CheckBox = item.getChildByName("selectedCheck") as CheckBox;
				
				userId.text = userIdArray[index];
				
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
				
				//判断是否匹配
				if (!isFirstRun)
				{
					var testFile:File = outputFile.resolvePath("电子版/" + Number(userData.userId));
					var testFile2:File = outputFile.resolvePath("冲洗版/" + Number(userData.userId));
					
					if (testFile.exists && testFile2.exists)
					{
						userIsFinish.frame = 0;
						trace(index + "存在");
					}
					else
					{
						userIsFinish.frame = 1;
					}
				}
				//判断是否选择
				selectedCheck.selected = isAllSelected;
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
			//代码录入测试数据（数字为添加数量）:按整理后新建并点击确认
			//InputText();
			
			editUser.userName = input_name.text;
			trace(input_isTown.selectedIndex);
			editUser.userIsTown = Number(input_isTown.selectedIndex);
			editUser.userDormitory = input_dor.selectedLabel;
			editUser.userDorNumber = Number(input_dorNum.text);
			editUser.userPhone = Number(input_phone.text);
			editUser.userEmail = input_email.text;
			editUser.userPhotoId = input_photoId.text;
			editUser.userPrintPhotoId = input_printPhotoId.text;
			
			onActionHandler(DataActionEventKind.KIND_SAVE);
			trace("提交编辑信息" + input_isTown.selectedIndex);
			
			//是否为新建信息做出响应
			if (label_title.text == "新建")
			{
				drawer.visible = false;
				_isDrawerIn = true;
				if (list.array.length > 10)
				{
					scrollBarView.value = list.array.length + 6;
				}
			}
			else
			{
				drawerInfo(listSelectIndex);
			}
		
		}
		
		private function InputText():void
		{
			
			//名字
			var lastName:Array = ["黄", "夏", "陈", "萧", "凌", "林", "刘", "邹", "白", "王", "李", "张", "杨", "吴", "赵", "周", "徐", "孙", "马", "朱", "胡", "郭", "何", "高", "罗", "叶", "蒋", "杜", "苏", "魏", "程", "吕", "丁", "沈", "任", "曾"];
			var firstName:Array = ["苏", "燕", "暖", "夏", "安", "柔", "默", "朵", "沐", "芷", "若", "沫", "岚", "颜", "然", "念", "瑟", "素", "静", "温", "绿", "懒", "糖", "秋", "北", "西", "南", "白", "果", "柒", "染", "莫", "落", "寞", "墨", "左", "初", "陌", "离", "纪", "清", "薇", "浅", "月", "瑾", "断", "以", "顾", "羽", "七", "莲", "见", "萧", "东", "梦", "青", "韵"];
			var lastNameIndex:int;
			var firstNameIndex:int;
			var firstNameIndex2:int;
			var photoFileIndex:int;
			var photoFlieNameText:String;
			
			lastNameIndex = Math.floor(Math.random() * lastName.length);
			firstNameIndex = Math.floor(Math.random() * firstName.length);
			firstNameIndex2 = Math.floor(Math.random() * firstName.length);
			if (Math.random() < 0.5)
				input_name.text = lastName[lastNameIndex] + firstName[firstNameIndex];
			else
				input_name.text = lastName[lastNameIndex] + firstName[firstNameIndex] + firstName[firstNameIndex2];
			
			input_dor.selectedIndex = Math.floor(Math.random() * 4);
			input_dorNum.text = String(Number(200 + Math.floor(Math.random() * 550)));
			input_isTown.selectedIndex = Math.floor(Math.random() * 1.1);
			input_phone.text = String(Number(13511111111 + Math.floor(Math.random() * 88888888)));
			input_email.text = String(Number(Math.floor(Math.random() * 999999999))) + "@qq.com";
			
			photoFileIndex = Math.floor(Math.random() * contains.length);
			photoFlieNameText = contents[photoFileIndex].name;
			input_photoId.text = photoFlieNameText.substring(0, 4);
			input_printPhotoId.text = photoFlieNameText.substring(0, 4);
		
		}
		
		//处理派发的事件
		protected function onDataActionHandler(event:DataActionEvent):void
		{
			switch (event.kind)
			{
				case DataActionEventKind.KIND_DATA_CHANGE:
					
					list.array = event.data as Array;
					sortAgain();
					trace("数据变更");
					break;
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
				case DataActionEventKind.KIND_FILTER: 
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
				case DataActionEventKind.KIND_DELETE: 
					database.remove(editUser);
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
				case DataActionEventKind.KIND_FILTER: 
					if (tab_isTown.selectedIndex == 1)
						database.setIsTownIndex("WHERE user_isTown=1");
					else
						database.setIsTownIndex("");
					editUser = list.array[0];
					database.update(editUser);
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