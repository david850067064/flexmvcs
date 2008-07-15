package flexmvcs.patterns.mediator {
	import flash.display.DisplayObject;
	
	import org.puremvc.interfaces.IFacade;
	import org.puremvc.patterns.mediator.Mediator;

	public class FlexMediator extends Mediator {

		override public function setFacade(facade:IFacade):void {
			super.setFacade(facade);
			initialize();
		}
		
		// Template Method
		protected function initialize():void {
		}

		[Bindable]
		public function set view(view:Object):void {
			viewComponent = view;
		}
		
		public function get view():Object {
			return viewComponent;
		}

	}
}