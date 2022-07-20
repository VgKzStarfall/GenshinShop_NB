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
public class StartAuctionServlet extends HttpServlet {

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
        String cc= request.getParameter("clist");
        String wr= request.getParameter("wlist");
        int primo = Integer.parseInt(request.getParameter("primo"));
        
        int price= (int)Double.parseDouble(request.getParameter("value"));
        String acc=request.getParameter("acc");
        Auction auc2= new Auction();
        ArrayList<Auction> auclist = auc2.getListAuction();
        int num=Integer.parseInt(auclist.get(auclist.size()-1).AuctionID.replaceAll("auc",""));
        num++;
        String aucId="auc"+Integer.toString(num);
        int num2=Integer.parseInt(auclist.get(auclist.size()-1).ProductID.replaceAll("acc","")); 
        num2+=1;
        String proId="acc"+Integer.toString(num2);
        auc2=auclist.get(auclist.size()-1);
        Auction auc=new Auction(aucId,proId,price,price,acc,auc2.getStartdate());
        Product p = new Product(proId,cc,wr,primo,acc,"asasddsa",price);
        int k=p.addProduct(p);
        int i=auc.startAuction(auc);
        auclist = auc2.getListAuction();
        request.getServletContext().setAttribute("i",i);
        request.getServletContext().setAttribute("k",k);
        request.getServletContext().setAttribute("list",auclist);
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
        String acc=request.getParameter("acc");
        String proID= request.getParameter("proID");
        int num= Integer.parseInt(request.getParameter("bid"));
        Auction auc=new Auction();
        ArrayList<Auction> auclist= auc.getListAuction();
        for (Auction a:auclist) {
            if (a.ProductID.equalsIgnoreCase(proID)) {auc=a;
            break;}
        }
        int i=auc.bidForAuction(auc,num,acc);
        ArrayList<Auction> list = auc.getListAuction();
        request.getServletContext().setAttribute("list",list);
        request.getRequestDispatcher("auction.jsp").forward(request,response);
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
