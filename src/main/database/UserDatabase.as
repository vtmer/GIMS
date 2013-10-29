package main.database 
{
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.net.Responder;
	
	import main.events.DataActionEvent;
	import main.events.DataActionEventKind;
	import main.model.UserInfo;
	
	
	/**
	 * ...
	 * @author shengbanx
	 */
	public class UserDatabase extends EventDispatcher
	{
		protected var dbFile:File=File.applicationStorageDirectory.resolvePath("userInfo.db"); 
		protected var conn:SQLConnection;
		protected var resultSql:Responder;
		protected var insertSql:SQLStatement = new SQLStatement();
		protected var updateSql:SQLStatement = new SQLStatement();
		protected var deleteSql:SQLStatement = new SQLStatement();
		protected var selectSql:SQLStatement = new SQLStatement();
		protected var tableSql:SQLStatement = new SQLStatement();
		protected var insertText:String = "INSERT INTO userinfo(" +
		"'user_name', 'user_isTown', 'user_dormitory', 'user_dorNumber', 'user_phone','user_email','user_photoId','user_printPhoto') VALUES(" +
		":userName, :userIsTown, :userDormitory, :userDorNumber, :userPhone, :userEmail, :userPhotoId, :user_PrintPhotoId)";
		
		protected var updateText:String = "UPDATE userinfo SET " + 
										"user_name=:userName, " + 
										"user_isTown=:userIsTown, " + 
										"user_dormitory=:userDormitory, " + 
										"user_dorNumber=:userDorNumber, " +
										"user_phone=:userPhone, " + 
										"user_email=:userEmail, " + 
										"user_photoId=:userPhotoId " + 
										"user_printPhotoId=:userPrintPhotoId " + 
										"WHERE user_id=:userId";
		
		protected var deleteText:String = "DELETE FROM userinfo WHERE user_id=:userId";
		
		protected var selectText:String = "SELECT " + 
										"user_id as userId, " + 
									    "user_name as userName, " + 
										"user_isTown as userIsTown, " + 
										"user_dormitory as userDormitory, " + 
										"user_dorNumber as userDorNumber, " +
										"user_phone as userPhone, " + 
										"user_email as userEmail, " + 
										"user_photoId as userPhotoId " + 
										"user_printPhotoId as userPrintPhotoId " + 
										"FROM userinfo";
										
		protected var tableText:String = "CREATE TABLE IF NOT EXISTS userinfo(" + 
										"user_id INTEGER PRIMARY KEY AUTOINCREMENT, " + 
										"user_name TEXT, " + 
										"user_isTown INTEGER, " + 
										"user_dormitory TEXT, " + 
										"user_dorNumber  INTEGER, " +
										"user_phone INTEGER, " +
										"user_email TEXT, " +
										"user_photoId TEXT, " +
										"user_printPhotoId TEXT, " +
										"user_info TEXT" + 
										")";
		public function UserDatabase(target:IEventDispatcher=null) 
		{
			super(target);
			initDatabase();
		}
		
		protected function initDatabase():void 
		{
			conn = new SQLConnection;
			conn.addEventListener(SQLEvent.OPEN, onOpenedHandler);
			conn.addEventListener(SQLErrorEvent.ERROR, onErrorHandler);
			
			resultSql = new Responder(onResultHandler, onErrorResultHandler);
			
			insertSql.sqlConnection = conn;
			updateSql.sqlConnection = conn;
			deleteSql.sqlConnection = conn;
			selectSql.sqlConnection = conn;
			tableSql.sqlConnection = conn;
			
			tableSql.addEventListener(SQLEvent.RESULT, onTableCreatedHandler);
			tableSql.addEventListener(SQLErrorEvent.ERROR, onErrorHandler);
			
			insertSql.text = insertText;
			updateSql.text = updateText;
			deleteSql.text = deleteText;
			selectSql.text = selectText;
			tableSql.text = tableText;
			
			selectSql.itemClass = UserInfo;
			
			conn.openAsync(dbFile, dbFile.exists ? SQLMode.UPDATE : SQLMode.CREATE);
		}
		
		//连接已打开
		protected function onOpenedHandler(event:SQLEvent):void {
			conn.removeEventListener(SQLEvent.OPEN, onOpenedHandler);
			conn.removeEventListener(SQLErrorEvent.ERROR, onErrorHandler);
			tableSql.execute();
		}
		
		//创建数据表
		protected function onTableCreatedHandler(event:SQLEvent):void {
			tableSql.removeEventListener(SQLEvent.RESULT, onTableCreatedHandler);
			tableSql.removeEventListener(SQLErrorEvent.ERROR, onErrorHandler);
			select();
		}
		
		//创建连接与数据表时的错误处理
		protected function onErrorHandler(event:SQLErrorEvent):void {
			if (event.target== conn) {
				conn.removeEventListener(SQLEvent.OPEN, onOpenedHandler);
				conn.removeEventListener(SQLErrorEvent.ERROR, onErrorHandler);
			}
			else if (event.target == tableSql) {
				tableSql.removeEventListener (SQLEvent.RESULT, onTableCreatedHandler);
				tableSql.removeEventListener(SQLErrorEvent.ERROR, onErrorHandler);
			}
			
			trace("Error message:", event.error.message);
			trace("Error details:", event.error.details);
		}
		
		//对数据表操作时的错误处理
		protected function onErrorResultHandler(error:SQLError):void
		{
			trace("Error message:", error.message);
			trace("Error details:", error.details);
		}
		
		//对数据表操作后返回结果处理
		protected function onResultHandler(result:SQLResult):void {
			var count:int = result.rowsAffected;
			if (count) {
				select();
				return;
			}
			var resultData:Array = result.data;
			if (resultData) {
				dispatchEvent(new DataActionEvent(DataActionEventKind.KIND_DATA_CHANGE, resultData));
			}
		}
		
		//查询检索数据
		public function select():void {
			selectSql.execute( -1, resultSql);
		}
		
		//插入数据
		public function insert(user:UserInfo):void {
			insertSql.clearParameters();
			insertSql.parameters[":userName"] = user.userName;
			insertSql.parameters[":userIsTown"] = user.userIsTown;
			insertSql.parameters[":userDormitory"] = user.userDormitory;
			insertSql.parameters[":userDorNumber"] = user.userDorNumber;
			insertSql.parameters[":userPhone"] = user.userPhone;
			insertSql.parameters[":userEmail"] = user.userEmail;
			insertSql.parameters[":userPhotoId"] = user.userPhotoId;
			insertSql.parameters[":userPrintPhotoId"] = user.userPrintPhotoId;
			insertSql.execute( -1, resultSql);
		}
		
		//更新数据
		public function update(user:UserInfo):void {
			updateSql.clearParameters();
			updateSql.parameters["userId"] = user.userId;
			updateSql.parameters[":userName"] = user.userName;
			updateSql.parameters[":userIsTown"] = user.userIsTown;
			updateSql.parameters[":userDormitory"] = user.userDormitory;
			updateSql.parameters[":userDorNumber"] = user.userDorNumber;
			updateSql.parameters[":userPhone"] = user.userPhone;
			updateSql.parameters[":userEmail"] = user.userEmail;
			updateSql.parameters[":userPhotoId"] = user.userPhotoId;
			updateSql.parameters[":userPrintPhotoId"] = user.userPrintPhotoId;
			updateSql.execute( -1, resultSql);
		}
		
		//删除数据
		public function remove(user:UserInfo):void {
			deleteSql.clearParameters();
			deleteSql.parameters[":userId"] = user.userId;
			deleteSql.execute( -1, resultSql);
		}
	}

}