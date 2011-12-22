<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.ignou.vcs.commons.EMailUtilities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page
	import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="com.ignou.vcs.commons.beans.MailBean"%><html:html>
<head>
<script type="text/javascript" language="javascript">
	function loadCss() {
		var browser = navigator.appName.toLowerCase();
		// document.write(browser);
		var stylesheet = document.getElementById("pagestyle");
		var menusheet = document.getElementById("menustyle");
		if (browser.indexOf("microsoft internet explorer") != -1) {
			stylesheet.href = "${pageContext.request.contextPath}/theme/css/style_ie.css";
			menusheet.href = "${pageContext.request.contextPath}/theme/css/menu_ie.css";
		} else {
			stylesheet.href = "${pageContext.request.contextPath}/theme/css/style1.css";
			menusheet.href = "${pageContext.request.contextPath}/theme/css/menu.css";
		}
	}
</script>
<link id="pagestyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute(
				"userId");
		if (usid != null) {
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css"
	media="screen,projection" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>


<%
	}
%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">

	<%@include file="../../header.jsp"%>

	<div class="left">
		<div class="left_articles">
			<div class="buttons"></div>
			<%@include file="../../DisplayCalendar.jsp"%>
			<h2>
				<a href="#"><u>Virtual Classroom System</u></a>
			</h2>
			<p class="description">Studying the e-way.</p>
			
			<center>
				<%
					String ex = request.getParameter("e");
					int examId = Integer.parseInt(ex);
					String sub = request.getParameter("s");
					int subjectId = Integer.parseInt(sub);
					
					ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
					CommonsDatabaseActivities cda = new CommonsDatabaseActivities();
					Boolean isDeleted = eda.deleteExam(examId);
					if(isDeleted)
					{
						MailBean mb = new MailBean();
						ArrayList<String> toMailReceipients = cda.getFacultyIds(subjectId);
						ArrayList<String> ccMailReceipients = cda.getAdminMailIds();
						
						mb.setMailSubject("Exam Deletion confirmation");
						mb.setMsgContent("Hi "+ userName+"/n"+
								"This is to inform you that the exam with id \""+examId+"\" has been deleted and is no"+ 
								"longer available in our database./n"+
								"-----"+
								"Regards,/n VCS - Administrator/n/nNote: This is Autogenerated mail to let"+ 
								" you know the confirmation. No need to reply for this mail.");
						mb.setToRecipients(toMailReceipients);
						mb.setCCRecipients(ccMailReceipients);
						EMailUtilities.sendMail(mb);
						%>
						<font color="green">Exam deleted successfully.</font>
						<%
					}else
					{
						%>
						<font color="red">Unable to delete Exam.</font>
						<%
					}
				%>
			
			</center>
			
		</div>
		<%@include file="../../footer.jsp"%>
	</div>
</body>
</html:html>
