/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import db.DBConnection;
import validate.ValidateFlight;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
public class FlightServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FlightServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FlightServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String flight_no = request.getParameter("flight_no");
        String dep_date = request.getParameter("dep_date");
        String dep_time = request.getParameter("dep_time");
        String dep_airport = request.getParameter("dep_airport");
        String arr_date = request.getParameter("arr_date");
        String arr_time = request.getParameter("arr_time");
        String arr_airport = request.getParameter("arr_airport");
        String aircraft_no = request.getParameter("aircraft_no");
        String price = request.getParameter("price");

        ValidateFlight validate = new ValidateFlight();
        Boolean isExisting = validate.checkUser(dep_date, dep_time, arr_date, arr_time, aircraft_no);

        if (isExisting) {
            RequestDispatcher rs = request.getRequestDispatcher("FlightInput.jsp");
            rs.include(request, response);
            out.println("<div class=\"container center\">"
                    + "Aircraft already exist"
                    + "</div>");
        } else {

            try {
                Connection connection = DBConnection.getInstance().getConnection();
                String statement = "insert into FLIGHT(dep_date, dep_time, dep_airport, arr_date, arr_time, arr_airport, aircraft_no, price, seat_count) values (?, ?, ?, ?, ?, ?, ?, ?,(SELECT seat_count FROM AIRCRAFT  where reg_no = ?) )";
                PreparedStatement ps = connection.prepareStatement(statement);

                ps.setString(1, dep_date);
                ps.setString(2, dep_time);
                ps.setString(3, dep_airport);
                ps.setString(4, arr_date);
                ps.setString(5, arr_time);
                ps.setString(6, arr_airport);
                ps.setString(7, aircraft_no);
                ps.setString(8, price);
                ps.setString(9, aircraft_no);

                int result = ps.executeUpdate();

                if (result > 0) {
                    RequestDispatcher rs = request.getRequestDispatcher("Flights.jsp");
                    rs.forward(request, response);
                } else {
                    RequestDispatcher rs = request.getRequestDispatcher("FlightInput.jsp");
                    rs.include(request, response);
                    out.println("<div class=\"container center\">"
                            + "Invalid Aircraft"
                            + "</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Something Went Wrong</h3>");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
