package oes.model;

import oes.db.Result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oes.db.Provider;

public class ResultDao {
    // Store result in the database
    public static boolean storeResult(Result result) {
        boolean status = false;
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Provider.getOracleConnection();

            String sql = "INSERT INTO results (username, total_questions, attempted, correct_answers, wrong_answers, unattempted) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, result.getUsername());
            pstmt.setInt(2, result.getTotalQuestions());
            pstmt.setInt(3, result.getAttempted());
            pstmt.setInt(4, result.getCorrectAnswers());
            pstmt.setInt(5, result.getWrongAnswers());
            pstmt.setInt(6, result.getUnattempted());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return status;
    }
    
    public static List<Result> getAllStudentResults() throws SQLException {
        List<Result> resultsList = new ArrayList<Result>();

        // Database connection
        try (Connection conn = Provider.getOracleConnection()) {
            // Query to fetch all student results
            String sql = "SELECT username, total_questions, attempted, correct_answers, wrong_answers, unattempted FROM results";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                
                while (rs.next()) {
                    Result results = new Result();
                    results.setUsername(rs.getString("username"));
                    results.setTotalQuestions(rs.getInt("total_questions"));
                    results.setAttempted(rs.getInt("attempted_questions"));
                    results.setCorrectAnswers(rs.getInt("correct_answers"));
                    results.setWrongAnswers(rs.getInt("wrong_answers"));
                    results.setUnattempted(rs.getInt("unattempted_questions"));
                    resultsList.add(results);
                }
            }
        }
        
        return resultsList;
    }
}
