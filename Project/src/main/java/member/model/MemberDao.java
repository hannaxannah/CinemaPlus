package member.model;


import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import utility.Paging;

@Component
@Repository
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


	public List<MemberBean> getMemberList(Paging pageInfo, Map<String, String> map) {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		return lists;
	}

	/* 로그인 */
	public MemberBean getMemberById(String input_id) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".GetMemberById",input_id);
		return mb;
	}

	/* 삭제 */
	public int deleteMember(String member_id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteMember",member_id);
		return cnt;
	}


	/* 수정 */
	public MemberBean GetMemberById(String member_id) {
		MemberBean member = new MemberBean();
		member = sqlSessionTemplate.selectOne(namespace+".GetMemberByMyId",member_id); 
		return member;
	}
	
	
	public int updateMember(MemberBean mb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateMyMember", mb);
		System.out.println("cnt:" + cnt);
		return cnt;
	}



	public MemberBean getMemberByEmail(String email) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".GetMemberByEmail",email);
		return mb;
	}


	/* 아이디찾기 */
	public MemberBean findId(MemberBean mbid) {
		MemberBean m_id = sqlSessionTemplate.selectOne(namespace+".FindId",mbid);
		return m_id;
	}
	
	/*비밀번호찾기*/
	public MemberBean findPw(MemberBean mbpw) {
		MemberBean m_pw = sqlSessionTemplate.selectOne(namespace+".FindPw",mbpw);
		return m_pw;
	}


	public int getMemberTotal() {
		int total = sqlSessionTemplate.selectOne(namespace+".GetMemberTotal");
		return total;
	}


	public List<MemberBean> getAllMember() {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllMember");
		return lists;
	}

	/* 회원가입 */
	public String findId(String id) {
		String m_id = sqlSessionTemplate.selectOne(namespace+".FindIdById",id);
		return m_id;
	}
	
	/* 스토어 상품 결제시 회원아이디와 point를 받아서 보유 포인트에 더함 */
	public int updateUserPoint(MemberBean memberBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdateUserPoint",memberBean);
		
		return cnt;
	}
	
}