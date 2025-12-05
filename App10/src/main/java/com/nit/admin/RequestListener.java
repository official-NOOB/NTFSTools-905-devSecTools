package com.nit.admin;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

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
