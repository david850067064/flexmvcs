package flexmvcs.patterns.facade {
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	
	import flexmvcs.interfaces.IFlexFacade;
	import flexmvcs.interfaces.IService;
	import flexmvcs.interfaces.IServiceClient;
	import flexmvcs.patterns.command.CommandContainer;
	
	import org.puremvc.interfaces.ICommand;
	import org.puremvc.interfaces.IFacadeClient;
	import org.puremvc.interfaces.IMediator;
	import org.puremvc.interfaces.IProxy;
	import org.puremvc.patterns.facade.Facade;
	
	public class FlexFacade extends Facade implements IFlexFacade {		

		[Bindable]
		protected var context:Object;
		protected var _services:Dictionary;

		private var pendingServices:Array;
		private var pendingProxies:Array;
		private var pendingCommands:Array;
		private var pendingMediators:Array;

		public function FlexFacade() {
			_services = new Dictionary();
		}
		
		// Called from container onCreationComplete
		public function initialize(context:Object=null):void {
			this.context = context;
			registerPendingServices();
			registerPendingProxies();
			registerPendingCommands();
			registerPendingMediators();
		}
		
		protected function set services(services:Array):void {
			pendingServices = services;
		}
		
		protected function set proxies(proxies:Array):void {
			pendingProxies = proxies;
		}
		
		protected function set commands(containers:Array):void {
			pendingCommands = containers;
		}
		
		protected function set mediators(mediators:Array):void {
			pendingMediators = mediators;
		}
		
		protected function registerPendingProxies():void {
			var proxy:IProxy;
			for each(proxy in pendingProxies) {
				registerProxy(proxy);
			}
			pendingProxies = [];
		}
		
		protected function registerPendingServices():void {
			var service:IService;
			for each(service in pendingServices) {
				registerService(service);
			}
			pendingServices = [];
		}
		
		protected function registerPendingCommands():void {
			var container:CommandContainer;
			for each(container in pendingCommands) {
				registerCommand(container.notificationName, container.commandReference);
			}
			pendingCommands = [];
		}
		
		protected function registerPendingMediators():void {
			var mediator:IMediator;
			for each(mediator in pendingMediators) {
				registerMediator(mediator);
			}
			pendingMediators = [];
		}
		
		override public function retrieveMediator(mediatorName:String):IMediator {
			var mediator:IMediator = super.retrieveMediator(mediatorName);
			if(!mediator) {
				throw new IllegalOperationError("FlexFacade.retrieveMediator called with unknown mediator name: " + mediatorName);
			}
			return mediator;
		}

		override public function retrieveProxy(proxyName:String):IProxy {
			var proxy:IProxy = 	super.retrieveProxy(proxyName);
			if(!proxy) {
				throw new IllegalOperationError("FlexFacade.retrieveProxy called with unknown proxy name: " + proxyName);
			}
			return proxy;
		}
		
		override public function registerProxy(proxy:IProxy):void	{
			var serviceClient:IServiceClient = proxy as IServiceClient;
			if(serviceClient) {
				var service:IService = retrieveService(serviceClient.serviceId);
				if(service) {
					serviceClient.service = service;
				}
			}
			super.registerProxy(proxy);
		}

		public function registerService(service:IService):void {
			var id:String = (service.id || service.serviceId);
			if(id == null) {
				throw new IllegalOperationError("FlexFacade.registerService called with service that has no id field");
			}
			if(_services[id] && _services[id] !== service) {
				throw new IllegalOperationError("FlexFacade.registerService called with duplicate service name: " + id);
			}
			if(service is IFacadeClient) {
				IFacadeClient(service).setFacade(this);
			}
			_services[id] = service;
		}
		
		public function retrieveService(id:String):IService {
			if(!_services[id]) {
				throw new IllegalOperationError("FlexFacade.retrieveService called with unknown service.id: " + id);
			}
			return _services[id] as IService;
		}
		
		public function removeService(id:String):void {
			delete _services[id];
		}
	}
}
