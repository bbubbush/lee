package ju.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.*;

public class BookDAOImple implements BookDAO {

	private SqlSessionTemplate sqlMap;
	
	public BookDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<BookDTO> bookList(int cp, int ls){
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<BookDTO> list = sqlMap.selectList("bkSELList",map);
		return list;
	}
	
	public List<BookDTO> bookUpList(int cp, int ls){
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<BookDTO> list = sqlMap.selectList("bkSELTagUp",map);
		return list;
	}
	
	public List<BookDTO> bookDownList(int cp, int ls){
		System.out.println("다운!");
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<BookDTO> list = sqlMap.selectList("bkSELTagDown",map);
		return list;
	}

	public BookDTO bookInfo(String bk_idx,String mem_idx){
		BookDTO dto = sqlMap.selectOne("bkSELInfo",bk_idx);
		return dto;
	}
	
	public BookDTO bookInfo(String bk_idx){
		BookDTO dto = sqlMap.selectOne("bkSELInfo",bk_idx);
		return dto;
	}
	
	public int getTotlaCnt(){
		int result = sqlMap.selectOne("bktotalCnt");
		return result;
	}
	
	public BookDTO bookReInfo(String bk_idx){
		BookDTO dto = sqlMap.selectOne("bkSELReInfo",bk_idx);
		return dto;
	}
	
	public int bookDuple(BookDTO dto){
		int result = sqlMap.selectOne("bkSELDuple", dto);
		return result;
	}
	
	public int bookInfoUpdate(int bk_break,String bk_idx){
		Map<String,Object> bkMap=new HashMap<String,Object>();
		bkMap.put("bk_break", bk_break);
		bkMap.put("bk_idx",bk_idx);
		int result = sqlMap.insert("bkUPInfo",bkMap);
		return result;
	}
	
	public int bookTakeUpdate(String bk_idx){
		int result = sqlMap.insert("bkUPTake",bk_idx);
		System.out.println("책임플:"+result);
		return result;
	}
	
	public int bookReUpdate(String bk_idx){
		int result = sqlMap.insert("bkUPRe",bk_idx);
		System.out.println("책임플:"+result);
		return result;
	}
	
	public int bookAdd(BookDTO dto){
		int result = sqlMap.insert("bkINSAdd",dto);
		return result;
	}
	
	public int bookDel(String bk_idx){
		int result = sqlMap.delete("bkDELDel",bk_idx);
		return result;
	}
}
