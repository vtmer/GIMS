package 
{
	import flash.display.Sprite;
	import main.view.Page1;
	import morn.core.handlers.Handler;
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			//初始化Morn
			App.init(this);
			//加载用到的资源
			App.loader.loadAssets(["assets/flat.swf"], new Handler(loadComplete));
		}
			private function loadComplete():void {
			addChild(new Page1());
		}
		
	}
	
}