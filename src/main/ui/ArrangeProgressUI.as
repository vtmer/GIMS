/**Created by the Morn,do not modify.*/
package main.ui {
	import morn.core.components.*;
	public class ArrangeProgressUI extends Dialog {
		protected var uiXML:XML =
			<Dialog/>;
		public function ArrangeProgressUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}