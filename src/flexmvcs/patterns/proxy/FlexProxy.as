package flexmvcs.patterns.proxy {
	import org.puremvc.interfaces.IProxy;
	import org.puremvc.interfaces.INotifier;
	import org.puremvc.patterns.observer.Notifier;
	
	[Event(name="propertyChange", type="import flexmvcs.events.PayloadEvent")]
	public class FlexProxy extends Notifier implements IProxy, INotifier {
		
		[Bindable]
		public var proxyName:String;
		
		public function getProxyName():String {
			return proxyName;
		}
	}
}