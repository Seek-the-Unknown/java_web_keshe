package control;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/HousePostServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class HousePostServlet extends HttpServlet {
    // 修改1: 使用固定路径替代临时路径
    private static final String UPLOAD_DIR = "F:/rental_uploads"; // 修改为您的实际存储路径

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. 获取表单数据
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        int price = Integer.parseInt(request.getParameter("price"));
        int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
        int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
        double area = Double.parseDouble(request.getParameter("area"));
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String description = request.getParameter("description");
        String[] facilities = request.getParameterValues("facilities");
        String availableDate = request.getParameter("available_date");
        int minLease = Integer.parseInt(request.getParameter("min_lease"));
        int deposit = Integer.parseInt(request.getParameter("deposit"));
        String[] viewingOptions = request.getParameterValues("viewing");

        // 2. 处理文件上传
        // 修改2: 直接使用固定路径，不再使用getServletContext().getRealPath
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // 修改3: 使用mkdirs()创建多级目录
        }

        String imagePaths = "";
        for (Part part : request.getParts()) {
            if (part.getName().equals("images") && part.getSize() > 0) {
                String fileName = UUID.randomUUID().toString() +
                        getFileExtension(part.getSubmittedFileName());

                // 修改4: 使用固定路径保存文件
                String filePath = UPLOAD_DIR + File.separator + fileName;
                part.write(filePath);

                if (!imagePaths.isEmpty()) {
                    imagePaths += ",";
                }
                // 修改5: 存储相对路径或可访问的URL路径
                imagePaths += "uploads/" + fileName; // 这里假设您会配置虚拟路径映射
            }
        }

        // 3. 保存到数据库 (这里简化为打印到控制台)
        System.out.println("房源信息:");
        System.out.println("标题: " + title);
        System.out.println("类型: " + type);
        System.out.println("价格: " + price);
        System.out.println("卧室: " + bedrooms);
        System.out.println("卫生间: " + bathrooms);
        System.out.println("面积: " + area);
        System.out.println("位置: " + province + " " + city + " " + address);
        System.out.println("描述: " + description);
        System.out.println("设施: " + String.join(", ", facilities));
        System.out.println("可租日期: " + availableDate);
        System.out.println("最短租期: " + minLease + "个月");
        System.out.println("押金: " + deposit + "个月租金");
        System.out.println("看房方式: " + String.join(", ", viewingOptions));
        System.out.println("图片路径: " + imagePaths);
        System.out.println("图片存储路径: " + UPLOAD_DIR);

        // 4. 重定向到成功页面
        response.sendRedirect(request.getContextPath() + "/rental/post_success.jsp");
    }

    private String getFileExtension(String fileName) {
        if (fileName == null || fileName.isEmpty()) {
            return "";
        }
        int dotIndex = fileName.lastIndexOf('.');
        return (dotIndex == -1) ? "" : fileName.substring(dotIndex);
    }
}