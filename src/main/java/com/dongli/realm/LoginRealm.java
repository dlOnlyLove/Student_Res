package com.dongli.realm;

import com.dongli.entity.Role;
import com.dongli.entity.User;
import com.dongli.service.RoleService;
import com.dongli.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Component
public class LoginRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String account = (String)getAvailablePrincipal(principalCollection);
        Role role = null;
        Map<String, Object> map = new HashMap<>();
        map.put("account",account);
        User user = userService.selectUserByAccount(map);
        Map<String, Object> roleMap = new HashMap<>();
        roleMap.put("roleId",user.getRole());
        // 查找用户的角色
        try {
            role = roleService.findById(roleMap);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set<String> r = new HashSet<String>();
        if(role != null){
            r.add(role.getRoleName());
            info.setRoles(r);
        }
        return info;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String account = (String)token.getPrincipal();
        String password = new String((char[])token.getCredentials());
        User user;
        Map<String, Object> map = new HashMap<>();
        map.put("account",account);
        user = userService.selectUserByAccount(map);

        // 验证用户和密码
        if(user == null) {
            throw new UnknownAccountException();
        } else if(!password.equals(user.getPassword())) {
            throw new IncorrectCredentialsException();
        }

        // 查看用户状态
        if(user != null && user.getRole() == 1) {
            user = userService.selectSchoolOfUser(account);
        } else if(user != null && user.getRole() == 2) {
            user = userService.selectStudentOfUser(account);
        }

        // 用户状态锁定处理
        if(user.getRole() != 0 && user.getRoleState() == 0) {
            throw new DisabledAccountException();
        }


        AuthenticationInfo aInfo = new SimpleAuthenticationInfo(account,password,getName());
        return aInfo;
    }
}
