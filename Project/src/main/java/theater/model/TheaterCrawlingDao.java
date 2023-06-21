package theater.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
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

	public int insertLocationList2(List<TheaterCrawlingBean> branch) {
		int cnt = 0;
		for(TheaterCrawlingBean tcb : branch) {
			cnt = cnt + sqlSessionTemplate.insert(namespace+".InsertLocationList2", tcb);
			System.out.println(cnt);
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

	public void getLocationList2() {
		
		List<TheaterCrawlingBean> branch = sqlSessionTemplate.selectList(namespace+".GetLocationList2");
		System.out.println("branch_list size:"+branch.size());
		for(TheaterCrawlingBean tcb : branch) {
			
			System.out.println("insert into branch values('" + tcb.getCode() + "','" + tcb.getArea_code() + "','" + tcb.getArea() + "','" + tcb.getBranch_code() + "','" + tcb.getBranch() + "','" + tcb.getAddress() + "','" + tcb.getHowtoget1() + "','" + tcb.getHowtoget2() + "');");
		}
	}
	
	public int insertBranchList(List<TheaterCrawlingBean> branch) {
		System.out.println("insertBranchList");
		int cnt = 0;
		
		for(TheaterCrawlingBean tcb : branch) {
			/*
			 * System.out.println("test"+tcb.getCode());
			 * System.out.println("test"+tcb.getArea());
			 * System.out.println("test"+tcb.getBranch());
			 * System.out.println("test"+tcb.getAddress());
			 * System.out.println("test"+tcb.getHowtoget1());
			 * System.out.println("test"+tcb.getHowtoget2());
			 */
			sqlSessionTemplate.insert(namespace+".InsertBranchList", tcb);
		}
		//sqlSessionTemplate.insert(namespace+".InsertBranchList", branch);
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
