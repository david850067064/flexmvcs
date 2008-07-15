package {
	/**
	 * This file has been automatically created using
	 * #!/usr/bin/ruby script/generate suite
	 * If you modify it and run this script, your
	 * modifications will be lost!
	 */

	import asunit.framework.TestSuite;
	import flexmvcs.patterns.command.CompositeCommandTest;
	import flexmvcs.patterns.command.FlexCommandTest;
	import flexmvcs.patterns.facade.FlexFacadeTest;

	public class AllTests extends TestSuite {

		public function AllTests() {
			addTest(new flexmvcs.patterns.command.CompositeCommandTest());
			addTest(new flexmvcs.patterns.command.FlexCommandTest());
			addTest(new flexmvcs.patterns.facade.FlexFacadeTest());
		}
	}
}
