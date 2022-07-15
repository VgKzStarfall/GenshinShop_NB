/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Payment;
import Model.Wallet;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class RechargeServlet extends HttpServlet {

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
            out.println("<title>Servlet RechargeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RechargeServlet at " + request.getContextPath() + "</h1>");
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
        Wallet wal = new Wallet();
        ArrayList<Wallet> list = wal.getListWallet();
        request.getServletContext().setAttribute("list", list);
        request.getRequestDispatcher("recharge.jsp").forward(request, response);
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
        String walID = request.getParameter("walletID");
        System.out.println(walID);
        int amount = Integer.parseInt(request.getParameter("amount"));
        String method = request.getParameter("method");
        // String mssv = s.getMssv();
        Wallet wal = new Wallet();
        Payment pm = new Payment();
        ArrayList<Payment> payList = pm.getListPayment();
//        StudentDAO sDB = new StudentDAO();
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
        Date now = new Date();
        String strDate = sdfDate.format(now);
        String pID = "PM";
        int n = 1;
        while (n > 0) {
            Random rand = new Random();
            int upperbound = 9999;
            int int_random = rand.nextInt(upperbound);
            pID = pID + String.valueOf(int_random);
            if (payList.contains(pID)) {
                n++;
            } else {
                break;
            }
        }
        System.out.println(strDate);
        System.out.println(pID);
        wal.updateBalance(walID, amount);
        pm.paymentCheck(pID, walID, method, amount, strDate);
        response.sendRedirect("rechargeservlet");
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
