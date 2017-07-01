package shop.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//订单表
@Entity
@Table(name="t_Dingdan")
public class Dingdan {
	
	@Id
	@GeneratedValue
	private int id;//主键

	private String status;// 订单状态 已处理 未处理 
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//关联用户的id 外键
	
	
	private  String  xiangqing;//订单详情
	
	private String orderid;//订单号
	
	private String sjname;//收件人姓名
	
	private String address;//收件人地址
	
	private String phone;//收件人手机
	
	private String beizhu;//备注

	private Date createtime;//添加时间
	
	private double zongjia;//总价

	private int deletestatus;//订单是否删除状态 0表示未删除 1表示删除  
	
	
	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public double getZongjia() {
		return zongjia;
	}

	public void setZongjia(double zongjia) {
		this.zongjia = zongjia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getSjname() {
		return sjname;
	}

	public void setSjname(String sjname) {
		this.sjname = sjname;
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

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getXiangqing() {
		return xiangqing;
	}

	public void setXiangqing(String xiangqing) {
		this.xiangqing = xiangqing;
	}

	


	
}
