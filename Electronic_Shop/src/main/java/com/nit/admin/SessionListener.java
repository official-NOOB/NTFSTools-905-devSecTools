package com.nit.admin;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class SessionListener implements HttpSessionListener, HttpSessionAttributeListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		
		System.out.println("Session Object created");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
		System.out.println("Session Object distroyed");
	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent hsbe) {
		System.out.println("Attribute Added to the Session :"+hsbe.getName());
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent hsbe) {
		System.out.println("Attribute removed from the session");
	}
}
