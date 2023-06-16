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
	
}
