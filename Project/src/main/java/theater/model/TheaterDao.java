package theater.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myTheaterDao")
public class TheaterDao {
	
	private String namespace = "theater.model.TheaterBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<LocationBean> getAllTheaterLocation() {		
		List<LocationBean> lists = new ArrayList<LocationBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllTheaterLocation");
		
		return lists;
	}

	public List<String> getAllTheaterArea() {
		List<String> area = new ArrayList<String>();
		area = sqlSessionTemplate.selectList(namespace+".GetAllTheaterArea");
		
		return area;
	}

	public List<String> getAllTheaterBranch(String area) {
		List<String> branch = new ArrayList<String>();
		branch = sqlSessionTemplate.selectList(namespace+".GetTheaterBranchByArea", area);
		
		return branch;
	}
}
