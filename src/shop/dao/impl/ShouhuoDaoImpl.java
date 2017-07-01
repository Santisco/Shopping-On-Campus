package shop.dao.impl;

import java.sql.SQLException;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.dao.ShouhuoDao;
import shop.model.Shouhuo;












public class ShouhuoDaoImpl extends HibernateDaoSupport implements  ShouhuoDao{


	public void deleteBean(Shouhuo bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Shouhuo bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Shouhuo selectBean(String where) {
		List<Shouhuo> list = this.getHibernateTemplate().find("from Shouhuo " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Shouhuo "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Shouhuo> selectBeanList(final int start,final int limit,final String where) {
		return (List<Shouhuo>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Shouhuo> list = session.createQuery("from Shouhuo "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Shouhuo bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
}
