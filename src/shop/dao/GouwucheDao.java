package shop.dao;

import java.util.List;

import shop.model.Gouwuche;





public interface GouwucheDao  {
	
	
	
	public void insertBean(Gouwuche bean);
	
	public void deleteBean(Gouwuche bean);
	
	public void updateBean(Gouwuche bean);

	public Gouwuche selectBean(String where);
	
	public List<Gouwuche> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
