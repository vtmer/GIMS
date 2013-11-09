package main.state
{
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public interface State
	{
		function editInfo():void;
		function showInfo():void;
	}
	
	//编辑状态
	class EditState implements State
	{
		public function editInfo():void
		{
		
		}
		
		public function showInfo():void
		{
		
		}
	}
	
	//详情状态
	class ShowState implements State
	{
		public function editInfo():void
		{
		
		}
		
		public function showInfo():void
		{
		
		}
	}
}