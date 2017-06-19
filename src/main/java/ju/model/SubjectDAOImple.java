package ju.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.*;

import ju.dto.SubjectDTO;

public class SubjectDAOImple implements SubjectDAO {

private SqlSessionTemplate sqlMap;
	
	public SubjectDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int classAdd(SubjectDTO dto) {
		int result = sqlMap.insert("classINSClass",dto);
		return result;
	}
	
	public List<SubjectDTO> classList(){
		List<SubjectDTO> list = sqlMap.selectList("classSELClass");
		return list;
	}
	
	public List<SubjectDTO> classList(int cp, int ls){
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<SubjectDTO> list = sqlMap.selectList("classSELClassP",map);
		return list;
	}
	
	public List<SubjectDTO> memberCheck(String sj_idx){
		List<SubjectDTO> list = sqlMap.selectList("classSELMember",sj_idx);
		return list;
	}
	
	public List<SubjectDTO> teacherInfo(String tc_idx){
		List<SubjectDTO> list = sqlMap.selectList("classSELInfo",tc_idx);
		return list;
	}
	
	public int classtotalCnt(){
		int count = sqlMap.selectOne("classtotalCnt");
		return count;
	}
	
	public int classNum(String tc_idx){
		int result = sqlMap.selectOne("classSELNum",tc_idx);
		return result;
	}
	
	public int classEnd(String tc_idx){
		int result = sqlMap.selectOne("classSELEnd",tc_idx);
		return result;
	}

}
