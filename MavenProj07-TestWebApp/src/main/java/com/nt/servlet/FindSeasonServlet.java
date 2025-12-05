package com.nt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/season")
public class FindSeasonServlet extends HttpServlet {
	
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter object
		PrintWriter pw=res.getWriter();
		//set response content type
		res.setContentType("text/html");
		 //b.logic
		LocalDate  date=LocalDate.now();
		int month=date.getMonthValue();
		String seasonName="";
		if(month>=3 && month<=6)
			seasonName="Summer Season";
		else if(month>=7 && month<=10)
			seasonName="Rainy Season";
		else
			seasonName="Winter Season";
		//use  stream  to write the content to response object 
		pw.println("<h1 style='color;red;text-align:center'>"+seasonName+"</h1>");
		pw.println("<br> <a href='index.jsp'> home </a>");
		//close the stream 
		pw.close();
		
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
		}

}
