package dao;

import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DBUtil; // ��������DBUtil��·����ȷ

import java.sql.SQLException;
import java.util.List;

/**
 * UserDao �ӿڵ�ʵ����
 * ʹ�� Apache Commons DBUtils ��������ݿ���н���
 */
public class UserDaoImpl implements UserDao {

    // �����ӳػ�ȡ����Դ������QueryRunner����
    private final QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());

    /**
     * ��ȡ�����û��б�
     * @return ���������û����б�������������û���û��򷵻�null����б�
     */
    @Override
    public List<User> getUsersList() {
        // ע�⣺�������ݿ����Ϊ 'users' �Ұ�����Userģ�Ͷ�Ӧ����
        String sql = "SELECT username, password, email, gender, lastLoginTime FROM users";
        try {
            // ʹ�� BeanListHandler �������ӳ�䵽 User ����� List ��
            return queryRunner.query(sql, new BeanListHandler<>(User.class));
        } catch (SQLException e) {
            e.printStackTrace(); // �����������н���ʹ����־��ܼ�¼����
            return null; // �򷵻� Collections.emptyList();
        }
    }

    /**
     * ����һ�����û�
     * @param user Ҫ�����User����
     * @return �������ɹ���Ӱ������ > 0�������� true�����򷵻� false
     */
    @Override
    public boolean insertOneUser(User user) {
        // SQL����е��ֶ���Ҫ�����ݿ�� 'users' ��������ȫ��Ӧ
        String sql = "INSERT INTO users (username, password, email, gender, lastLoginTime) VALUES (?, ?, ?, ?, ?)";
        try {
            int affectedRows = queryRunner.update(sql,
                    user.getUsername(),
                    user.getPassword(),
                    user.getEmail(),
                    user.getGender(),
                    user.getLastLoginTime());
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * ���һ�����û� (void ��������)
     * @param user Ҫ��ӵ�User����
     */
    @Override
    public void addUser(User user) {
        // Ϊ�˱�������ظ�������ֱ�ӵ����Ѿ�ʵ�ֵ� insertOneUser �����������䷵��ֵ
        // ���߿�����������������ʵ��һ��
        String sql = "INSERT INTO users (username, password, email, gender, lastLoginTime) VALUES (?, ?, ?, ?, ?)";
        try {
            queryRunner.update(sql,
                    user.getUsername(),
                    user.getPassword(),
                    user.getEmail(),
                    user.getGender(),
                    user.getLastLoginTime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * ����û����Ƿ����
     * @param username Ҫ�����û���
     * @return ������ڣ����� true�����򷵻� false
     */
    @Override
    public boolean existsByUsername(String username) {
        // ͨ����ѯ�����û������Ƿ�Ϊnull���ж��û��Ƿ����
        // ����ѯһ���ֶΣ����������û������Ȳ�ѯ�����ֶΣ�SELECT *������Ч
        String sql = "SELECT username FROM users WHERE username = ?";
        try {
            // BeanHandler �����ѯ��������᷵�� null
            User user = queryRunner.query(sql, new BeanHandler<>(User.class), username);
            return user != null;
        } catch (SQLException e) {
            e.printStackTrace();
            // �����쳣ʱ�����صط���false����ʾ�޷�ȷ���û�����
            return false;
        }
    }
}