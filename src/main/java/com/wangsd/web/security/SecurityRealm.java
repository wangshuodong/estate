package com.wangsd.web.security;

import com.wangsd.web.model.Users;
import com.wangsd.web.service.UsersService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 用户身份验证,授权 Realm 组件
 *
 **/
@Component(value = "securityRealm")
public class SecurityRealm extends AuthorizingRealm {

    private static final Logger logger = LogManager.getLogger(SecurityRealm.class.getName());

    @Autowired
    UsersService usersService;

    /**
     * 权限检查
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        String username = String.valueOf(principals.getPrimaryPrincipal());

//        final Account user = usersService.selectByUsername(username);
//        final List<Role> roleInfos = roleService.selectRolesByUserId(user.getId());
//        for (Role role : roleInfos) {
//            // 添加角色
//            System.err.println(role);
//            authorizationInfo.addRole(role.getRoleSign());
//
//            final List<Permission> permissions = permissionService.selectPermissionsByRoleId(role.getId());
//            for (Permission permission : permissions) {
//                // 添加权限
//                System.err.println(permission);
//                authorizationInfo.addStringPermission(permission.getPermissionSign());
//            }
//        }
        return authorizationInfo;
    }

    /**
     * 登录验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = String.valueOf(token.getPrincipal());
        String password = new String((char[]) token.getCredentials());
        Users user = new Users();
        user.setUsername(username);
        user.setPassword(password);
        // 通过数据库进行验证
        final Users authentication = usersService.authentication(user);
        if (authentication == null) {
            throw new AuthenticationException("用户名或密码错误.");
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(username, password, getName());
        return authenticationInfo;
    }

}
