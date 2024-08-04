package oes.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oes.model.InstructionsDao;

/**
 * Servlet implementation class UpdateInstruction
 */
@WebServlet("/UpdateInstruction")
public class UpdateInstruction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInstruction() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String newInstruction = request.getParameter("instmodified");
        String oldInstruction = request.getParameter("instoriginal");

        // Check if parameters are not null
        if (newInstruction != null && oldInstruction != null) {
            // Update the instruction in the database
            int status = InstructionsDao.doUpdateNowRecord(oldInstruction, newInstruction);

            // Check if the update was successful
            if (status == 1) {
                // Redirect to the instruction list page
                response.sendRedirect("InstructionList.jsp");
            } else {
                // Handle the failure case (e.g., show an error page)
                request.setAttribute("errorMessage", "Update failed. Please try again.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // Handle missing parameters
            response.sendRedirect("error.jsp?error=Missing parameters");
        }
    }
}
