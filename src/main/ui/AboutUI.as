/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class AboutUI extends Dialog {
		public var btn_closeAboutView:Button;
		public var Version:Label;
		protected var uiXML:XML =
			<Dialog>
			  <Image url="png.flat.setDialog" x="0" y="0"/>
			  <Button label="" skin="png.flat.btn_close" x="453" y="8" var="btn_closeAboutView" buttonMode="true"/>
			  <Label text="About GIMS" x="60" y="44" font="Microsoft YaHei" size="18"/>
			  <Label x="59" y="82" width="386" height="149" isHtml="true" text="Girls' Day Information Management System, &lt;br>for Digital Center Beautiful Moment Activity in GDUT Girls' Day. &lt;br>&lt;br>女生节信息管理系统，是一个用于管理照片信息的桌面应用程序，在女生节广东工业大学团委数字中心的“美丽瞬间”活动中使用。 &lt;br>&lt;br>采用ActionScript3.0+Adobe Air+Morn UI的&lt;br>&lt;b>Flash开发&lt;/b>技术。（I ❤ Flash~)" wordWrap="true" multiline="true" autoSize="center" font="Microsoft YaHei" size="12" color="0x333333"/>
			  <Label text=" _______________________________________________________" x="57" y="60" color="0xcccccc"/>
			  <Label text="版本：" x="191" y="49" font="Microsoft YaHei" color="0x666666"/>
			  <Label text="Alpha 0.5.3" x="229" y="49" font="Microsoft YaHei" color="0x666666" var="Version"/>
			  <Label text="——大学城数字中心&lt;br>Vtmer维生数工作室" x="79" y="239" width="369" height="51" isHtml="true" multiline="true" align="right" autoSize="none" font="Microsoft YaHei" size="12" color="0x333333"/>
			</Dialog>;
		public function AboutUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}