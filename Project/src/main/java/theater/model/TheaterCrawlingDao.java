package theater.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myCrawlingDao")
public class TheaterCrawlingDao {

	private String namespace = "theater.model.TheaterCrawlingBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertLocationList(List<LocationBean> branch) {
		int cnt = 0;
		for(LocationBean lb : branch) {
			cnt = cnt + sqlSessionTemplate.insert(namespace+".InsertLocationList", lb);
		}
		return cnt;
	}
	
	public void getLocationList() {
		
		List<LocationBean> branch = sqlSessionTemplate.selectList(namespace+".GetLocationList");
		System.out.println("branch_list size:"+branch.size());
		for(LocationBean lb : branch) {
			
			System.out.println("insert into location values('" + lb.getLocation_code() + "','" + lb.getArea() + "','" + lb.getBranch() + "');");
		}
	}
	
	public int insertBranchList(List<TheaterCrawlingBean> branch) {
		System.out.println("insertBranchList");
		int cnt = 0;
		
		//sqlSessionTemplate.selectOne(namespace+".SetDefineOff");
		for(TheaterCrawlingBean tcb : branch) {
			cnt = cnt + sqlSessionTemplate.insert(namespace+".InsertBranchList", tcb);
		}
		return cnt;
	}
	
	public void getBranchList() {
		
		List<TheaterCrawlingBean> branch = sqlSessionTemplate.selectList(namespace+".GetBranchList");
		System.out.println("branch_list size:"+branch.size());
		for(TheaterCrawlingBean tcb : branch) {
			
			System.out.println("insert into branch values('" + tcb.getCode() + "','" + tcb.getArea() + "','" + tcb.getBranch() + "','" + tcb.getAddress() + "','" + tcb.getHowtoget1() + "','" + tcb.getHowtoget2() + "');");
		}
	}
	
}
