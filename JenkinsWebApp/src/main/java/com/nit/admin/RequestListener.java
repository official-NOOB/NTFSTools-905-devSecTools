package com.nit.admin;

import jakarta.servlet.ServletRequestAttributeEvent;
import jakarta.servlet.ServletRequestAttributeListener;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;

//@WebListener
public class RequestListener implements ServletRequestListener, ServletRequestAttributeListener{
	
	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		System.out.println("Request Object created");
	}
	
	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		System.out.println("Request Object distroyed");
	}
	
	@Override
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		System.out.println("Request Added: "+srae.getName());
	}
	
	@Override
	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		System.out.println("Request removed");
	}
}
