/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class drawerUI extends View {
		protected var uiXML:XML =
			<View>
			  <Image url="png.flat.information" x="0" y="0"/>
			  <Label text="新建" x="27" y="29" size="24" font="Microsoft YaHei" color="0x333333"/>
			  <Label text="姓名：&lt;br>是否大学城校区：&lt;br>宿舍：&lt;br>联系电话：&lt;br>邮箱：" x="27" y="83" multiline="true" wordWrap="false" width="108" height="189" isHtml="true" leading="23" size="12" font="Microsoft YaHei" color="0x333333"/>
			  <Label text="........................................................................................................." x="25" y="279" color="0xc9cdcc"/>
			  <Label text="相片编码：" x="27" y="313" color="0x333333" font="Microsoft YaHei" size="12"/>
			  <Label text="_________________________________________" x="24" y="54" color="0xc9cdcc"/>
			  <TextInput text="请输入姓名" skin="png.flat.textinput" x="69" y="79" height="28" width="237" align="left" margin="5,5,," color="0xc9cdcc" size="12" font="Microsoft YaHei"/>
			  <TextInput text="请输入长号或者短号" skin="png.flat.textinput" x="92" y="199" width="214" height="28" margin="5,5,," color="0xc9cdcc" font="Microsoft YaHei" size="12"/>
			  <RadioButton skin="png.flat.radio" x="151" y="125" label="是" labelFont="Microsoft YaHei" labelColors="0x333333,0x333333,0x333333,0x333333"/>
			  <TextInput text="宿舍号" skin="png.flat.textinput" x="167" y="159" width="139" height="28" color="0xc9cdcc" margin="5,5" font="Microsoft YaHei" size="12"/>
			  <TextInput text="请输入姓名" skin="png.flat.textinput" x="69" y="239" height="28" width="237" align="left" margin="5,5,," color="0xc9cdcc" size="12" font="Microsoft YaHei"/>
			  <RadioButton skin="png.flat.radio" x="202" y="125" label="否" labelFont="Microsoft YaHei" labelColors="0x333333,0x333333,0x333333,0x333333"/>
			  <ComboBox labels="label1,label2" skin="png.flat.combobox" x="69" y="159"/>
			  <TextInput text="冲洗版相片编码" skin="png.flat.textinput" x="89" y="356" width="217" height="28" margin="5,5,," color="0xc9cdcc"/>
			  <TextInput text="电子版相片编码" skin="png.flat.textinput" x="89" y="309" width="217" height="28" margin="5,5,," color="0xc9cdcc"/>
			  <Button label="确认" skin="png.flat.btn_enter" x="258" y="413" labelColors="0xffffff" labelFont="Microsoft YaHei" labelSize="14" buttonMode="true"/>
			  <Button skin="png.flat.btn_add" x="313" y="357" buttonMode="true"/>
			  <Button skin="png.flat.btn_add" x="313" y="310" buttonMode="true"/>
			</View>;
		public function drawerUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}