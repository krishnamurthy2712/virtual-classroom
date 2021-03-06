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
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title>
<script src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<script>
var i = 0;
</script><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Faculties at VCS</u></a></h2>
				<p class="description">Please select a Subject to view its faculties.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<div id = "id">
				<p>
				
					Faculties constitue an integral part of Virtual Classroom System. They are responsible for the overall study plan of student.
					Faculties teaching at VCS are expert in a particular subject. They cannot teach more than one suubject in a particular Standard but they can teach at multiple standards.
					<br /> 
				</p>
				</div>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<%
							CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
					 		java.util.ArrayList allCoursesAdmin = dbObject.getAllSubjects();
					 		System.out.println("Size of Subjects list:" + allCoursesAdmin.size());
					 		for (int k = 0; k < allCoursesAdmin.size(); k++) {
					 			com.ignou.vcs.commons.beans.SubjectBean sBean = (com.ignou.vcs.commons.beans.SubjectBean)allCoursesAdmin.get(k);
					 			String sName = sBean.getSubjectName();
					 			String sid = sBean.getSubjectId();
					 			//String sid = "0";
					 			String link = "faculty_list.jsp?sid=" + sid + "&pageNum=0";
					 		
					 		
					 	
					 	%>
							<input type = "hidden" name="link<%=k%>" id="link<%=k%>" value=<%=link %> >
							 
						<a href="javascript:fetchData('link','<%=k %>','id')" accesskey="m"><%= sName %></a><br />
						
					<%				
								 }
					
					
					
					 %>
				</p>
				
			</div>
			
			<div id="id_box">
			
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>