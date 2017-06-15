package ju.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.*;

public class YeyakDAOImple implements YeyakDAO {

private SqlSessionTemplate sqlMap;
	
	public YeyakDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<YeyakDTO> yeyakList(String bk_isbn) {
		List<YeyakDTO> list = sqlMap.selectList("yeSELList",bk_isbn);
		System.out.println(list);
		return list;
	}
	
	public int yeyakOne(String bk_isbn) {
		int count = sqlMap.selectOne("yeSELSun",bk_isbn);
		return count;
	}
	
	public YeyakDTO yeyakSunbun(String bk_isbn) {
		System.out.println("예약된책확인");
		YeyakDTO dto = sqlMap.selectOne("yeSELIsbn",bk_isbn);
		System.out.println("첫번째dto:"+dto);
		if(dto==null){
			dto = new YeyakDTO();
		}
		System.out.println("생성dto:"+dto);
		return dto;
	}
	
	public int yeyakUp(String bk_isbn) {
		int result = sqlMap.insert("yeUPSun",bk_isbn);
		return result;
	}
	
	public int yeyakDel(String mem_idx) {
		int result = sqlMap.insert("yeDEL",mem_idx);
		return result;
	}

	
	
}
