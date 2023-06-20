package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import utility.Paging;

@Component("myBoardDao")
public class BoardDao {

//	private String namespace = "com.spring.model.board.BoardBean";
	private String namespace = "board.model.BoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public BoardDao() {
		System.out.println("BoardDao()");
	}
	
	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<BoardBean> getBoardList(Map<String, String> map, Paging pageInfo) {
		List<BoardBean> lists = new ArrayList<BoardBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());

		lists = sqlSessionTemplate.selectList(namespace + ".GetBoardList", map, rowBounds);
		System.out.println("lists.size():" + lists.size());
		return lists;
	}
	
	public int InsertBoard(BoardBean board) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertBoard", board);
		return cnt;
	}

	public void UpdateCount(int movienum) {
		sqlSessionTemplate.update(namespace + ".UpdateCount", movienum);
		
	}

	public BoardBean getBoardByNum(int movienum) {
		BoardBean board = null;
		board = sqlSessionTemplate.selectOne(namespace+".GetOneBoard",movienum);
		return board;
	}

	/* 번호 순 */
	public List<BoardBean> getBoardNumList(Map<String, String> map, Paging pageInfo) {
		List<BoardBean> lists = new ArrayList<BoardBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());

		lists = sqlSessionTemplate.selectList(namespace + ".getBoardNumList", map, rowBounds);
		System.out.println("lists.size():" + lists.size());
		return lists;
	}

	/* 조회수 순 */
	public List<BoardBean> getBoardHitsList(Map<String, String> map, Paging pageInfo) {
		List<BoardBean> lists = new ArrayList<BoardBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());

		lists = sqlSessionTemplate.selectList(namespace + ".getBoardHitsList", map, rowBounds);
		System.out.println("lists.size():" + lists.size());
		return lists;
	}

	/* 작성일 순 */
	public List<BoardBean> getBoardDateList(Map<String, String> map, Paging pageInfo) {
		List<BoardBean> lists = new ArrayList<BoardBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());

		lists = sqlSessionTemplate.selectList(namespace + ".getBoardDateList", map, rowBounds);
		System.out.println("lists.size():" + lists.size());
		return lists;
	}

	/* 수정폼 */
	public BoardBean GetBoardByNum(String movie_num) {
		BoardBean board = new BoardBean();
		board = sqlSessionTemplate.selectOne(namespace+".GetBoardByMyNum",movie_num); 
		return board;
	}

	/* 수정하기 */
	public int updateFaqBoard(BoardBean board) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateFaqBoard", board);
		System.out.println("cnt:" + cnt);
		return cnt;
	}

}
