package shop.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
//公告
@Entity
@Table(name="t_Gonggao")
public class Gonggao {

	@Id
	@GeneratedValue
	private int id;
	
	private String biaoti ;//标题

	@Column(name="neirong", columnDefinition="TEXT")
	private String neirong;//内容
	
	private String createtime;//添加时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getNeirong() {
		return neirong;
	}

	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	
	
	
}
