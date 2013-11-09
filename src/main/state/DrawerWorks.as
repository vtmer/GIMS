package main.state
{
	
	/**
	 * ...
	 * @author shengbanx
	 */
	class DrawerWorks
	{
		var editState:State;
		var showState:State;
		//当前状态变量
		var state:State;
		
		public function DrawerWorks()
		{
			editState = new EditState(this);
			showState = new ShowState(this);
			state = editState;
		
		}
		
		public function editInfo():void
		{
			state.editInfo();
		}
		
		public function showInfo():void
		{
			state.showInfo();
		}
		
		public function setState(state:State):void
		{
			this.state = state;
		}
		
		public function getState():State
		{
			return state;
		}
		
		public function getEditState():State
		{
			return this.editState;
		}
		
		public function getShowState():State
		{
			return this.showState;
		}
	
	}

}