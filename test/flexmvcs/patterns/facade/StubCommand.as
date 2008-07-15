package flexmvcs.patterns.facade {

	import org.puremvc.patterns.command.SimpleCommand;
	import org.puremvc.interfaces.INotification;
	
	public class StubCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			proxy.description = notification.getBody() as String;
		}
		
		private function get proxy():StubProxy {
			return facade.retrieveProxy(StubConstants.STUB_PROXY) as StubProxy;
		}
	}
}