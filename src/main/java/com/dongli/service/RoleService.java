package com.dongli.service;

import com.dongli.entity.Role;

import java.util.List;
import java.util.Map;

public interface RoleService {
    Role findById(Map<String, Object> map) throws Exception;
    List<Role> selectAllRole();
    List<Role> selectRoleByName(String roleName);
}
