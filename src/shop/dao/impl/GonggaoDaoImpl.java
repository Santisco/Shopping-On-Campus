package shop.dao.impl;

import java.sql.SQLException;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.dao.GonggaoDao;
import shop.model.Gonggao;












public class GonggaoDaoImpl extends HibernateDaoSupport implements  GonggaoDao{


	public void deleteBean(Gonggao bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Gonggao bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Gonggao selectBean(String where) {
		List<Gonggao> list = this.getHibernateTemplate().find("from Gonggao " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Gonggao "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Gonggao> selectBeanList(final int start,final int limit,final String where) {
		return (List<Gonggao>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Gonggao> list = session.createQuery("from Gonggao "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Gonggao bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
}
