package flexmvcs.patterns.facade {

	import flexmvcs.interfaces.IService;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class StubService extends EventDispatcher implements IService {
		protected var _url:String;
		protected var _serviceId:String;
		protected var _id:String;
		
		public function set url(url:String):void {
			_url = url;
		}
		
		public function get url():String {
			return _url;
		}
		
		public function set serviceId(serviceId:String):void {
			_serviceId = serviceId;
		}
		
		public function get serviceId():String {
			return _serviceId;
		}
		
		public function set id(id:String):void {
			_id = id;
		}
		
		public function get id():String {
			return _id;
		}
	}
}