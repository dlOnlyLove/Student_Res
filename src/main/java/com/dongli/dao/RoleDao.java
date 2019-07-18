package com.dongli.dao;

import com.dongli.entity.Role;

import java.util.List;
import java.util.Map;

public interface RoleDao {
    Role findById(Map<String,Object> map) throws Exception;
    List<Role> selectAllRole();
    List<Role> selectRoleByName(String roleName);
}
