package shop.dao.impl;

import java.sql.SQLException;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.dao.DingdanDao;
import shop.model.Dingdan;












public class DingdanDaoImpl extends HibernateDaoSupport implements  DingdanDao{


	public void deleteBean(Dingdan bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Dingdan bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Dingdan selectBean(String where) {
		List<Dingdan> list = this.getHibernateTemplate().find("from Dingdan " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Dingdan "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Dingdan> selectBeanList(final int start,final int limit,final String where) {
		return (List<Dingdan>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Dingdan> list = session.createQuery("from Dingdan "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Dingdan bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
}
