package com.cs336.pkg;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet(name="UsersServlet",urlPatterns="/get-user")
public class UsersServlet extends HttpServlet {

    private UsersService usersService = new UsersService();

    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{

        String username = request.getParameter("username");
        System.out.println(username);
        if(username != null){
            usersService.getUser(username).ifPresent(user -> System.out.println(user.toString()));

            usersService.getUser(username).ifPresent(user -> request.setAttribute("user",user));
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "get-user.jsp"
        );
        dispatcher.forward(request,response);
    }

    @Override
    protected void doGet(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }


}
