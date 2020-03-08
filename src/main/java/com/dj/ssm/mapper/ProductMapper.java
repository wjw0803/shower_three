package com.dj.ssm.mapper;

import com.dj.ssm.pojo.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ProductMapper {
	

	//չʾ
	List<Product> findAll(Product product) throws DataAccessException;
	//����
	void add(Product product) throws DataAccessException;
	//��ɾ��
	void del(@Param("ids") Integer[] ids, @Param("isDel") Integer isDel) throws DataAccessException;
	//�ϼ��¼�
	//void updateStatus(@Param("id") Integer id, @Param("status") Integer status) throws DataAccessException;
	//ȥ�޸�
	Product findProductById(Integer id) throws DataAccessException;
	/**
	 * �޸�
	 *
	 * Title: update
	 *
	 * Description: 
	 * 
	 * @param product
	 * @throws DataAccessException
	 *
	 */
	void update(Product product) throws DataAccessException;
	/**
	 * ��Ʒ��ȥ��
	 * @Title: update
	 * @Description: TODO(����)
	 * @param product
	 * @throws Exception
	 * @date 2019-12-31 10:03:35
	 * @author liuhe
	 */
	Product findByName(String pName) throws DataAccessException;
	
}
