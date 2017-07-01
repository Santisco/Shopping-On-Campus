package shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
//收货信息
@Entity
@Table(name="t_Shouhuo")
public class Shouhuo {


	

	@Id
	@GeneratedValue
	private int id;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;
	
	private String truename;//收货人姓名
	
	private String address;//收货地址
	
	private String phone;//联系电话


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	


	
	

	
}
