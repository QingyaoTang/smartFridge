package com.tang.appservice.service;

import com.tang.common.constant.Constants;
import com.tang.common.constant.UserConstants;
import com.tang.common.core.domain.entity.SysUser;
import com.tang.common.core.domain.model.LoginUser;
import com.tang.common.core.domain.model.RegisterBody;
import com.tang.common.exception.ServiceException;
import com.tang.common.exception.user.UserPasswordNotMatchException;
import com.tang.common.utils.DateUtils;
import com.tang.common.utils.MessageUtils;
import com.tang.common.utils.SecurityUtils;
import com.tang.common.utils.StringUtils;
import com.tang.common.utils.ip.IpUtils;
import com.tang.framework.manager.AsyncManager;
import com.tang.framework.manager.factory.AsyncFactory;
import com.tang.framework.security.context.AuthenticationContextHolder;
import com.tang.framework.web.service.TokenService;
import com.tang.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class FypLoginService {

    @Resource
    private AuthenticationManager authenticationManager;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private ISysUserService userService;

    /**
     * 登录验证
     *
     * @param username 用户名
     * @param password 密码
     * @return 结果
     */
    public LoginUser login(String username, String password)
    {
        // 验证码校验
//        validateCaptcha(username, code, uuid);
        // 登录前置校验
//        loginPreCheck(username, password);
        // 用户验证
        Authentication authentication = null;
        try
        {
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
            AuthenticationContextHolder.setContext(authenticationToken);
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(authenticationToken);
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        finally
        {
            AuthenticationContextHolder.clearContext();
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        recordLoginInfo(loginUser.getUserId());
        loginUser.setToken(tokenService.createToken(loginUser));
        // 生成token
        return loginUser;
    }

    /**
     * 记录登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(Long userId)
    {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setLoginIp(IpUtils.getIpAddr());
        sysUser.setLoginDate(DateUtils.getNowDate());
        userService.updateUserProfile(sysUser);
    }

    public String register(RegisterBody registerBody) {

        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword();
        SysUser sysUser = new SysUser();
        sysUser.setUserName(username);

        // 验证码开关
//        boolean captchaEnabled = configService.selectCaptchaEnabled();
//        if (captchaEnabled)
//        {
//            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
//        }

        if (StringUtils.isEmpty(username))
        {
            msg = "用户名不能为空";
        }
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            msg = "账户长度必须在2到20个字符之间";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        else if (!userService.checkUserNameUnique(sysUser))
        {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
        }
        else
        {
            sysUser.setNickName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag)
            {
                msg = "注册失败,请联系系统管理人员";
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }


    public String bindEmail(RegisterBody registerBody) {

        String msg = "", username = registerBody.getUsername(),password;
        String email = registerBody.getEmail();
        SysUser sysUser = new SysUser();
        sysUser.setEmail(email);
        sysUser.setUserName(username);
        password = username;
        // 验证码开关
//        boolean captchaEnabled = configService.selectCaptchaEnabled();
//        if (captchaEnabled)
//        {
//            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
//        }

        if (StringUtils.isEmpty(username))
        {
            msg = "username can not empty";
        }
        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            msg = "username between 2-20";
        }
        else if (StringUtils.isEmpty(email))
        {
            msg = "email can not empty";
        }
        else if (!userService.checkUserNameUnique(sysUser))
        {
            //msg = "保存用户'" + username + "'失败，注册账号已存在";
            SysUser resUser = userService.selectUserByUserName(sysUser.getUserName());
            resUser.setEmail(email);
            int ret = userService.updateUser(resUser);
            if (ret == 1){
                msg = "email edit success";
            }
        }
        else
        {
            sysUser.setNickName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag)
            {
                msg = "register fail";
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }


}
