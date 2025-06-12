package dao;
import model.User;
import util.SecurityUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImp implements UserDao {
    private static final List<User> users = new ArrayList<>();
    LocalDateTime lastLoginTime = LocalDateTime.now();
    static {
        // 初始化测试用户（使用加密后的密码）
        users.add(new User("admin",
                SecurityUtils.encryptSHA256("123456"),
                "admin@test.com",
                "男",LocalDateTime.now()));
        users.add(new User("1",
                SecurityUtils.encryptSHA256("1"),
                "admin@test.com",
                "男",LocalDateTime.now()));
    }

    @Override
    public List<User> getUsersList() {
        return new ArrayList<>(users); // 返回副本保护原始数据
    }

    @Override
    public boolean insertOneUser(User u) {
        boolean flag = true;

        for(int i = 0; i<users.size(); i++)
            if(u.getUsername().equals(users.get(i).getUsername())) {
                flag = false;
                System.out.println("用户存在");
                break;
            }
        if(flag){
            users.add(u);
            System.out.println();
            System.out.println();
        }
        return users.add(u);
    }


    @Override
    public void addUser(User user) {
        System.out.println("[DAO] 添加用户: " + user);
        users.add(user);
    }

    @Override
    public boolean existsByUsername(String username) {
        return users.stream()
                .anyMatch(u -> u.getUsername().equalsIgnoreCase(username.trim()));
    }
}