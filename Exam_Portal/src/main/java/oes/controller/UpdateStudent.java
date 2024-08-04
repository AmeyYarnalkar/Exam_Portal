package oes.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oes.model.StudentsDao;

/**
 * Servlet implementation class UpdateStudent
 */
@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudent() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String uname = request.getParameter("uname");
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String original = request.getParameter("usernameoriginal");

        // Ensure parameters are not null or empty
        if (uname == null || name == null || pass == null || original == null ||
            uname.isEmpty() || name.isEmpty() || pass.isEmpty() || original.isEmpty()) {
            response.sendRedirect("error.jsp"); // Redirect to an error page or show an error message
            return;
        }

        // Update the student record
        int status = StudentsDao.doUpdateNowRecord(original, uname, pass, name);

        // Redirect based on update status
        if (status == 1) {
            response.sendRedirect("StudentList.jsp");
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page or show an error message
        }
    }
}
