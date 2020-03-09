package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.ProductMapper;
import com.dj.ssm.pojo.Product;
import com.dj.ssm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl  implements ProductService {

	@Autowired
	private ProductMapper productMapper;



	@Override
	public List<Product> findAll(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.findAll(product);
	}



	@Override
	public void add(Product product) throws Exception {
		// TODO Auto-generated method stub
		productMapper.add(product);
	}



	@Override
	public void del(Integer[] ids, Integer isDel) throws Exception {
		// TODO Auto-generated method stub
		productMapper.del(ids, isDel);
	}


	@Override
	public Product findProductById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.findProductById(id);
	}



	@Override
	public void update(Product product) throws Exception {
		// TODO Auto-generated method stub
		productMapper.update(product);
	}



	@Override
	public Product findByName(String pName) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.findByName(pName);
	}


	
}
