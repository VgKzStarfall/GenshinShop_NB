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
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class AuctionServlet extends HttpServlet {

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
        Auction auc= new Auction();
        ArrayList<Auction> list= auc.getListAuction();
        request.getServletContext().setAttribute("list", list);
        request.getRequestDispatcher("auction.jsp").forward(request,response);
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
        String AucID = request.getParameter("ID");
        Auction auc= new Auction();
        ArrayList<Auction> list= auc.getListAuction();
        for (Auction a:list) {
            if (a.AuctionID.equals(AucID)) {auc=a;break;}
            
        }
        Product pro=new Product();
        ArrayList<Product> list2 = pro.getListProduct();
        for (Product p:list2) {
            if (p.getProductID().equals(auc.ProductID)) {pro=p;break;}
        }
        String acc=request.getParameter("acc");
        Wallet wal = new Wallet();
        ArrayList<Wallet> list3= wal.getListWallet();
        for (Wallet w:list3) {
            if (w.getUsername().equals(acc)) {
                wal=w;
                break;
            }
        }
        request.getServletContext().setAttribute("wal", wal);
        request.setAttribute("list",pro.charlist);
        request.setAttribute("list2",pro.weaponlist);
        request.getServletContext().setAttribute("pro",pro);
        request.getServletContext().setAttribute("auc",auc);
        request.getRequestDispatcher("bid.jsp").forward(request,response);
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
