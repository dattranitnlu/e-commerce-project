package com.laptopweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopweb.dao.CategoryDAO;
import com.laptopweb.model.Category;


@WebServlet("/EditCategoryServlet")
public class EditCategoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("categoryname");


        Category category = new Category();
        category.setCategoryID(Long.valueOf(request.getParameter("categoryid")));
        category.setCategoryName(name);

        System.out.println(CategoryDAO.update(category));

        response.sendRedirect("categoryManagement.jsp");
    }

}
