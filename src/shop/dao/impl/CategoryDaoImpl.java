package shop.dao.impl;

import java.sql.SQLException;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.dao.CategoryDao;
import shop.model.Category;












public class CategoryDaoImpl extends HibernateDaoSupport implements  CategoryDao{


	public void deleteBean(Category bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Category bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Category selectBean(String where) {
		List<Category> list = this.getHibernateTemplate().find("from Category " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Category "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Category> selectBeanList(final int start,final int limit,final String where) {
		return (List<Category>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Category> list = session.createQuery("from Category "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Category bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
}
