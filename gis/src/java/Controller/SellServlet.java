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
public class SellServlet extends HttpServlet {

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
        request.getServletContext().setAttribute("input","submit");
        request.getServletContext().setAttribute("back","hidden");
        request.getServletContext().setAttribute("hidden","hidden");
        request.getRequestDispatcher("evaluate.jsp").forward(request, response);
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
        String charlist= (request.getParameter("charlist")).toLowerCase();
        int primos=Integer.parseInt(request.getParameter("primos"));
        String[] chars=charlist.replaceAll(" ","").split(",");
        int n=chars.length;
        double eval=(double)0.01543209876*primos;
        CharValue cv2=new CharValue();
        ArrayList<CharValue> charvalue= cv2.getListCharValue();
        String[] name=new String[10];
        String[] number=new String[10];
        int i=0;
        for (String c:chars) {
            name[i]=c.substring(0,c.length()-1);
            number[i]=c.substring(c.length()-1);
            for (CharValue cv:charvalue) {
                if (cv.CodeName.contains(name[i])) {
                    name[i]=cv.FullName;
                    switch (number[i]) {
                        case "0":
                            eval+=cv.C0;
                            break;
                        case "1":
                            eval+=cv.C1;
                            break;
                        case "2":
                            eval+=cv.C2;
                            break;
                        case "3":
                            eval+=cv.C3;
                            break;
                        case "4":
                            eval+=cv.C4;
                            break;
                        case "5":
                            eval+=cv.C5;
                            break;
                        case "6":
                            eval+=cv.C6;
                            break;
                        default:
                            eval=-1;
                    }
                    break;
                }
            }
            i++;
        }
        ArrayList<CharCons> ccl= new ArrayList<>();
        for (int j=0;j<i;j++) {
            ccl.add(new CharCons(name[j],Integer.parseInt(number[j])));
        }
        eval = Math.round(eval);
        request.getServletContext().setAttribute("charlist",charlist);
        request.getServletContext().setAttribute("list",ccl);
        request.getServletContext().setAttribute("primo",primos);
        request.getServletContext().setAttribute("eval",eval);
        request.getRequestDispatcher("doneeval.jsp").forward(request,response);
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
