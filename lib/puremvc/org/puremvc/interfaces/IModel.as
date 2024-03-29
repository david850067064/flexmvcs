/*
 PureMVC - Copyright(c) 2006, 2007 FutureScale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
*/
package org.puremvc.interfaces
{
	/**
	 * The interface definition for a PureMVC Model.
	 * 
	 * <P>
	 * In PureMVC, <code>IModel</code> implementors provide
	 * access to <code>IProxy</code> objects by named lookup. </P>
	 * 
	 * <P>
	 * An <code>IModel</code> assumes these responsibilities:</P>
	 * 
	 * <UL>
	 * <LI>Maintain a cache of <code>IProxy</code> instances</LI>
	 * <LI>Provide methods for registering, retrieving, and removing <code>IProxy</code> instances</LI>
	 * </UL>
	 */
	public interface IModel extends IFacadeClient
	{
		/**
		 * Register an <code>IProxy</code> instance with the <code>Model</code>.
		 * 
		 * @param proxyName the name to associate with this <code>IProxy</code> instance.
		 * @param proxy an object reference to be held by the <code>Model</code>.
		 */
		function registerProxy( proxy:IProxy ) : void;

		/**
		 * Retrieve an <code>IProxy</code> instance from the Model.
		 * 
		 * @param proxyName
		 * @return the <code>IProxy</code> instance previously registered with the given <code>proxyName</code>.
		 */
		function retrieveProxy( proxyName:String ) : IProxy;

		/**
		 * Remove an <code>IProxy</code> instance from the Model.
		 * 
		 * @param proxyName name of the <code>IProxy</code> instance to be removed.
		 */
		function removeProxy( proxyName:String ) : void;
		
	}
}