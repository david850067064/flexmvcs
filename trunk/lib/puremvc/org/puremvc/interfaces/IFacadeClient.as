package org.puremvc.interfaces
{
	public interface IFacadeClient
	{
		/**
		 * Set the reference to the related Facade instance
		 * 
		 * This method should usually only be called by the
		 * IFacade instance that instantiated this Object.
		 * 
		 * @param facade should implement <code>IFacade</code>
		 */
		function setFacade(facade:IFacade):void;
		
		/**
		 * Get the reference to the related Facade instance
		 */
		function getFacade():IFacade;
	}
}