package com.laptopweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopweb.dao.ProductDAO;
import com.laptopweb.model.Product;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String productname = request.getParameter("productname");
        String productprice = request.getParameter("productprice");
        String productdescription = request.getParameter("productdescription");
        String producttype = request.getParameter("categorytype");
        String productid = request.getParameter("productid");

        Product p = new Product();
        p.setProductID(Integer.parseInt(productid));
        p.setProductName(productname);
        p.setProductPrice(Double.parseDouble(productprice));
        p.setProductDescription(productdescription);
        p.setCategoryID(Integer.parseInt(producttype));

        ProductDAO.update(p);
        response.sendRedirect("productsManagement.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
