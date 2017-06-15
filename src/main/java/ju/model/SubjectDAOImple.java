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
	
	public List<SubjectDTO> memberCheck(String sj_idx){
		List<SubjectDTO> list = sqlMap.selectList("classSELMember",sj_idx);
		return list;
	}
	
	public List<SubjectDTO> teacherInfo(String tc_idx){
		List<SubjectDTO> list = sqlMap.selectList("classSELInfo",tc_idx);
		return list;
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
