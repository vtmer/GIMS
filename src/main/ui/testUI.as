/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class testUI extends View {
		protected var uiXML:XML =
			<View>
			  <Label text="陈丽婷" x="117" y="-1" width="100" height="48" align="left" color="0x666666" font="Microsoft YaHei" size="14" bold="false" isHtml="false" margin="13,14,,"/>
			  <Label text="东区12-608" x="216" y="-1" width="141" height="47" margin="13,14,," size="14" color="0x666666" font="Microsoft YaHei" align="left"/>
			  <Label text="13560478360 " x="357" y="-1" width="107" height="48" margin="13,14,," color="0x666666" align="left" font="Microsoft YaHei" size="14"/>
			  <Label text="( 638360 )" x="462" y="-1" width="94" height="47" margin=",14,," font="Microsoft YaHei" color="0x666666" align="left" size="14"/>
			  <Label text="armchanel@msn.com" x="556" width="228" height="48" size="14" margin="13,14,," font="Microsoft YaHei" color="0x666666" y="-2"/>
			  <CheckBox skin="png.flat.checkbox" y="16" x="11"/>
			  <Label text="01" x="79" width="37" height="48" margin=",14,," color="0x666666" size="14" font="Microsoft YaHei" align="center" y="-2"/>
			  <Clip url="png.flat.clip_condition" x="50" y="18" frame="0" clipWidth="14" clipX="2"/>
			</View>;
		public function testUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}