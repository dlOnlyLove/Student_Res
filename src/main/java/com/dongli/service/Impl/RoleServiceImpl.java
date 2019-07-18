package com.dongli.service.Impl;

import com.dongli.dao.RoleDao;
import com.dongli.entity.Role;
import com.dongli.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDao roleDao;
    @Override
    public Role findById(Map<String, Object> map) throws Exception{
        return roleDao.findById(map);
    }

    public List<Role> selectAllRole() {
        return roleDao.selectAllRole();
    }

    public List<Role> selectRoleByName(String roleName) {
        return roleDao.selectRoleByName(roleName);
    }
}
