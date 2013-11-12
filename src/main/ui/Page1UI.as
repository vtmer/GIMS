/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	import main.ui.ProgressUI;
	public class Page1UI extends View {
		public var bg:Image;
		public var block_remove:Container;
		public var tab_isTown:Tab;
		public var input_search:TextInput;
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
		public var scrollBarView:VScrollBar;
		public var block_mask:Image;
		public var drawer:Container;
		public var btn_block:Image;
		public var block_blank:Image;
		public var box_new:Box;
		public var label_title:Label;
		public var input_name:TextInput;
		public var input_phone:TextInput;
		public var input_dorNum:TextInput;
		public var input_email:TextInput;
		public var input_dor:ComboBox;
		public var input_printPhotoId:TextInput;
		public var input_photoId:TextInput;
		public var btn_enter:Button;
		public var input_isTown:RadioGroup;
		public var box_info:Box;
		public var label_name:Label;
		public var label_info:Label;
		public var tab_photoType:Tab;
		public var btn_infoEdit:Button;
		public var btn_infoSend:Button;
		public var btn_infoDelete:Button;
		public var photoView:Image;
		public var tab_circle:Tab;
		public var block_resize:Container;
		public var dialog_progress:ProgressUI;
		public var btn_allSelect:CheckBox;
		public var sort_down:Image;
		public var sort_up:Image;
		protected var uiXML:XML =
			<View sceneAlpha="0" visible="true" disabled="false">
			  <Image url="png.flat.bg" x="0" y="0" sizeGrid="186,104,26,26" var="bg"/>
			  <Container width="900" height="20" left="12" top="12" alpha="0" x="12" y="12" var="block_remove">
			    <Image url="png.flat.blank" width="900" height="24" x="0" y="0"/>
			  </Container>
			  <Tab labels="," skin="png.flat.tab_navigation" x="186" y="12" buttonMode="true" var="tab_isTown"/>
			  <Label text="个人信息" x="214" y="146" font="Microsoft YaHei" size="18" color="0x333333"/>
			  <Image url="png.flat.search_bar" x="415" y="146"/>
			  <Image url="png.flat.search" x="418.3" y="150"/>
			  <Image url="png.flat.search_close" x="742" y="157"/>
			  <TextInput x="446" y="149" width="282" height="22" align="left" font="Microsoft YaHei" size="12" var="input_search"/>
			  <Button skin="png.flat.btn_metro" x="12" y="104" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," buttonMode="true" var="btn_new" visible="true"/>
			  <Button skin="png.flat.btn_metro" x="12" y="212" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_arrange" buttonMode="true"/>
			  <Button skin="png.flat.btn_metro" x="12" y="320" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_send" buttonMode="true" disabled="true"/>
			  <Button skin="png.flat.btn_metro" x="12" y="428" labelColors="0xffffff" labelSize="14" labelFont="Microsoft YaHei" labelMargin=",18,," var="btn_io" buttonMode="true" disabled="true"/>
			  <Button skin="png.flat.btn_contact" x="76" y="724" buttonMode="true"/>
			  <Button skin="png.flat.btn_question" x="104" y="724" buttonMode="true"/>
			  <Container right="20" top="12" var="windows_btn">
			    <Button skin="png.flat.btn_close" x="76" buttonMode="true" var="btn_close" toolTip="关闭"/>
			    <Button skin="png.flat.btn_max" x="38" buttonMode="true" var="btn_max" toolTip="最大化"/>
			    <Button label="" skin="png.flat.btn_min" buttonMode="true" width="stageHeight-" var="btn_min" toolTip="最小化"/>
			    <Button skin="png.flat.btn_restore" x="38" visible="false" buttonMode="true" var="btn_restore" y="0" toolTip="还原"/>
			  </Container>
			  <Image url="png.flat.logo" x="33" y="36"/>
			  <Image url="png.flat.icon5" x="214" y="48" mouseEnabled="false"/>
			  <Image url="png.flat.text_home" x="248" y="42" mouseEnabled="false"/>
			  <Image url="png.flat.text_other" x="418" y="42" mouseEnabled="false"/>
			  <Image url="png.flat.icon6" x="379" y="48" mouseEnabled="false"/>
			  <Image url="png.flat.table" x="217" y="209"/>
			  <Box x="66" y="136" mouseChildren="false" mouseEnabled="false">
			    <Image url="png.flat.icon1" x="20" mouseEnabled="false"/>
			    <Image url="png.flat.icon2" x="18" y="104" mouseEnabled="false"/>
			    <Image url="png.flat.icon3" x="19" y="216" mouseEnabled="false"/>
			    <Image url="png.flat.icon4" x="18" y="324" mouseEnabled="false"/>
			    <Label text="新建" x="17" y="28" font="Microsoft YaHei" color="0xffffff" size="14"/>
			    <Label text="整理相片" x="3" y="136" font="Microsoft YaHei" color="0xffffff" size="14"/>
			    <Label text="一键发送" x="3" y="244" font="Microsoft YaHei" color="0xffffff" size="14"/>
			    <Label text="导入/导出" y="352" font="Microsoft YaHei" color="0xffffff" size="14"/>
			  </Box>
			  <List x="231" y="248" var="list" repeatY="10" repeatX="1">
			    <Box name="render" var="render" width="777" height="48" buttonMode="false">
			      <Label x="106" y="0" width="100" height="48" align="left" color="0x666666" font="Microsoft YaHei" size="12" bold="false" isHtml="false" margin="13,14,," name="userName"/>
			      <Label x="206" y="0" width="141" margin="13,14,," size="12" color="0x666666" font="Microsoft YaHei" align="left" name="userDor" height="49"/>
			      <Label x="346" y="0" width="201" height="48" margin="13,14,," color="0x666666" align="left" font="Microsoft YaHei" size="12" name="userPhone"/>
			      <Label x="544" width="231" height="48" size="12" margin="13,14,," font="Microsoft YaHei" color="0x666666" y="-2" name="userEmail"/>
			      <CheckBox skin="png.flat.checkbox" y="18" buttonMode="true"/>
			      <Label x="68" width="37" height="48" margin=",14,," color="0x666666" size="12" font="Microsoft YaHei" align="center" name="userId"/>
			      <Clip url="png.flat.clip_condition" x="39" y="20" frame="1" clipWidth="14" clipX="2" name="userIsFinish"/>
			      <Clip url="png.flat.clip_selectBox" x="25" y="0" width="751" height="48" name="selectBox" clipX="1" clipY="2" mouseChildren="true" mouseEnabled="true" buttonMode="true"/>
			    </Box>
			    <VScrollBar skin="png.flat.vscroll" x="771" width="6" height="481" name="scrollBar" var="scrollBarView" visible="false" alpha="0"/>
			  </List>
			  <Image url="png.flat.mask" x="216" y="705" width="793" height="24" var="block_mask" visible="false"/>
			  <Container x="186" y="43" var="drawer" visible="false" disabled="false">
			    <Image url="png.flat.information" visible="true" x="488"/>
			    <Label text="_____________________________________________" x="501" y="51" color="0xc9cdcc"/>
			    <Label text=">>" x="497" y="350" bold="true" color="0x999999" font="SimSun" size="12" width="19" height="19"/>
			    <Image url="png.flat.blank" x="493" y="6" width="22" height="716" visible="true" var="btn_block" buttonMode="true" alpha="0"/>
			    <Image url="png.flat.blank" y="63" width="231" height="102" alpha="0" var="block_blank"/>
			    <Box x="513" y="29" var="box_new">
			      <Label text="新建" x="2" size="24" font="Microsoft YaHei" color="0x333333" var="label_title"/>
			      <Label text="姓名：&lt;br>是否大学城校区：&lt;br>宿舍：&lt;br>联系电话：&lt;br>邮箱：" x="2" y="54" multiline="true" wordWrap="false" width="108" height="189" isHtml="true" leading="23" size="12" font="Microsoft YaHei" color="0x333333"/>
			      <Label text="...................................................................................." y="250" color="0xc9cdcc"/>
			      <Label text="相片编码：" x="2" y="284" color="0x333333" font="Microsoft YaHei" size="12"/>
			      <TextInput skin="png.flat.textinput" x="44" y="50" height="28" width="237" align="left" margin="5,5,," color="0xc9cdcc" size="12" font="Microsoft YaHei" selectable="true" text="请输入姓名" var="input_name"/>
			      <TextInput text="请输入长号或者短号" skin="png.flat.textinput" x="67" y="170" width="214" height="28" margin="5,5,," color="0xc9cdcc" font="Microsoft YaHei" size="12" selectable="true" align="left" var="input_phone"/>
			      <TextInput skin="png.flat.textinput" x="142" y="130" width="139" height="28" color="0xc9cdcc" margin="5,5,," font="Microsoft YaHei" size="12" selectable="true" align="left" text="宿舍号" var="input_dorNum"/>
			      <TextInput text="请输入Email" skin="png.flat.textinput" x="44" y="210" height="28" width="237" align="left" margin="5,5,," color="0xc9cdcc" size="12" font="Microsoft YaHei" selectable="true" var="input_email"/>
			      <ComboBox labels="东十二,东十三,西五,西六" skin="png.flat.combobox" x="44" y="130" buttonMode="true" labelColors="0x333333" var="input_dor"/>
			      <TextInput text="冲洗版相片编码" skin="png.flat.textinput" x="64" y="327" width="217" height="28" margin="5,5,," color="0xc9cdcc" selectable="true" var="input_printPhotoId"/>
			      <TextInput text="电子版相片编码" skin="png.flat.textinput" x="64" y="280" width="217" height="28" margin="5,5,," color="0xc9cdcc" selectable="true" var="input_photoId"/>
			      <Button label="确认" skin="png.flat.btn_enter" x="200" y="384" labelColors="0xffffff" labelFont="Microsoft YaHei" labelSize="14" buttonMode="true" var="btn_enter"/>
			      <RadioGroup labels="是 ,否" skin="png.flat.radiogroup" x="112" y="96" labelColors="0x333333" labelSize="12" labelMargin="5,,10," buttonMode="true" selectedValue="0,1" selectedIndex="0" var="input_isTown"/>
			    </Box>
			    <Box x="515" y="30" var="box_info" visible="false" disabled="false">
			      <Label text="详细信息" font="Microsoft YaHei" size="24" color="0x333333" selectable="true"/>
			      <Label text="01" x="11" y="53" size="16" font="Microsoft YaHei" color="0x333333" selectable="true" var="label_name" width="154" height="24"/>
			      <Label x="11" y="91" width="282" height="230" font="Microsoft YaHei" size="12" color="0x333333" selectable="true" var="label_info" wordWrap="true" multiline="true" leading="8"/>
			      <Label text="................................................................................................" x="14" y="314" color="0xcccccc"/>
			      <Label text="电子版" x="102" y="353" font="Microsoft YaHei" size="13" color="0x333333"/>
			      <Label text="冲洗版" x="154" y="353" font="Microsoft YaHei" size="13" color="0x333333"/>
			      <Tab labels="," skin="png.flat.tab_selete" x="97" y="355" var="tab_photoType" buttonMode="true"/>
			      <Button skin="png.flat.btn_edit" x="268" y="83" var="btn_infoEdit" buttonMode="true"/>
			      <Button skin="png.flat.btn_send" x="268" y="117" var="btn_infoSend" buttonMode="true"/>
			      <Button skin="png.flat.btn_delete" x="268" y="151" var="btn_infoDelete" buttonMode="true"/>
			      <Image x="34" y="405" width="246.6" height="185" var="photoView"/>
			      <Container x="11" y="614" width="289" height="14" centerX="0">
			        <Container centerX="0">
			          <Tab labels=",," skin="png.flat.tab_circle" direction="horizontal" buttonMode="true" labelBold="false" selectedIndex="0" var="tab_circle" y="0"/>
			        </Container>
			      </Container>
			    </Box>
			  </Container>
			  <Container var="block_resize" right="12" bottom="12" width="12" height="12" alpha="0">
			    <Image url="png.flat.blank" x="0" y="0" width="12" height="12"/>
			  </Container>
			  <Progress x="295" y="305" var="dialog_progress" visible="false" runtime="main.ui.ProgressUI"/>
			  <Button skin="png.flat.btn_sort" x="433" y="210" buttonMode="true"/>
			  <CheckBox skin="png.flat.checkbox" x="230" y="222" buttonMode="true" var="btn_allSelect"/>
			  <Image url="png.flat.sort_down" x="558" y="233" var="sort_down" visible="false"/>
			  <Image url="png.flat.sort_up" x="558" y="226" width="8" height="4" var="sort_up" visible="false"/>
			</View>;
		public function Page1UI(){}
		override protected function createChildren():void {
			viewClassMap["main.ui.ProgressUI"] = ProgressUI;
			createView(uiXML);
		}
	}
}