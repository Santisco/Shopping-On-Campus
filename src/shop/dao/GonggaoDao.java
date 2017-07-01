package shop.dao;

import java.util.List;

import shop.model.Gonggao;





public interface GonggaoDao  {
	
	
	
	public void insertBean(Gonggao bean);
	
	public void deleteBean(Gonggao bean);
	
	public void updateBean(Gonggao bean);

	public Gonggao selectBean(String where);
	
	public List<Gonggao> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
