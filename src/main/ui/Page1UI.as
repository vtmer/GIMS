/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class Page1UI extends View {
		public var bg:Image;
		public var block_remove:Container;
		public var btn_new:Button;
		public var btn_arrange:Button;
		public var btn_send:Button;
		public var btn_io:Button;
		public var windows_btn:Container;
		public var btn_close:Button;
		public var btn_max:Button;
		public var btn_min:Button;
		public var btn_restore:Button;
		public var list:List;
		public var render:Box;
		public var drawer:Container;
		public var input_name:TextInput;
		public var input_phone:TextInput;
		public var input_dorNum:TextInput;
		public var input_email:TextInput;
		public var input_dor:ComboBox;
		public var input_printPhotoId:TextInput;
		public var input_photoId:TextInput;
		public var btn_Enter:Button;
		public var btn_addPrintPhoto:Button;
		public var btn_addPhoto:Button;
		public var input_isTown:RadioGroup;
		public var btn_block:Image;
		public var block_resize:Container;
		protected var uiXML:XML =
			<View sceneAlpha="0" visible="true">
			  <Image url="png.flat.bg" x="0" y="0" sizeGrid="186,104,26,26" var="bg"/>
			  <Image url="png.flat.logo" x="33" y="36"/>
			  <Image url="png.flat.icon1" x="86" y="136"/>
			  <Image url="png.flat.icon2" x="84" y="240"/>
			  <Image url="png.flat.icon3" x="85" y="352"/>
			  <Image url="png.flat.icon4" x="84" y="460"/>
			  <Image url="png.flat.icon5" x="214" y="48"/>
			  <Image url="png.flat.text_home" x="248" y="42"/>
			  <Image url="png.flat.text_other" x="406" y="42"/>
			  <Image url="png.flat.icon6" x="367" y="48"/>
			  <Image url="png.flat.table" x="217" y="209"/>
			  <Container width="900" height="20" left="12" top="12" alpha="0" x="12" y="12" var="block_remove">
			    <Image url="png.flat.blank" width="900" height="24" x="0" y="0"/>
			  </Container>
			  <Tab skin="png.flat.tab_metro" x="186" y="12" labelColors="0xffffff" labelFont="Microsoft YaHei" width="174" height="93" buttonMode="true" direction="horizontal"/>
			  <Tab skin="png.flat.tab_metro" x="360" y="12" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," width="174" height="93" buttonMode="true"/>
			  <Image url="png.flat.search_bar" x="415" y="146"/>
			  <Image url="png.flat.search" x="418.3" y="150"/>
			  <Image url="png.flat.search_close" x="742" y="157"/>
			  <Button label="新建" skin="png.flat.btn_metro" x="12" y="104" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," buttonMode="true" var="btn_new" visible="true"/>
			  <Button label="整理相片" skin="png.flat.btn_metro" x="12" y="212" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_arrange" buttonMode="true"/>
			  <Button label="一键发送" skin="png.flat.btn_metro" x="12" y="320" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_send" buttonMode="true"/>
			  <Button label="导入/导出" skin="png.flat.btn_metro" x="12" y="428" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_io" buttonMode="true"/>
			  <Button skin="png.flat.btn_contact" x="76" y="724" buttonMode="true"/>
			  <Button skin="png.flat.btn_question" x="104" y="724" buttonMode="true"/>
			  <Container right="20" top="12" var="windows_btn">
			    <Button skin="png.flat.btn_close" x="76" buttonMode="true" var="btn_close" toolTip="关闭"/>
			    <Button skin="png.flat.btn_max" x="38" buttonMode="true" var="btn_max" toolTip="最大化"/>
			    <Button label="" skin="png.flat.btn_min" buttonMode="true" width="stageHeight-" var="btn_min" toolTip="最小化"/>
			    <Button skin="png.flat.btn_restore" x="38" visible="false" buttonMode="true" var="btn_restore" y="0" toolTip="还原"/>
			  </Container>
			  <List x="231" y="248" var="list" repeatY="10" repeatX="1">
			    <Box name="render" var="render" width="693" height="48" x="0" y="0">
			      <Label text="陈丽婷" x="106" y="0" width="100" height="48" align="left" color="0x666666" font="Microsoft YaHei" size="14" bold="false" isHtml="false" margin="13,14,," name="userName"/>
			      <Label text="东区12-608" x="206" y="0" width="141" height="47" margin="13,14,," size="14" color="0x666666" font="Microsoft YaHei" align="left" name="userDor"/>
			      <Label text="13560478360 " x="346" y="0" width="201" height="48" margin="13,14,," color="0x666666" align="left" font="Microsoft YaHei" size="14" name="userPhone"/>
			      <Label text="armchanel@msn.com" x="544" width="231" height="48" size="14" margin="13,14,," font="Microsoft YaHei" color="0x666666" y="-2" name="userEmail"/>
			      <CheckBox skin="png.flat.checkbox" y="18" buttonMode="true"/>
			      <Label text="01" x="68" width="37" height="48" margin=",14,," color="0x666666" size="14" font="Microsoft YaHei" align="center" name="userId"/>
			      <Clip url="png.flat.clip_condition" x="39" y="20" frame="0" clipWidth="14" clipX="2" name="userIsTown"/>
			    </Box>
			    <VScrollBar skin="png.flat.vscroll" x="759" name="scrollBar" width="17" height="479" y="2"/>
			  </List>
			  <Container x="674" y="43" var="drawer" visible="false">
			    <Image url="png.flat.information" visible="true"/>
			    <Label text="新建" x="27" y="29" size="24" font="Microsoft YaHei" color="0x333333"/>
			    <Label text="姓名：&lt;br>是否大学城校区：&lt;br>宿舍：&lt;br>联系电话：&lt;br>邮箱：" x="27" y="83" multiline="true" wordWrap="false" width="108" height="189" isHtml="true" leading="23" size="12" font="Microsoft YaHei" color="0x333333"/>
			    <Label text="........................................................................................................." x="25" y="279" color="0xc9cdcc"/>
			    <Label text="相片编码：" x="27" y="313" color="0x333333" font="Microsoft YaHei" size="12"/>
			    <Label text="_________________________________________" x="24" y="54" color="0xc9cdcc"/>
			    <TextInput skin="png.flat.textinput" x="69" y="79" height="28" width="237" align="left" margin="5,5,," color="0xc9cdcc" size="12" font="Microsoft YaHei" selectable="true" text="请输入姓名" var="input_name"/>
			    <TextInput text="请输入长号或者短号" skin="png.flat.textinput" x="92" y="199" width="214" height="28" margin="5,5,," color="0xc9cdcc" font="Microsoft YaHei" size="12" var="input_phone" selectable="true" align="left"/>
			    <TextInput skin="png.flat.textinput" x="167" y="159" width="139" height="28" color="0xc9cdcc" margin="5,5,," font="Microsoft YaHei" size="12" var="input_dorNum" selectable="true" align="left" text="宿舍号"/>
			    <TextInput text="请输入Email" skin="png.flat.textinput" x="69" y="239" height="28" width="237" align="left" margin="5,5,," color="0xc9cdcc" size="12" font="Microsoft YaHei" var="input_email" selectable="true"/>
			    <ComboBox labels="东十二,东十三,西五,西六" skin="png.flat.combobox" x="69" y="159" buttonMode="true" labelColors="0x333333" var="input_dor"/>
			    <TextInput text="冲洗版相片编码" skin="png.flat.textinput" x="89" y="356" width="217" height="28" margin="5,5,," color="0xc9cdcc" var="input_printPhotoId" selectable="true"/>
			    <TextInput text="电子版相片编码" skin="png.flat.textinput" x="89" y="309" width="217" height="28" margin="5,5,," color="0xc9cdcc" var="input_photoId" selectable="true"/>
			    <Button label="确认" skin="png.flat.btn_enter" x="258" y="413" labelColors="0xffffff" labelFont="Microsoft YaHei" labelSize="14" buttonMode="true" var="btn_Enter"/>
			    <Button skin="png.flat.btn_add" x="313" y="357" buttonMode="true" var="btn_addPrintPhoto"/>
			    <Button skin="png.flat.btn_add" x="313" y="310" buttonMode="true" var="btn_addPhoto"/>
			    <RadioGroup labels="是 ,否" skin="png.flat.radiogroup" x="137" y="125" labelColors="0x333333" labelSize="12" labelMargin="5,,10," buttonMode="true" selectedValue="0,1" selectedIndex="0" var="input_isTown"/>
			    <Label text=">>" x="9" y="350" bold="true" color="0xc9cdcc" font="SimSun" size="12"/>
			    <Image url="png.flat.blank" x="5" y="6" width="20" height="716" visible="true" var="btn_block" buttonMode="true" alpha="0"/>
			  </Container>
			  <Container var="block_resize" right="12" bottom="12" width="12" height="12" alpha="0">
			    <Image url="png.flat.blank" x="0" y="0" width="12" height="12"/>
			  </Container>
			</View>;
		public function Page1UI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}