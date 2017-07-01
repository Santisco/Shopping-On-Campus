package shop.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
//首页展示图片
@Entity
@Table(name="t_Pic")
public class Pic {

	@Id
	@GeneratedValue
	private int id;
	
	private String path;//图片路径
	
	private String info;//说明

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	

	
	
	
	
	
}
