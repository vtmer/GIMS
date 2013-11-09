/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class ProgressUI extends Dialog {
		public var progressBar:Image;
		public var btn_ProgressClose:Button;
		public var btn_ProgressCancel:Button;
		public var CurrentRate:Label;
		protected var uiXML:XML =
			<Dialog>
			  <Image url="png.flat.dialog" x="0" y="0"/>
			  <Image url="png.flat.progressBase" x="26" y="75"/>
			  <Image url="png.flat.progressBarView" x="33" y="80" sizeGrid="9,9,9,9" width="573" height="21" var="progressBar"/>
			  <Button label="" skin="png.flat.btn_close" x="593" y="8" var="btn_ProgressClose"/>
			  <Label text="正在匹配..." x="290" y="40" color="0x666666" font="Microsoft YaHei"/>
			  <Button label="取消" skin="png.flat.btn_cancel" x="523" y="126" labelFont="Microsoft YaHei" labelSize="12" labelColors="0x666666" var="btn_ProgressCancel"/>
			  <Label text="62%" x="303" y="79" color="0xffffff" font="Microsoft YaHei" size="14" var="CurrentRate"/>
			</Dialog>;
		public function ProgressUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}