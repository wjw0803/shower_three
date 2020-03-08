package com.dj.ssm.controller;

import com.dj.ssm.common.ResultModel;
import com.dj.ssm.pojo.Product;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.ProductService;
import com.dj.ssm.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;
    /**
     *  @Autowired
     *  private MessageService messageService;
     */


    /**
     * 商品展示
     */
    @RequestMapping("show")
    public ResultModel<Object> show(Product product, Integer pageNum) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            PageHelper.startPage(pageNum, 4);
            List<Product> list = productService.findAll(product);
            PageInfo<Product> pageInfo = new PageInfo<Product>(list);
            resultMap.put("code", 200);
            resultMap.put("data", pageInfo.getList());
            resultMap.put("totalNum", pageInfo.getPages());
            return new ResultModel<Object>().success(resultMap);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<Object>().error("服务器出错啦，请稍后重试：" + e.getMessage());
        }
    }

    /**
     * 订单展示页面
     *//*
    @RequestMapping("show2")
    public ResultModel<Object> show2(Product product, Message message, Integer pageNum, @SessionAttribute("user") User user) {
        try {if (user.getLevel() != 2) {
            List<Product> messageList = messageService.findByProductId(user.getId());
            return new ResultModel<Object>().success(messageList);
        }else{
            List<Product> messageList = messageService.findAll(product);
            return new ResultModel<Object>().success(messageList);
        }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<>().error("系统处理异常请稍后重试" + e.getMessage());
        }

    }*/
    /**
     * 增加方法
     */
    @RequestMapping("add")
    public ResultModel<Object> add(Product product, HttpSession session) {
        try {
            // 非空判断
            if (StringUtils.isEmpty(product.getpName()) || StringUtils.isEmpty(product.getPrice())
                    || StringUtils.isEmpty(product.getMessage())) {
                return new ResultModel<Object>().error("信息不完整");
            }
            productService.add(product);
            return new ResultModel<Object>().success("新增成功");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<Object>().error("服务器出错啦，请稍后重试：" + e.getMessage());
        }
    }
    /**
     * 商品名去重方法
     *
     */
    @RequestMapping("findByName")
    public boolean findByName(String pName) {
        try {
            Product pName1 = productService.findByName(pName);
            return pName1 == null ? true : false;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }

    }

    /**
     * 伪删除
     */
    @RequestMapping("del")
    public ResultModel<Object> del(Integer[] ids, Integer isDel) {
        try {
            productService.del(ids, isDel);
            return new ResultModel<Object>().success("删除成功");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<Object>().error("服务器出错啦，请稍后重试：" + e.getMessage());
        }
    }

    /**
     * 上架/下架
     */
    @RequestMapping("updateStatus")
    public ResultModel<Object> updateStatus(Product product) {
        try {
            productService.update(product);
            return new ResultModel<Object>().success("修改成功");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<Object>().error("服务器出错啦，请稍后重试：" + e.getMessage());
        }
    }

    /**
     * 修改
     */
    @RequestMapping("update")
    public ResultModel<Object> update(Product product) {
        try {
            productService.update(product);
            return new ResultModel<Object>().success("修改成功");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<Object>().error("服务器出错啦，请稍后重试：" + e.getMessage());
        }
    }

    @RequestMapping("purchase")
    public ResultModel<Object> purchase(Product product, Integer id, Double price, @SessionAttribute("user") User user) {
        try {
            BigDecimal AccountMoney = new BigDecimal( user.getAccountMoney());
            BigDecimal price1 = new BigDecimal(price);
            System.out.println(Double.valueOf(String.valueOf(AccountMoney.subtract(price1))));
            user.setAccountMoney(Double.valueOf(String.valueOf(AccountMoney.subtract(price1))));
            userService.updateUser(user);

/*
            Message message = new Message();
            message.setProductId(id).setCreateUserId(user.getId());
            messageService.addMessage(message);*/
            return new ResultModel<Object>().success("购买成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("系统处理异常请稍后重试" + e.getMessage());
        }
    }

}

