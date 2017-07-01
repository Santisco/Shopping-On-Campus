package shop.model;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//评价表
@Entity
@Table(name="t_Pingjia")
public class Pingjia {
	
	@Id
	@GeneratedValue
	private int id;//主键

	
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//关联用户的id 外键
	
	
	private String orderid ;//订单id
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product product;//关联商品的id 外键
	
	
	private String pingjia;//评价
	
	private String pingyu;//评语
	
	private String createtime;//评价时间

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

	

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getPingjia() {
		return pingjia;
	}

	public void setPingjia(String pingjia) {
		this.pingjia = pingjia;
	}

	public String getPingyu() {
		return pingyu;
	}

	public void setPingyu(String pingyu) {
		this.pingyu = pingyu;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	
	


	
}
