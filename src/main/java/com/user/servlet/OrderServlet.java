package com.user.servlet;

import java.io.IOException;
import java.util.*;
import com.DAO.CartDAOImpl;
import com.DAO.OrdersDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Orders;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "OrderServlet", urlPatterns = { "/OrderServlet" })
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            Long phnno = Long.parseLong(req.getParameter("phnno"));
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String fulladdress = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;
            String paymentType = req.getParameter("paymentType");

            User u = (User) session.getAttribute("userobj");
            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
            List<Cart> plist = dao.getProductByUser(id);

            if (plist.isEmpty()) {
                session.setAttribute("Msg", "Please Add Items");
                resp.sendRedirect("checkout.jsp");
            } else {
                OrdersDAOImpl dao2 = new OrdersDAOImpl(DBConnect.getConn());
                Orders o = null;

                ArrayList<Orders> orderList = new ArrayList<Orders>();
                Random r = new Random();
                String orderId = "PRODUCT-ORD-00" + r.nextInt(1000);
                for (Cart c : plist) {
                    o = new Orders();
                    o.setOrder_id(orderId);
                    o.setUserID(c.getUserID());
                    o.setProductID(c.getProductID());
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhnno(phnno);
                    o.setFulladd(fulladdress);
                    o.setProductName(c.getProduct_name());
                    o.setPrice(c.getPrice());
                    o.setQuantity(c.getQuantity());
                    o.setPaymentType(paymentType);
                    o.setTotal_price(c.getPrice() * c.getQuantity());
                    orderList.add(o);
                }
                if ("noselect".equals(paymentType)) {
                    session.setAttribute("Msg", "Please Select Payment Type");
                    resp.sendRedirect("checkout.jsp");
                } else {
                    boolean f = dao2.saveOrder(orderList);
                    if (f) {
                        dao.clearCart(id);
                        resp.sendRedirect("order_success.jsp");
                    } else {
                        session.setAttribute("Msg", "Failed");
                        resp.sendRedirect("checkout.jsp");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
