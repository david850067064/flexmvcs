
package flexmvcs.patterns.observer {

	public class NotificationBody {
		public var target:Object;
		public var value:Object;
		public var parameterName:String;
		
		public function NotificationBody(target:Object=null, value:Object=null, parameterName:String=null) {
			this.target = target;
			this.value = value;
			this.parameterName = parameterName;
		}
		
		public function getTarget():Object {
			return target;
		}
		
		public function getValue():Object {
			return value;
		}
		
		public function getParameterName():String {
			return parameterName;
		}
	}
}