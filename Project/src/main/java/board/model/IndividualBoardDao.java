package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class IndividualBoardDao {

	private String namespace = "board.model.IndividualBoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public IndividualBoardDao() {
		System.out.println("IndividualBoardDao()");
	}
	
	/* 목록보기 검색 -  */
	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}
	
	public List<IndividualBoardBean> getBoardList(Map<String, String> map, Paging pageInfo) {
		List<IndividualBoardBean> lists = new ArrayList<IndividualBoardBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace + ".GetInBoardList", map, rowBounds);
		System.out.println("lists.size():" + lists.size());
		return lists;
	}
	
	/* 삽입하기 */
	public void InsertBoard(IndividualBoardBean board) {
		sqlSessionTemplate.insert(namespace + ".InsertInBoard", board);
	}

	public IndividualBoardBean getBoardByCode(int moviecode) {
		IndividualBoardBean board = null;
		board = sqlSessionTemplate.selectOne(namespace+".GetOneInBoard",moviecode);
		return board;
	}
	
	/* 삭제하기 */
	public int deleteInBoard(String moviecode) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteInBoard", moviecode);
		return cnt;
	}

	/* 답글쓰기 */
	public void replyInsertBoard(IndividualBoardBean board) {
		 int cnt = sqlSessionTemplate.insert(namespace + ".ReplyInsertBoard", board);
		    System.out.println("reply cnt : " + cnt);
		
	}

	/* 답글쓰기 */
	public int replyUpdateBoard(IndividualBoardBean board) {
		  int cnt = -1;
		  cnt = sqlSessionTemplate.update(namespace + ".ReplyUpdateBoard", board);
		  return cnt;
	}

	public int updateReplyBoard(IndividualBoardBean board) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".updateReplyBoard", board);
		return cnt;
	}


	/* 나의 문의내역 */
	public List<IndividualBoardBean> getBoardById(String member_id) {
		List<IndividualBoardBean> mlist = new ArrayList<IndividualBoardBean>();
		mlist = sqlSessionTemplate.selectList(namespace + ".GetOneInMyBoard", member_id);
		return mlist;
	}
	
	
}



