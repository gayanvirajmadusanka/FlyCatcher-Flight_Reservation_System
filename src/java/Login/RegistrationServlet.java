/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import db.DBConnection;
import validate.ValidateRegister;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
public class RegistrationServlet extends HttpServlet {

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
            out.println("<title>Servlet RegistrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
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

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        ValidateRegister validate = new ValidateRegister();
        Boolean isExisting = validate.checkUser(email);

        if (isExisting) {
            RequestDispatcher rs = request.getRequestDispatcher("Register.jsp");
            rs.include(request, response);
            out.println("<div class=\"container center\">"
                    + "Email already exist"
                    + "</div>");
        } else {

            try {
                Connection connection = DBConnection.getInstance().getConnection();
                String statement = "insert into USER2(user_name, user_email, user_phone, user_password) values (?, ?, ?, ?)";
                PreparedStatement ps = connection.prepareStatement(statement);

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, password);

                int result = ps.executeUpdate();

                if (result > 0) {
                    if (name == null || email == null || phone == null || password == null) {
                        RequestDispatcher rs = request.getRequestDispatcher("Register.jsp");
                        rs.include(request, response);
                        out.println("<div class=\"complete all feilds\">"
                                + "Invalid email or password"
                                + "</div>");
                    } else {
                        RequestDispatcher rs = request.getRequestDispatcher("UserFlights.jsp");
                        rs.forward(request, response);
                    }
                } else {
                    RequestDispatcher rs = request.getRequestDispatcher("Register.jsp");
                    rs.include(request, response);
                    out.println("<div class=\"container center\">"
                            + "Invalid email or password"
                            + "</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Registration Failed</h3>");
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
