<%-- tpl:insert page="/theme/VCSTemplate.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	// document.write(browser);
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
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
								
<%@include file="header.jsp" %>		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<p>
				Various activities are included for the overall development of the students.Various kud of e-books,journals,books coresponding to latest syllabus are uploaded
				to benefit both students and the teachers.Moreover various competitions like Essay Writing Competition,Poster Making Competition,Quizzes ets are held for the 
				students here at VCS to increase their IQ Level.
					<table>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/globe_48.png" class="thumbnail">
					<b><u>Suggested Reading</u></b>
					<p>Time to gear up your learning process in a more innovative manner.</p></td>
				</tr>	
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/yahoo_48.png" class="thumbnail">
					<b><u>Fun@VCS</u></b>
					<p>Its fun time at VCS..enjoy the stride..!!</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/newspaper_48.png" class="thumbnail">

					<b><u><a href="http://localhost:8080/ELibrary">Ebooks/Journals</a></u></b>
					<p>Enhance your knowledge and General Awareness here!!</p></td>
				</tr>	
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/refresh_48.png" class="thumbnail">
					<b><u>New Arrivals!!</u></b>
					<p>View upcoming books on your various subjects as per the syllabus.</p></td>
				</tr>
				</table>
				
				</p>
				
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<%@include file="latest_news.jsp" %>
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Important Links</u></b><br />
					<a href="http://localhost:8080/VCS/faculty_registration.jsp" accesskey="m"><span class="key">R</span>egister as a Faculty</a><br />
					<a href="http://localhost:8080/VCS/faculty_registration.jsp" accesskey="m"><span class="key">B</span>ecome a Manager</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>iew Demo</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>ontact Us</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>