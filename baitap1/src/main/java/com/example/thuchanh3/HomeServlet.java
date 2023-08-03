package com.example.thuchanh3;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "homeServlet", value = "/home-servlet")
public class HomeServlet extends HttpServlet {
 public List<Client> list = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        list.add(new Client("nguyễn văn a", "22/1/2014","hà nội", "https://demoda.vn/wp-content/uploads/2022/03/anh-anime-co-trang-1.jpg"));
        list.add(new Client("nguyễn văn b", "22/6/2014","bắc gianh", "https://cdn.phunuvagiadinh.vn/thuytrang_btv/auto/29_9_2022/anime-gai-xinh-51-2022-09-29-22-27.jpg"));
        list.add(new Client("nguyễn văn c", "12/12/2014","yên bái", "https://luv.vn/wp-content/uploads/2022/02/anime-gai-xinh-50.jpg"));
    }



    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    showListClient(request,response);
    }

    public void showListClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        req.setAttribute("Clients",list);
        req.getRequestDispatcher("/ListClient.jsp").forward(req,resp);
    }

}