package com.ignou.vcs.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class TestAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		com.ignou.vcs.forms.Test testForm = (com.ignou.vcs.forms.Test) form;

		String testid;
		String userid = (String) request.getSession().getAttribute("userId");
		com.ignou.vcs.database.VCSDatabaseActivities db_test = new com.ignou.vcs.database.VCSDatabaseActivities();
		com.ignou.vcs.beans.FacultyBean fbean = db_test
				.getFacultyDetails(userid);

		// Have to change with session
		String subjectid = fbean.getSubjectID();
		int isubjectid = Integer.parseInt(subjectid);
		int maxmarks = testForm.getMax_marks();
		request.getSession().setAttribute("maxmarks",
				Integer.toString(maxmarks));
		try {

			testid = db_test.uploadTest(testForm, isubjectid, userid);
			request.getSession().setAttribute("testid", testid);
			System.out.println(testid);

		} catch (Exception e) {

			// Report the error using the appropriate name and ID.
			errors.add("name", new ActionError("id"));

		}

		// If a message is required, save the specified key(s)
		// into the request for use by the <struts:errors> tag.

		if (!errors.isEmpty()) {
			saveErrors(request, errors);

			// Forward control to the appropriate 'failure' URI (change name as
			// desired)
			forward = mapping.findForward("failure");

		} else {

			// Forward control to the appropriate 'success' URI (change name as
			// desired)

			forward = mapping.findForward("success");

		}

		// Finish with
		return (forward);

	}
}
