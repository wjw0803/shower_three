package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Product;

import java.util.List;

public interface ProductService  {


	List<Product> findAll(Product product) throws Exception;

	void add(Product product) throws Exception;

	void del(Integer[] ids, Integer isDel) throws Exception;

	//void updateStatus(Integer id, Integer status) throws Exception;

	Product findProductById(Integer id) throws Exception;

	void update(Product product) throws Exception;

	Product findByName(String pName) throws Exception;
}
