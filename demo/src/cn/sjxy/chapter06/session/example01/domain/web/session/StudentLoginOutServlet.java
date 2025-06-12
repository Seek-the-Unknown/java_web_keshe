package cn.sjxy.chapter06.session.example01.domain.web.session;

import cn.sjxy.chapter06.session.example01.domain.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/stu/loginOut")
public class StudentLoginOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset= utf-8");

        Student stu = (Student) request.getSession().getAttribute("student");

        request.getSession().invalidate();

        request.getServletContext().setAttribute("info", "欢迎同学["+stu.getStuName()+"]您下次光临");

        response.sendRedirect(request.getContextPath()+"/login.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
