package ju.find.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.FindDTO;

public class FindDAOImple implements FindDAO{
	private SqlSessionTemplate sqlMap;
	
	public FindDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	/*도서보기*/
	public List<FindDTO> bkView(String bk_subject) {
		List<FindDTO> dto = sqlMap.selectList("bkView", bk_subject);
		return dto;
	}
	
	/*도서목록*/
	public List<FindDTO> bkList(String sql) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sql", sql);
		List<FindDTO> list = sqlMap.selectList("bkList", map);
		return list;
	}
	
	/*총 게시글 수*/
	public int totalPages(String sql) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sql", sql);
		List<Integer> list = sqlMap.selectList("totalPages", map);
		int count = 0;
		if(list.get(0)!=null){
			count = list.get(0);
		}
		return count;
	}
	/*대출가능여부조회*/
	public List<Integer> bkRefresh(String bk_subject) {
		List<Integer> list = sqlMap.selectList("bkRefresh", bk_subject);
		return list;
	}
	
	/*대출예약*/
	public int bkYeyak(String ye_idx, String bk_idx, String mem_id, int ye_sunbun) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ye_idx", ye_idx);
		map.put("bk_idx", bk_idx);
		map.put("mem_id", mem_id);
		map.put("ye_sunbun", ye_sunbun);
		int count = sqlMap.insert("bkYeyak", map);
		return count;
	}
	
	/*해당 도서를 예약 했는지 확인*/
	public int chkYeyak(String mem_id, String bk_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("bk_idx", bk_idx);
		int count = sqlMap.selectOne("chkYeyak", map);
		return count;
	}
	
	/*도서에 대해 예약된 순번 확인*/
	public int yeyakSunbun(String bk_idx) {
		int count = sqlMap.selectOne("yeyakSunbun", bk_idx);
		return count;
	}
	
	/*유닉스 타임, 타임스탬프*/
	public String getIdx(String tableName) {
		Long unixTime=System.currentTimeMillis();
		String s=tableName.toUpperCase()+unixTime;
		return s;
	}
	
	/*총 예약한 횟수*/
	public int getCountYeyak(String mem_id) {
		int count = sqlMap.selectOne("getCountYeyak", mem_id);
		return count;
	}
	
	/*대출건수 + 택배대출신청건수*/
	public int getTotalCountLoan(String mem_id) {
		int count = sqlMap.selectOne("getTotalCountLoan", mem_id);
		int count2 = sqlMap.selectOne("getTotalCountLoan2", mem_id);
		return count+count2;
	}
	
	public int bkFedex(String fedex_idx, String mem_id, String bk_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fedex_idx", fedex_idx);
		map.put("mem_id", mem_id);
		map.put("bk_idx", bk_idx);
		int count = sqlMap.insert("bkFedex", map);
		return count;
	}
	
	public List<String> chkBook(String bk_subject) {
		List<String> list = sqlMap.selectList("chkBook", bk_subject);
		return list;
	}
	
	public int sumBktake(String bk_subject) {
		int count = sqlMap.selectOne("sumBktake", bk_subject);
		return count;
	}
	
	public int countBkSubject(String bk_subject) {
		int count = sqlMap.selectOne("countBkSubject", bk_subject);
		return count;
	}
	
	public int chkLoanbook(String bk_idx) {
		int count = sqlMap.selectOne("chkLoanbook", bk_idx);
		int count2 = sqlMap.selectOne("chkFedexbook", bk_idx);
		return count+count2;
	}
	
	public int chkFedexbook(String bk_idx) {
		int count = sqlMap.selectOne("chkFedexbook", bk_idx);
		return count;
	}
	
	
}
