/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class SellServlet2 extends HttpServlet {

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
            out.println("<title>Servlet SellServlet2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SellServlet2 at " + request.getContextPath() + "</h1>");
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
        String cc= request.getParameter("clist");
        String wr= request.getParameter("wlist");
        int primo = Integer.parseInt(request.getParameter("primo"));
        
        int price= (int)Double.parseDouble(request.getParameter("value"));
        Product pr=new Product();
        ArrayList<Product> plist=pr.getListProduct();
        int prID=Integer.parseInt(plist.get(plist.size()-1).ProductID.replace("acc",""));
        prID++;
        String proID="acc"+Integer.toString(prID);
        String acc=request.getParameter("acc");
        String acc_info=request.getParameter("acc_info");
        Product p = new Product(proID,cc,wr,primo,acc,acc_info,price);
        int n=p.addProduct(p);
        request.getServletContext().setAttribute("proid", proID);
        request.getServletContext().setAttribute("pro", n);
        request.getRequestDispatcher("sellsuccess.jsp").forward(request, response);
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
        String cc= request.getParameter("list");
        int primo = Integer.parseInt(request.getParameter("primo"));
        String name=request.getParameter("name");
        String acc=request.getParameter("acc");
        int price= (int)Double.parseDouble(request.getParameter("value"));
        Product p = new Product(name,cc,"N/A",primo,acc,"acc",price);
        p.addProduct(p);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
