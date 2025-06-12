package cn.sjxy.chapter06.session.example01.domain.web.session;

import cn.sjxy.chapter06.session.example01.domain.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;


@WebServlet(value = "/")
public class StudentLoginservlet extends HttpServlet {

    private List<Student> stusList = new ArrayList<Student>();
    {
        stusList.add(new Student("1001","张三","123456"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset= utf-8");

        String stuId = request.getParameter("stuIDd");
        String stuName = request.getParameter("stuName");
        String loginPassword = request.getParameter("loginPwd");
        Map<String,String> errorFields = validateFormField(request);
        if (errorFields!=null&&errorFields.size()>0){
            request.setAttribute("errorFields",errorFields);
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }

        Student loginStu = new Student(stuId,stuName,loginPassword);
        boolean result = checkStudentLoginInfo(loginStu);
        if(result ==true){
            request.getSession().setAttribute("student",loginStu);
            request.getRequestDispatcher("/WEB-INF/stu/main.jsp").forward(request,response);
            return;
        }else{
            request.getSession().setAttribute("loginError","登录信息不正确，请重新登录");
            response.sendRedirect(request.getContextPath());

        }

    }

    private boolean checkStudentLoginInfo(Student stu){
        boolean result =false;
        for (Student s:stusList){
            if (s.getStuId().equals(stu.getStuId())){
                if(s.getStuName().equals(stu.getStuName())){
                    if(s.getLoginPwd().equals(stu.getLoginPwd())){
                        result = true;
                        break;

                    }                }
            }
        }
        return  result;
    }
    private Map<String,String> validateFormField(HttpServletRequest request){
        Map<String,String> errorFields = new HashMap<String,String>();
        Enumeration<String> fieldNames = request.getParameterNames();
        while(fieldNames.hasMoreElements()){
            String fieldName = fieldNames.nextElement();
            String fieldValue = request.getParameter(fieldName);
            if (fieldValue==null || "".contentEquals(fieldValue.trim()))
            {
                errorFields.put(fieldName,fieldName+"字段值不能为空");
            }
        }
        return errorFields;
    }
}
