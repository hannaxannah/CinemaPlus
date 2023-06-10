package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

}
