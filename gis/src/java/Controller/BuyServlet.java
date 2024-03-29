/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
 * @author khang
 */
public class BuyServlet extends HttpServlet {

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
        
        String vip = request.getParameter("vip");
        int vjp = Integer.parseInt(vip);
        String index = request.getParameter("page");
        
        if(index == null) {
            index = "1";
        }
        int page = Integer.parseInt(index);
        
      Product pro = new Product();
        ArrayList<Product> proList = pro.getListProduct();
        ArrayList<Product> vippro = new ArrayList<>();
        ArrayList<Product> suggestList = new ArrayList<>();
        ArrayList<Product> vippro1 = new ArrayList<>();
        ArrayList<Product> suggestList1 = new ArrayList<>();
        
        for(Product viplist : proList) {
            if(viplist.getPrice()>=500) {
                vippro.add(viplist);
            }
        }
        for (int i = (page-1)*4; i < page*4; i++) {
            if(i >= vippro.size()) {
                break;
            } else {
                vippro1.add(vippro.get(i));
            }
        }
        for(Product suglist : proList) {
            if(suglist.getCharlist().contains("a")) {
                suggestList.add(suglist);
            }
        }
        for (int i = (page-1)*4; i < page*4; i++) {
            if(i >= suggestList.size()) {
                break;
            } else {
                suggestList1.add(suggestList.get(i));
            }
        }
        
        int count;
        int endpage;
        
        if(vjp == 1) {
            count = vippro.size();
            endpage = count/4;
            if(endpage%4!=0) endpage++;
            request.setAttribute("vip", vip);
            request.setAttribute("list", vippro1);
            request.setAttribute("endpage", endpage);
            request.setAttribute("page", page);
            
            
        } else {
            count = suggestList.size();
            endpage = count/4;
             if(endpage%4!=0) endpage++;
            request.setAttribute("vip", vip);
            request.setAttribute("list", suggestList1);
            request.setAttribute("endpage", endpage);
            request.setAttribute("page", page);
        }
        
      
     
         
     
       
        
        
        request.getRequestDispatcher("buy.jsp").forward(request, response);
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
        processRequest(request, response);
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
