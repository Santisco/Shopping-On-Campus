package shop.dao;

import java.util.List;

import shop.model.Pingjia;





public interface PingjiaDao  {
	
	
	
	public void insertBean(Pingjia bean);
	
	public void deleteBean(Pingjia bean);
	
	public void updateBean(Pingjia bean);

	public Pingjia selectBean(String where);
	
	public List<Pingjia> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
