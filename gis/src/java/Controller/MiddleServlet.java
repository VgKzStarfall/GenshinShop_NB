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
public class MiddleServlet extends HttpServlet {

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
        CharValue cv=new CharValue();
        ArrayList<CharValue> charlist = cv.getListCharValue();
        request.setAttribute("list", charlist);
        request.getRequestDispatcher("InputInfo.jsp").forward(request,response);
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
        CharValue cv=new CharValue();
        ArrayList<CharValue> charlist=cv.getListCharValue();
        String list="";
        String[] namelist= new String[charlist.size()];
        String[] conslist= new String[charlist.size()];
        int i=0;
        for (CharValue cv2:charlist) {
            namelist[i]=request.getParameter(cv2.CodeName);
            conslist[i]=request.getParameter(cv2.CodeName+"1");
            if (conslist[i]=="" && namelist[i]!="") conslist[i]="0";
            if (namelist[i]!=null) {
                list+=namelist[i]+conslist[i]+",";
            }
            i++;
        }
        list=list.substring(0,list.length()-1).toLowerCase();
        request.getServletContext().setAttribute("input","hidden");
        request.getServletContext().setAttribute("back","submit");
        request.getServletContext().setAttribute("hidden","");
        request.getServletContext().setAttribute("list",list);
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
