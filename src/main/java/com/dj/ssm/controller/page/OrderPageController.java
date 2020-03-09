package com.dj.ssm.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/")
public class OrderPageController {


    @RequestMapping("toShow")
    public String toShow(){
        return "order/show";
    }

}
