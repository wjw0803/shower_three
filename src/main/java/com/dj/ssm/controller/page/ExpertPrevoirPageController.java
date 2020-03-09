package com.dj.ssm.controller.page;

import com.dj.ssm.service.ExpertPrevoirService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/expertPrevoir/")
public class ExpertPrevoirPageController {

    @Autowired
    private ExpertPrevoirService expertPrevoirService;

    @RequestMapping("toShow")
    public String toShow() {
        return "/expert_prevoir/show";
    }
}

