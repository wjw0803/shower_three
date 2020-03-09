package com.dj.ssm.controller.page;

import com.dj.ssm.pojo.Product;
import com.dj.ssm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/product/")
public class ProductPageController {

	@Autowired
	private ProductService productService;

	@RequestMapping("toShow")
	public String toShow() {
		return "product/show";
	}


	@RequestMapping("toAdd")
	public String toAdd(Model model) {
		try {
			return "product/add";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("toUpd/{id}")
	public String toUpd(@PathVariable Integer id, Model model) {
		try {
			Product product = productService.findProductById(id);
			model.addAttribute("product", product);
			return "product/update";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("productShow")
	public String productShow(HttpSession session) {
		if (StringUtils.isEmpty(session.getAttribute("user"))) {
			return "user/login";
		}
		return "product/show2";
	}

}