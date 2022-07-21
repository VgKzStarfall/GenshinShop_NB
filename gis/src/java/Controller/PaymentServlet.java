/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author HP
 */
public class PaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet PaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
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
        String acc= request.getParameter("acc");
        String pro= request.getParameter("pro");
        Product pr = new Product();
        ArrayList<Product> list = pr.getListProduct();
        for (Product prod:list) {
            if (prod.ProductID.equals(pro)) {
                pr=prod;
                break;
            }
        }
        Wallet wal = new Wallet();
        ArrayList<Wallet> list2= wal.getListWallet();
        for (Wallet w:list2) {
            if (w.getUsername().equals(acc)) {
                wal=w;
                break;
            }
        }
        int done=-1;
        if (wal.getBalance()>=pr.price) {
            done=1;
            wal.decreaseBalance(wal.getWalletID(), pr.price);
        }
        else {done=0;}
        String up=pr.getAccount_info();
        up=up.replaceAll(" ","");
        Payment p = new Payment();
        ArrayList<Payment> payList= p.getListPayment();
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
        p.paymentCheck(pID, wal.getWalletID(), "Buy", (-pr.price), strDate);
        String username= up.substring(0,up.indexOf("-"));
        String password = up.substring((up.indexOf("-")+1),up.length());
        request.getServletContext().setAttribute("done",done);
        request.getServletContext().setAttribute("wallet",wal);
        request.getServletContext().setAttribute("pro",pr);
        request.getServletContext().setAttribute("username",username);
        request.getServletContext().setAttribute("password",password);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
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
