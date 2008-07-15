package flexmvcs.patterns.service {
	import flexmvcs.interfaces.IService;
	import flash.events.EventDispatcher;
	
	public class StubService extends EventDispatcher implements IService {
		private var _serviceId:String;
		private var _url:String;
		private var _id:String;
		
		public function set serviceId(serviceId:String):void {
			_serviceId = serviceId;
		}
		
		public function get serviceId():String {
			return _serviceId;
		}
		
		public function set url(url:String):void {
			_url = url;
		}
		
		public function get url():String {
			return _url;
		}
		
		public function set id(id:String):void {
			_id = id;
		}
		
		public function get id():String {
			return _id;
		}
	}
}
