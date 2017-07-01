package shop.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
//商品
@Entity
@Table(name="t_product")
public class Product {

	@Id
	@GeneratedValue
	private int id;
	
	private String pname ;//商品名
	
	private String imgpath;//图片
	
	private double price1;//原价
	
	private double price2;//促销价
	
	private String createtime;//添加时间
	
	@ManyToOne
	@JoinColumn(name="cateid")
	private Category cate; //所属分类
	

	@Column(name="info", columnDefinition="TEXT")
	private String info;//简介
	
	private String tuijian;//推荐

	private int xiaoliang;//销量
	
	private int deletestatus;//是否删除状态 0表示未删除，1表示删除
	
	private int kucun;//库存数量
	
	private int haoping;//好评
	
	private int zhongping;//中评
	
	private int chaping;//差评

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public double getPrice1() {
		return price1;
	}

	public void setPrice1(double price1) {
		this.price1 = price1;
	}

	public double getPrice2() {
		return price2;
	}

	public void setPrice2(double price2) {
		this.price2 = price2;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getTuijian() {
		return tuijian;
	}

	public void setTuijian(String tuijian) {
		this.tuijian = tuijian;
	}

	public int getXiaoliang() {
		return xiaoliang;
	}

	public void setXiaoliang(int xiaoliang) {
		this.xiaoliang = xiaoliang;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public int getKucun() {
		return kucun;
	}

	public void setKucun(int kucun) {
		this.kucun = kucun;
	}

	public int getHaoping() {
		return haoping;
	}

	public void setHaoping(int haoping) {
		this.haoping = haoping;
	}

	public int getZhongping() {
		return zhongping;
	}

	public void setZhongping(int zhongping) {
		this.zhongping = zhongping;
	}

	public int getChaping() {
		return chaping;
	}

	public void setChaping(int chaping) {
		this.chaping = chaping;
	}

	
	
	
}
