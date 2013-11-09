package main.state 
{
	/**
	 * ...
	 * @author shengbanx
	 */
	class ShowState implements State
	{
		var drawerWorks:DrawerWorks;
		public function ShowState(drawerWorks:DrawerWorks) 
		{
			this.drawerWorks = DrawerWorks;
		}
		
		public function editInfo():void {
			drawerWorks.setState(drawerWorks.getShowState());
		}
		
		public function showInfo():void {
			
		}
	}

}