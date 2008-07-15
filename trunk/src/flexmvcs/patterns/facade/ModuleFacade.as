package flexmvcs.patterns.facade {

	import flash.errors.IllegalOperationError;
	
	import flexmvcs.interfaces.IFlexFacade;
	import flexmvcs.interfaces.IService;
	
	import org.puremvc.interfaces.IFacade;
	import org.puremvc.interfaces.IFacadeClient;
	import org.puremvc.interfaces.IMediator;
	import org.puremvc.interfaces.INotification;
	import org.puremvc.interfaces.IProxy;

	public class ModuleFacade extends FlexFacade implements IFlexFacade, IFacade, IFacadeClient {
		private var facade:IFlexFacade;
		
		override public function retrieveService(id:String):IService {
			return IFlexFacade(getFacade()).retrieveService(id);
		}
		
		override public function registerService(service:IService):void {
			IFlexFacade(getFacade()).registerService(service);
		}
		
		override public function removeService(id:String):void {
			IFlexFacade(getFacade()).removeService(id);
		}
		
		override public function removeProxy(proxyName:String):void {
			getFacade().removeProxy(proxyName);
		}
		
		override public function registerProxy(proxy:IProxy):void {
			getFacade().registerProxy(proxy);
		}
		
		override public function removeMediator(mediatorName:String):void {
			getFacade().removeMediator(mediatorName);
		}
		
		override public function notifyObservers(note:INotification):void {
			getFacade().notifyObservers(note);
		}
		
		override public function retrieveMediator(mediatorName:String):IMediator {
			return getFacade().retrieveMediator(mediatorName);
		}
		
		override public function registerMediator(mediator:IMediator):void {
			getFacade().registerMediator(mediator);
		}
		
		override public function registerCommand(noteName:String, commandClassRef:Class):void {
			getFacade().registerCommand(noteName, commandClassRef);
		}
		
		override public function retrieveProxy(proxyName:String):IProxy {
			return getFacade().retrieveProxy(proxyName);
		}
		
		public function getFacade():IFacade {
			if(!facade || !(IFlexFacade(facade))) throw new IllegalOperationError("ModuleFacade needs a base Facade to work properly");
			return facade;
		}
		
		public function setFacade(facade:IFacade):void {
			this.facade = facade as IFlexFacade;
		}
	}
}