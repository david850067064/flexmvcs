FlexMVCS is an application framework for developing [Flex](http://flex.org) and ActionScript 3 projects. This is a Flex-focused modification of the excellent [PureMVC](http://www.puremvc.org) framework. A significant design influence was [Joe Berkovitz's](http://www.joeberkovitz.com/) [MVCS](http://www.joeberkovitz.com/blog/reviewtube/) approach.

FlexMVCS was designed and implemented by [Ali Mills](http://www.alimills.com) and [Luke Bayes](http://www.lukebayes.com) of [Pattern Park, Inc.](http://www.patternpark.com) and was entirely funded and generously contributed to the community by [Bunchball, Inc](http://www.bunchball.com).

This build differs from PureMVC in the following ways:

  * Removed unnecessary use of Singletons.
  * Added IService as a first-class participant and member of IFacade.
  * Created asynchronous commands that trigger events when complete.
  * Added composite command that facilitates synchronous and asynchronous command chaining with support for arbitrary composition depth.
  * Added MXML Facade definitions. Application Facades can be defined using MXML instead of only ActionScript.
  * Added support for Modular Flex applications, including composite Facades for each loaded module.
  * PureMVC is trying to be more than we need, we need clean, intuitive support for Flex and ActionScript. Not ECMA, Java or other languages.

Please let us know if you're interested in contributing or even using this project.