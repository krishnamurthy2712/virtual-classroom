<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
<script type="text/javascript" language="javascript" >
function loadCss() {
	var browser = navigator.appName.toLowerCase();
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if(browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css";
	}
	else {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style1.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
 	
 
 <%
 }
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title>
<script src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<script>
var i = 0;
</script>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Archive Users</u></a></h2>
				<p class="description">Following Students will be Archived.</p>
				<table>
					<tr>
						<td width = "150"><b><u>Name</u></b></td>
						<td> <b><u>Course Completion Date </u></b></td>
					</tr>
				<p>
					<%
					CommonsDatabaseActivities dbObj = new CommonsDatabaseActivities();
					java.util.ArrayList allStudents = (java.util.ArrayList)dbObj.getUsersToBeArchived();
					String url = "archived.jsp";
					
					for(int i = 0; i < allStudents.size(); i++ ) {
						com.ignou.vcs.commons.beans.StudentBean studentBean = (com.ignou.vcs.commons.beans.StudentBean)allStudents.get(i);
						String name = studentBean.getName();
						Date endDate = studentBean.getEndDate();
						%>
						<tr>
							<td width = "150"><%= name %></td>
							<td><%= endDate %></td>
						</tr>
						<%
					}
					
					
					 %>	
				</p>
				</table>
				<div class = "buttons">
					<a href = "javascript:jah('<%= url %>','id_box');" class="greenbtn"><span> Archive </span></a>
				</div>
			</div>
			
		</div>	
		
		
		<div id="right">
			<div class="boxtop"></div>
			<div class="box">
				<p>
					All Students that have completed their course can be archived.
					Archived students can only generate their Report Card from Virtual Classroom System.
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>Read All</span></a></p></div>
			</div>
			
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
				<div id="id_box">
					<b><u>Collaborate</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
				</div>
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
