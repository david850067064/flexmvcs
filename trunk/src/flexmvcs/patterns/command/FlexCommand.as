package flexmvcs.patterns.command {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import flexmvcs.events.PayloadEvent;
	
	import org.puremvc.interfaces.INotification;
	import org.puremvc.patterns.command.SimpleCommand;
	import org.puremvc.patterns.observer.Notification;
	
	[Event(name="complete", type="import flexmvcs.events.PayloadEvent")]
	[Event(name="success", type="import flexmvcs.events.PayloadEvent")]
	[Event(name="failure", type="import flexmvcs.events.PayloadEvent")]
	public class FlexCommand extends SimpleCommand implements IEventDispatcher {
		public static const DEFAULT_TIMEOUT:int = 60000;
		public var timeout:int = DEFAULT_TIMEOUT;

		protected var result:Object;

		private var dispatcher:IEventDispatcher;
		
		public function FlexCommand() {
			dispatcher = new EventDispatcher();
		}

		override public function execute(notification:INotification):void {
			super.execute(notification);
		}
		
		/** 
		 * Call this method when your command has finished successfully
		 * @param success:* Whatever optional payload you want forwarded
		 * to the PayloadEvent that is dispatched
		 */
		protected function dispatchSuccess(success:* = null):void {
			var event:PayloadEvent = new PayloadEvent(PayloadEvent.SUCCESS);
			event.payload = success;
			dispatchEvent(event);
			dispatchComplete();
		}
		
		/**
		 * Call this method if there is a failure of any kind. 
		 * @param failure:* Any message or event that your client classes expect
		 * Will be appended as the payload to the actual PayloadEvent dispatched
		 */
		protected function dispatchFailure(failure:* = null):void {
			var event:PayloadEvent = new PayloadEvent(PayloadEvent.FAILURE);
			event.payload = failure;
			dispatchEvent(event);
			dispatchComplete();
		}
		
		/**
		 * This method is already called by complete and failure
		 * subclasses should use those interfaces to get to this
		 */
		private function dispatchComplete():void {
			var event:PayloadEvent = new PayloadEvent(PayloadEvent.COMPLETE);
			event.payload = result;
			dispatchEvent(event);
		}

/*		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void {
			dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void {
			dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean {
			return dispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean {
			return dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean {
			return dispatcher.willTrigger(type);
		}
*/
	}
}
