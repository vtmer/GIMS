package main.state 
{
	/**
	 * ...
	 * @author shengbanx
	 */
	class EditState implements State
	{
		var drawerWorks:DrawerWorks;
		public function EditState(drawerWorks:DrawerWorks) {
			trace("--编辑状态--");
			this.drawerWorks = drawerWorks;
		}
		public function showInfo():void
		{
			drawerWorks.setState(drawerWorks.getShowState());
			
		}
		
		public function editInfo():void {
			trace("--已处于编辑状态"--);
		}
	}

}