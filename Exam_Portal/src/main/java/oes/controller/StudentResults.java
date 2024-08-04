package oes.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import oes.model.ResultDao;
import oes.db.Result;

@WebServlet("/StoreResultsServlet")
public class StudentResults extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String username = request.getParameter("username");
        int size = Integer.parseInt(request.getParameter("size"));
        int attempted = Integer.parseInt(request.getParameter("attempted"));
        int correctAnswers = Integer.parseInt(request.getParameter("correctAnswers"));
        int wrongAnswers = Integer.parseInt(request.getParameter("wrongAnswers"));
        int unattempted = Integer.parseInt(request.getParameter("unattempted"));

        // Create a Result object to hold the data
        Result result = new Result();
        result.setUsername(username);
        result.setTotalQuestions(size);
        result.setAttempted(attempted);
        result.setCorrectAnswers(correctAnswers);
        result.setWrongAnswers(wrongAnswers);
        result.setUnattempted(unattempted);

        // Store the result in the database using a DAO
        boolean isStored = ResultDao.storeResult(result);

        // Handle response based on whether storing was successful
        if (isStored) {
            response.sendRedirect("confirmation.jsp"); // Redirect to a confirmation page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }
}
