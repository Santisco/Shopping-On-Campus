package shop.dao.impl;

import java.sql.SQLException;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.dao.PingjiaDao;
import shop.model.Pingjia;












public class PingjiaDaoImpl extends HibernateDaoSupport implements  PingjiaDao{


	public void deleteBean(Pingjia bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Pingjia bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Pingjia selectBean(String where) {
		List<Pingjia> list = this.getHibernateTemplate().find("from Pingjia " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Pingjia "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Pingjia> selectBeanList(final int start,final int limit,final String where) {
		return (List<Pingjia>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Pingjia> list = session.createQuery("from Pingjia "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Pingjia bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
}
