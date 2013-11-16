/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class IOViewUI extends Dialog {
		public var btn_closeIOView:Button;
		public var btn_input:Button;
		public var btn_output:Button;
		protected var uiXML:XML =
			<Dialog>
			  <Image url="png.flat.setDialog" x="0" y="0" width="500" height="242"/>
			  <Button label="" skin="png.flat.btn_close" x="454" y="7" var="btn_closeIOView"/>
			  <Image url="png.flat.line" x="250" y="20" rotation="90" width="200" height="2" alpha=".8"/>
			  <Image url="png.flat.icon_output" x="355" y="65"/>
			  <Image url="png.flat.icon_input" x="111" y="66"/>
			  <Label text="导入可扩充信息" x="79" y="104" color="0x333333" font="Microsoft YaHei"/>
			  <Label text="导出信息，打印或导入到其它地方" x="324" y="105" width="91" height="39" wordWrap="true" font="Microsoft YaHei" color="0x333333"/>
			  <Button label="导入" skin="png.flat.btn_enter" x="79" y="165" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" var="btn_input"/>
			  <Button label="导出" skin="png.flat.btn_enter" x="325" y="165" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" var="btn_output"/>
			</Dialog>;
		public function IOViewUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}