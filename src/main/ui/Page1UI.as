/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	import main.ui.listUI;
	import main.view.MyDrawer;
	public class Page1UI extends View {
		public var btn_new:Button;
		public var btn_arrange:Button;
		public var btn_send:Button;
		public var btn_io:Button;
		public var btn_close:Button;
		public var btn_max:Button;
		public var btn_min:Button;
		public var btn_restore:Button;
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
			  <drawer x="674" y="39" runtime="main.view.MyDrawer"/>
			</View>;
		public function Page1UI(){}
		override protected function createChildren():void {
			viewClassMap["main.ui.listUI"] = listUI;
			viewClassMap["main.view.MyDrawer"] = MyDrawer;
			createView(uiXML);
		}
	}
}