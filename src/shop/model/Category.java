package shop.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
//商品分类表
@Entity
@Table(name="t_cate")
public class Category {


	@Id
	@GeneratedValue
	private int id;
	
	private String catename;//商品分类名	
	
	private int deletestatus;//是否删除状态 0表示未删除，1表示删除

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	
	
	
	
}
