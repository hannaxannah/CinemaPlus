package mypage.model;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;


@Component("myPageDao")
public class MypageDao {

private String namespace = "member.model.MemberBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MemberBean GetMypageById(String member_id) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".GetMypageById",member_id);
		return mb;
	}

}//MypageDao클래스
