package cn.sjxy.chapter06.session.example01.domain;

public class Student {
    private  String stuId;
    private  String stuName;
    private  String loginPwd;

    public String getStuId() {
        return stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public Student() {
    }

    public Student(String stuId, String stuName, String loginPwd) {
        this.stuId = stuId;
        this.stuName = stuName;
        this.loginPwd = loginPwd;
    }
}
