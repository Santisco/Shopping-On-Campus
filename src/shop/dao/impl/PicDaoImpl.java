package shop.dao.impl;

import java.sql.SQLException;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.dao.PicDao;
import shop.model.Pic;












public class PicDaoImpl extends HibernateDaoSupport implements  PicDao{


	public void deleteBean(Pic bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Pic bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Pic selectBean(String where) {
		List<Pic> list = this.getHibernateTemplate().find("from Pic " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Pic "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Pic> selectBeanList(final int start,final int limit,final String where) {
		return (List<Pic>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Pic> list = session.createQuery("from Pic "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Pic bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
}
