package flexmvcs.interfaces {
	import flash.events.IEventDispatcher;
	
	public interface IService extends IEventDispatcher {
		function set serviceId(serviceId:String):void;
		function get serviceId():String;
		function set url(url:String):void;
		function get url():String;		
		function set id(id:String):void;
		function get id():String;
	}
}