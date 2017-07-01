package shop.dao;

import java.util.List;

import shop.model.Shouhuo;





public interface ShouhuoDao  {
	
	
	
	public void insertBean(Shouhuo bean);
	
	public void deleteBean(Shouhuo bean);
	
	public void updateBean(Shouhuo bean);

	public Shouhuo selectBean(String where);
	
	public List<Shouhuo> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
