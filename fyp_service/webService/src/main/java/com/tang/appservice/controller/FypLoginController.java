package com.tang.appservice.controller;

import com.tang.common.core.domain.AjaxResult;
import com.tang.common.core.domain.entity.SysUser;
import com.tang.common.core.domain.model.LoginBody;
import com.tang.common.core.domain.model.LoginUser;
import com.tang.common.core.domain.model.RegisterBody;
import com.tang.system.service.ISysUserService;
import com.tang.appservice.service.FypLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FypLoginController {

    @Autowired
    private FypLoginService loginService;


    @Autowired
    private ISysUserService userService;

    @PostMapping("/appservice/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        // 生成令牌
        LoginUser user = loginService.login(loginBody.getUsername(), loginBody.getPassword());
        AjaxResult ajax = AjaxResult.success(user);
        return ajax;
    }

    @PostMapping("/appservice/register")
    public AjaxResult register(@RequestBody RegisterBody registerBody) {
        // 生成令牌
        String msg = loginService.register(registerBody);
        AjaxResult ajax;
        if (msg.equals("")){
            ajax = AjaxResult.success("注册成功");
        }else{
            ajax = AjaxResult.success(msg);

        }
        return ajax;
    }
    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("appGetInfo")
    public AjaxResult getInfo(String username)
    {
        SysUser user = userService.selectUserByUserName(username);
        AjaxResult ajax = AjaxResult.success(user);
        return ajax;
    }

    @PostMapping("/appservice/bindEmail")
    public AjaxResult bindEmail(@RequestBody RegisterBody registerBody) {
        // 生成令牌
        String msg = loginService.bindEmail(registerBody);
        AjaxResult ajax;
        if (msg.equals("")){
            ajax = AjaxResult.success("注册成功");
        }else{
            ajax = AjaxResult.success(msg);
        }
        return ajax;
    }

}
