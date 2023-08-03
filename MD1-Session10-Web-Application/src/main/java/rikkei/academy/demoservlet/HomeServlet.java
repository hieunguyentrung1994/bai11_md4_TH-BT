package rikkei.academy.demoservlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "homeServlet", value = "/home-servlet")
public class HomeServlet extends HttpServlet {
    public List<Product> list = new ArrayList<>();

    @Override
    public void init() throws ServletException {
       list.add(new Product(1,"Iphone11",19000000,true));
       list.add(new Product(2,"Ipad",10000000,false));
       list.add(new Product(3,"epod",30000000,true));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

//        phân tích action gửi lên là  gi
        String action = req.getParameter("action");
        if (action == null){
            showListProduct(req,resp);
        }
        else {
            switch (action) {
                case "DELETE":
                    // xóa theo id
                    list.remove(findById(Integer.parseInt(req.getParameter("id"))));
                    break;
                case "EDIT":
                    Product student = findById(Integer.parseInt(req.getParameter("id")));
                    req.setAttribute("data", student);
                    req.getRequestDispatcher("/view/editProduct.jsp").forward(req,resp);
                    break;
                case "SEARCH":
                    String search = req.getParameter("search");
                    List<Product> p = new ArrayList<>();
                    for (Product products: list) {
                        if (products.getName().toLowerCase().contains(search.toLowerCase())){
                            p.add(products);
                        }
                    }
                    req.setAttribute("products",p);
                    req.getRequestDispatcher("/view/listProduct.jsp").forward(req,resp);
                    break;
                default:
                    break;
            }
            showListProduct(req,resp);
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Vào post");
        req.setCharacterEncoding("UTF-8");

//        phân tích action gửi lên là  gi
        String action = req.getParameter("action");
        switch (action){
            case "ADD":
                // thêm mới
                String name = req.getParameter("name");
                String price = req.getParameter("price");
                boolean status = Boolean.parseBoolean(req.getParameter("status"));
                int id = getNewId();
                list.add(new Product(id,name,Integer.parseInt(price),status));
                showListProduct(req,resp);
                break;
            case "EDIT":
                // update
                name = req.getParameter("name");
                price = req.getParameter("price");
                id = Integer.parseInt(req.getParameter("id"));
                status = Boolean.parseBoolean(req.getParameter("status"));
                Product newS  = new Product(id,name,Integer.parseInt(price),status);
                list.set(list.indexOf(findById(id)),newS);
                showListProduct(req,resp);
                break;
            default:
                break;
        }
    }
    public void showListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        req.setAttribute("products",list);
        req.getRequestDispatcher("/view/listProduct.jsp").forward(req,resp);
    }
    public int getNewId(){
        int maxId =0;
        for (Product s:list) {
            if(s.getId()>maxId){
                maxId =s.getId();
            }
        }
        return maxId+1;
    }
    public Product findById(int id){
        for (Product s:list) {
            if(s.getId()==id){
               return s;
            }
        }
        return null;
    }

}
