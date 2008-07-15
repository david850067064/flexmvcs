package flexmvcs.patterns.facade {

	import flexmvcs.patterns.mediator.FlexMediator;
	
	import mx.binding.utils.BindingUtils;
	
	public class StubMediator extends FlexMediator {
		
		override protected function initialize():void {
			BindingUtils.bindProperty(view, "text", proxy, "description");
		}
		
		private function get proxy():StubProxy {
			return getFacade().retrieveProxy(StubConstants.STUB_PROXY) as StubProxy;
		}
	}
}