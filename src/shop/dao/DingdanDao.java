package shop.dao;

import java.util.List;

import shop.model.Dingdan;





public interface DingdanDao  {
	
	
	
	public void insertBean(Dingdan bean);
	
	public void deleteBean(Dingdan bean);
	
	public void updateBean(Dingdan bean);

	public Dingdan selectBean(String where);
	
	public List<Dingdan> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
