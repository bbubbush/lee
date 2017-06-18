package ju.review.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.QnaDTO;
import ju.dto.ReviewDTO;

public class ReviewDAOImple implements ReviewDAO{
	public SqlSessionTemplate sqlMap;

	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public List<ReviewDTO> reviewList(String sql) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("sql", sql);
		List<ReviewDTO> list=sqlMap.selectList("reviewList", map); //sql id 를 쓴다
		return list;
	}
	public int reviewTotalCount() {
		// TODO Auto-generated method stub
		int count = sqlMap.selectOne("reviewTotalCount");
		return count;
	}
	public String makeIdx(String tableName) {
		// TODO Auto-generated method stub
		Long unixTime=System.currentTimeMillis();
		String idx=tableName+unixTime;  
		return idx;
	}
	
	public int reviewWrite(ReviewDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("reviewWrite", dto);
		return result;
	}
	public ReviewDTO reviewContent(String review_idx) {
		// TODO Auto-generated method stub
		return null;
	}
	public ReviewDTO reviewChange(String review_idx) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int reviewChangeOk(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int reviewDelete(String review_idx) {
		// TODO Auto-generated method stub
		return 0;
	}
	public ReviewDTO reviewNextInfo(String review_idx) {
		// TODO Auto-generated method stub
		return null;
	}
	public ReviewDTO reviewPreInfo(String review_idx) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
