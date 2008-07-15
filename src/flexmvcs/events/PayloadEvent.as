package flexmvcs.events {
	import flash.events.Event;

	public class PayloadEvent extends Event {
		public static const BUBBLES:Boolean 			= true; // Static to make finding bubbling events easier
		public static const CHANGE:String 				= "change";
		public static const CLOSE_POP_UP:String			= "closePopUp";
		public static const COLOR_CHANGED:String		= "colorChanged";
		public static const COMPLETE:String 			= "complete";
		public static const DESTROYED:String 			= "destroyed";
		public static const FAILURE:String 				= "failure";
		public static const IS_BUSY_CHANGED:String		= "isBusyChanged";
		public static const ITEM_CLICK:String 			= "itemClick";
		public static const LOAD_COMPLETE:String 		= "loadComplete";
		public static const LOADED:String 				= "loaded";
		public static const PROPERTY_CHANGE:String		= "propertyChange";
		public static const REFRESH_CLICK:String		= "refreshClick";
		public static const REMOVED:String				= "removed";
		public static const SUCCESS:String				= "success";
		public static const SAVED:String 				= "saved";
		public static const STATUS_CHANGED:String 		= "statusChanged";
		public static const SELECTION_CHANGED:String 	= "selectionChanged";
		public static const TIMEOUT:String				= "timeout";
		
		public var payload:Object;
		private var _target:Object;
		
		public function PayloadEvent(type:String=null, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
		public function set target(target:*):void {
			_target = target;
		}
		
		override public function get target():Object {
			return (_target || super.target);
		}
		
		override public function toString():String {
			return "[PayloadEvent type='" + type + "' bubbles='" + bubbles + "' cancelable='" + cancelable + "' eventPhase='" + eventPhase + "']";
		}
		
		override public function clone():Event {
			var event:PayloadEvent = new PayloadEvent(type, bubbles, cancelable);
			event.payload = payload;
			return event;
		}
	}
}