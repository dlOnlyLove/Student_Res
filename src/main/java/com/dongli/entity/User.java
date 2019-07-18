package com.dongli.entity;

public class User {
    private int id;
    //用户名
    private String account;
    //用户密码
    private String password;
    //用户角色
    private int role;
    //角色状态
    private int roleState;
    //角色名称
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getRoleState() {
        return roleState;
    }

    public void setRoleState(int roleState) {
        this.roleState = roleState;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
