package com.example.springstudy.controller;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;

@RestController
public class HelloRestController {

    @Autowired
    private WebApplicationContext appContext;

    private Logger logger = LoggerFactory.getLogger(HelloRestController.class);

    HelloRestController() {

    }

    @GetMapping("/hello")
    public String hello() {

        System.out.println("test22");

        logger.debug(":::::::::::::::::::::::::::");
        return "민지야 안녕 하루종일 코딩 한다고 섭섭했지 \n" +
                "하루종일 서버 판다고 바빳엉 ㅎㅎㅎ 우리 앞으로 더 행복하자 \n" +
                "우리 민지 캬햐아에서 급체 했다고 들었는데 아프지말아용 !";

    };
}
