package com.laptopweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopweb.dao.ProductDAO;
import com.laptopweb.model.Product;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("productid");
        String name = request.getParameter("productname");
        String price = request.getParameter("productprice");
        String description = request.getParameter("productdescription");
        String type = request.getParameter("categorytype");

        Product p = new Product();
        p.setProductID(Integer.parseInt(id));
        p.setProductName(name);
        p.setProductPrice(Double.parseDouble(price));
        p.setProductDescription(description);
        p.setCategoryID(Integer.parseInt(type));

        System.out.println(type);
        System.out.println(ProductDAO.insert(p));
        response.sendRedirect("productsManagement.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
