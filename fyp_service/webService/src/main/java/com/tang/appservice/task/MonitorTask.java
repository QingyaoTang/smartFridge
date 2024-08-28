package com.tang.appservice.task;

import com.tang.appservice.domain.FoodInfo;
import com.tang.appservice.service.IFoodInfoService;
import com.tang.common.core.domain.entity.SysUser;
import com.tang.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.util.Date;
import java.util.List;

/**
 * 定时任务调度测试
 *
 * @author ruoyi
 */
@Component("monitorTask")
@EnableScheduling
public class MonitorTask
{

    @Autowired
    private IFoodInfoService foodInfoService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private ISysUserService userService;

   @Scheduled(cron = "0 0 1 * * ?")
//   @Scheduled(cron = "0/5 * * * * ?")
    public void checkFoodTime(){

        // current Date
        Date currentDate = new Date();

        System.out.println("timer task" + currentDate);
        final List<FoodInfo> foodInfos = foodInfoService.selectFoodInfoList(new FoodInfo());
        for (int i = 0; i < foodInfos.size(); i++) {
            FoodInfo foodInfo = foodInfos.get(i);
            if (foodInfo.getIsUsed() == 0){
                long millisInThreeDays = 3 * 24 * 60 * 60 * 1000L;
                Date datePlusThreeDays = new Date(currentDate.getTime() + millisInThreeDays);
                if (datePlusThreeDays.after(foodInfo.getQualityTime())){
                    System.out.println("Food is about to expire");
                    //sendEmail
                    if (foodInfo.getOwnerName() != null){
                        SysUser sysUser = userService.selectUserByUserName(foodInfo.getOwnerName());
                        if (sysUser != null && sysUser.getEmail() != null){
                            emailService.sendEmail(sysUser.getEmail(),"Food is about to expire",foodInfo.getFoodName() + " about to expire");

                        }
                    }
                }
            }else{
                long millisInThreeDays = 3 * 24 * 60 * 60 * 1000L;
                Date datePlusThreeDays = new Date(currentDate.getTime() + millisInThreeDays);
                if (foodInfo.getOpenTime() != null && datePlusThreeDays.after(foodInfo.getOpenTime())){
                    System.out.println("Food is about to expire");
                    //sendEmail
                    if (foodInfo.getOwnerName() != null){
                        SysUser sysUser = userService.selectUserByUserName(foodInfo.getOwnerName());
                        if (sysUser != null && sysUser.getEmail() != null){
                            emailService.sendEmail(sysUser.getEmail(),"Food is about to expire",foodInfo.getFoodName() + " about to expire");

                        }
                    }
                }
            }
        }
    }

}
