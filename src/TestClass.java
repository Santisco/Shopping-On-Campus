import shop.util.*;

public class TestClass {
	public static void main(String[] args){
		System.out.println(Util.getYuefen()); //测试获取月份功能
		System.out.println(Util.getTime());	  //测试获取当前日期
		System.out.println(Util.tiaozhuan("root","cate","message"));// 组装响应的请求（适用于添加，更新）
		System.out.println(Util.tiaozhuan2("root","cate","message"));// 组装响应的请求（适用于删除）
		System.out.println(Pager.getPagerNormal(200, 60, 10,"info","info")); //标准分页工具
	}
}
 