/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	import main.ui.listUI;
	public class Page1UI extends View {
		public var btn_new:Button;
		public var btn_arrange:Button;
		public var btn_send:Button;
		public var btn_io:Button;
		public var btn_close:Button;
		public var btn_max:Button;
		public var btn_min:Button;
		public var btn_restore:Button;
		public var input_name:TextInput;
		protected var uiXML:XML =
			<View sceneAlpha="0" alpha="1" visible="true" left="0" top="0" bottom="0" right="0">
			  <Container left="0" right="0" top="0" bottom="0">
			    <Image url="png.flat.bg" x="0" y="0" sizeGrid="186,104,26,26"/>
			  </Container>
			  <Image url="png.flat.logo" x="33" y="36"/>
			  <Image url="png.flat.icon1" x="86" y="136"/>
			  <Image url="png.flat.icon2" x="84" y="240"/>
			  <Image url="png.flat.icon3" x="85" y="352"/>
			  <Image url="png.flat.icon4" x="84" y="460"/>
			  <Image url="png.flat.icon5" x="214" y="48"/>
			  <Image url="png.flat.text_home" x="248" y="42"/>
			  <Image url="png.flat.text_other" x="406" y="42"/>
			  <Image url="png.flat.icon6" x="367" y="48"/>
			  <Button label="新建" skin="png.flat.btn_metro" x="12" y="104" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," buttonMode="true" var="btn_new" visible="true"/>
			  <Button label="整理相片" skin="png.flat.btn_metro" x="12" y="212" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_arrange" buttonMode="true"/>
			  <Button label="一键发送" skin="png.flat.btn_metro" x="12" y="320" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_send" buttonMode="true"/>
			  <Button label="导入/导出" skin="png.flat.btn_metro" x="12" y="428" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_io" buttonMode="true"/>
			  <Button skin="png.flat.btn_contact" x="76" y="724" buttonMode="true"/>
			  <Button skin="png.flat.btn_question" x="104" y="724" buttonMode="true"/>
			  <Container right="20" top="12">
			    <Button skin="png.flat.btn_close" x="76" buttonMode="true" var="btn_close" toolTip="关闭"/>
			    <Button skin="png.flat.btn_max" x="38" buttonMode="true" var="btn_max" toolTip="最大化"/>
			    <Button label="" skin="png.flat.btn_min" buttonMode="true" width="stageHeight-" var="btn_min" toolTip="最小化"/>
			    <Button skin="png.flat.btn_restore" x="38" visible="false" buttonMode="true" var="btn_restore" y="0" toolTip="还原"/>
			  </Container>
			  <Tab skin="png.flat.tab_metro" x="186" y="12" labelColors="0xffffff" labelFont="Microsoft YaHei" width="174" height="93" buttonMode="true" direction="horizontal"/>
			  <Tab skin="png.flat.tab_metro" x="360" y="12" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," width="174" height="93" buttonMode="true"/>
			  <Image url="png.flat.search_bar" x="415" y="146"/>
			  <Image url="png.flat.search" x="418.3" y="150"/>
			  <Image url="png.flat.search_close" x="742" y="157"/>
			  <List x="218" y="245" repeatX="1" repeatY="10" spaceX="0" spaceY="1">
			    <list name="render" runtime="main.ui.listUI"/>
			  </List>
			  <Container x="674" y="43" name="drawer">
			    <Image url="png.flat.information"/>
			    <Label text="新建" x="27" y="29" size="24" font="Microsoft YaHei" color="0x333333"/>
			    <Label text="姓名：&lt;br>是否大学城校区：&lt;br>宿舍：&lt;br>联系电话：&lt;br>邮箱：" x="27" y="83" multiline="true" wordWrap="false" width="108" height="189" isHtml="true" leading="23" size="12" font="Microsoft YaHei" color="0x333333"/>
			    <Label text="........................................................................................................." x="25" y="279" color="0xc9cdcc"/>
			    <Label text="相片编码：" x="27" y="313" color="0x333333" font="Microsoft YaHei" size="12"/>
			    <Label text="_________________________________________" x="24" y="54" color="0xc9cdcc"/>
			    <TextInput skin="png.flat.textinput" x="69" y="79" height="28" width="237" align="left" margin="5,5,," color="0xc9cdcc" size="12" font="Microsoft YaHei" selectable="true" text="请输入姓名" var="input_name"/>
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
			  </Container>
			</View>;
		public function Page1UI(){}
		override protected function createChildren():void {
			viewClassMap["main.ui.listUI"] = listUI;
			createView(uiXML);
		}
	}
}