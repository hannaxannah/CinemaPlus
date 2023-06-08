package member.model;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myMemberDao")
public class MemberDao {
	private String namespace = "member.model.MemberBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public int insertMember(MemberBean mb) {
		System.out.println("mb.getMember_id():"+mb.getMember_id());
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertMember", mb);

		return cnt;
	}


	public boolean searchId(String inputid) {
		boolean flag = false;
		
		int cnt = sqlSessionTemplate.selectOne(namespace + ".CheckId",inputid);
		if(cnt > 0 ) {
			flag = true;
		}
		return flag;
	}


	public MemberBean getMovieByCode(String member_code) {
		MemberBean member = null;
		member = sqlSessionTemplate.selectOne(namespace+".GetMovieByCode",member_code);
		return member;
		
	}


	public int getTotalCount(Map<String, String> map) {
		int cnt = 0;
		cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		System.out.println("GetTotalCount cnt:" + cnt);
		
		return cnt;
	}


	public List<MemberBean> getAllMember(Paging pageInfo, Map<String, String> map) {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		return lists;
	}


	public MemberBean getMemberById(String input_id) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".GetMemberById",input_id);
		return mb;
	}



	

}