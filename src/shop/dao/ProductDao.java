package shop.dao;

import java.util.List;

import shop.model.Product;





public interface ProductDao  {
	
	
	
	public void insertBean(Product bean);
	
	public void deleteBean(Product bean);
	
	public void updateBean(Product bean);

	public Product selectBean(String where);
	
	public List<Product> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
