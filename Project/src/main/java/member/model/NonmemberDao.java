package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myNonmemberDao")
public class NonmemberDao {
	private String namespace = "member.model.NonmemberBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getNonmemberTotal() {

		int total = sqlSessionTemplate.selectOne(namespace+".GetNonmemberTotal");
		return total;
	}

	public int insertNonmember(NonmemberBean nb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertNonmember", nb);
		return cnt;
	}


	
	
}
