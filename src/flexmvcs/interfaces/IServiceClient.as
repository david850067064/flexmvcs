package flexmvcs.interfaces {

	public interface IServiceClient {
		function set service(service:IService):void;
		function get service():IService;
		function get serviceId():String;
	}
}
