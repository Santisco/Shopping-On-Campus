package shop.dao;

import java.util.List;

import shop.model.Category;





public interface CategoryDao  {
	
	
	
	public void insertBean(Category bean);
	
	public void deleteBean(Category bean);
	
	public void updateBean(Category bean);

	public Category selectBean(String where);
	
	public List<Category> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
