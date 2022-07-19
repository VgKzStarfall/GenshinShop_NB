/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.WeapValue;
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
public class MiddleServlet2 extends HttpServlet {

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
            out.println("<title>Servlet MiddleServlet2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MiddleServlet2 at " + request.getContextPath() + "</h1>");
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
        WeapValue wv=new WeapValue();
        ArrayList<WeapValue> weaplist = wv.getListWeapValue();
        request.setAttribute("list", weaplist);
        request.getRequestDispatcher("InputWeapon.jsp").forward(request,response);
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
        WeapValue wv=new WeapValue();
        ArrayList<WeapValue> weaplist=wv.getListWeapValue();
        String list="";
        String[] namelist= new String[weaplist.size()];
        String[] conslist= new String[weaplist.size()];
        int i=0;
        for (WeapValue wv2:weaplist) {
            namelist[i]=request.getParameter(wv2.CodeName);
            conslist[i]=request.getParameter(wv2.CodeName+"1");
            if (conslist[i]=="" && namelist[i]!="") conslist[i]="0";
            if (namelist[i]!=null) {
                list+=namelist[i]+conslist[i]+",";
            }
            i++;
        }
        list=list.substring(0,list.length()-1).toLowerCase();
        request.getServletContext().setAttribute("input2","hidden");
        request.getServletContext().setAttribute("hidden2","");
        request.getServletContext().setAttribute("weaplist",list);
        request.getRequestDispatcher("evaluate.jsp").forward(request,response);
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
