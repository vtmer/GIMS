/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class SetViewUI extends Dialog {
		public var firstRunInfo:Box;
		public var btn_next:Button;
		public var setInfo:Box;
		public var btn_saveSet:Button;
		public var districtSelect:RadioGroup;
		public var btn_closeSetView:Button;
		public var btn_browse:Button;
		public var input_filesPath:TextInput;
		public var btn_changeFilesPath:Button;
		protected var uiXML:XML =
			<Dialog x="0" y="0">
			  <Image url="png.flat.setDialog" x="0" y="0"/>
			  <Box x="36" y="51" var="firstRunInfo" visible="true">
			    <Button label="NEXT" skin="png.flat.btn_enter" x="332" y="218" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" var="btn_next"/>
			    <Label text="欢迎使用GIMS" size="26" font="Microsoft YaHei" color="0x222222" x="12" selectable="true"/>
			    <Label x="15" y="61" wordWrap="true" width="399" height="71" font="Microsoft YaHei" size="14" text="       GIMS是针对校团委数字中心——美丽瞬间活动而开发的信息管理系统。GIMS不仅可以自动录入女生信息而且可以智能整理相片，大大解放劳动力，提高生产力，造福后代子孙！" color="0x222222" selectable="true"/>
			    <Label text="——维生数工作室" x="15" y="143" font="Microsoft YaHei" size="14" color="0x222222" width="401" height="27" align="right" selectable="true"/>
			    <Label text="_____________________________________________________________" y="176" font="Arial" color="0xcccccc"/>
			    <Label text="（首次运行请设置好相片整理输出目录~）" x="44" y="124" width="246" height="22" font="Microsoft YaHei" size="13" color="0x333333" bold="true"/>
			  </Box>
			  <Box x="36" y="9" var="setInfo" visible="false">
			    <Label text="_____________________________________________________________" y="218" font="Arial" color="0xcccccc"/>
			    <Button label="SAVE" skin="png.flat.btn_enter" x="332" y="260" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" var="btn_saveSet"/>
			    <Label text="初始设置" size="26" font="Microsoft YaHei" color="0x222222" x="12" y="42"/>
			    <Label text="所在校区：" x="13" y="122" font="Microsoft YaHei" size="14" color="0x222222"/>
			    <Label text="相片整理输出位置：" x="13" y="172" color="0x222222" font="Microsoft YaHei" size="14"/>
			    <RadioGroup x="93" y="128" buttonMode="true" var="districtSelect">
			      <RadioButton label="大学城校区" skin="png.flat.radio" labelColors="0x333333" labelFont="Microsoft YaHei" labelSize="13" name="item0"/>
			      <RadioButton label="龙洞校区" skin="png.flat.radio" x="209" labelColors="0x333333" labelFont="Microsoft YaHei" labelSize="13" name="item2"/>
			      <RadioButton label="东风路校区" skin="png.flat.radio" x="105" labelColors="0x333333" labelFont="Microsoft YaHei" labelSize="13" name="item1"/>
			    </RadioGroup>
			    <Button label="" skin="png.flat.btn_close" x="417" var="btn_closeSetView"/>
			    <Button label="选择文件夹..." skin="png.flat.btn_cancel" x="153" y="169" labelFont="Microsoft YaHei" labelColors="0x666666" labelSize="12" var="btn_browse" width="102" height="30"/>
			    <TextInput text="C:/" skin="png.flat.textinput" x="145" y="172" width="220" height="26" autoSize="none" font="Microsoft YaHei" size="12" color="0x666666" margin=",2,," var="input_filesPath" visible="false" disabled="true"/>
			    <Button label="更改" skin="png.flat.btn_cancel" x="370" y="170" width="44" height="30" var="btn_changeFilesPath" visible="false"/>
			  </Box>
			</Dialog>;
		public function SetViewUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}