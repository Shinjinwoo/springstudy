package com.example.springstudy.controller;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import org.springframework.web.bind.annotation.RequestParam;
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
    public String hello(Model model) {

        System.out.println("test22");
        String msg = "민지야 안녕 하루종일 코딩 한다고 섭섭했지 하루종일 서버 판다고 바빳엉 ㅎㅎㅎ" +
                " 우리 앞으로 더 행복하자 우리 민지 캬햐아에서 급체 했다고" +
                " 들었는데 아프지말아용 !";

        model.addAttribute("data",msg);

        logger.debug(":::::::::::::::::::::::::::");

        return msg;

    };

    /** @ReqeustParam **/
    @GetMapping("hello-mvc")
    public String helloMvc(@RequestParam("name") String name, Model model) {
        model.addAttribute("data",name);
        return "hello-mvc";
    }

}
