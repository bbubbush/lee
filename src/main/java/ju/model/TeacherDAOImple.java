package ju.model;

import java.util.*;
import ju.dto.*;

import org.mybatis.spring.SqlSessionTemplate;

public class TeacherDAOImple implements TeacherDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public TeacherDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int teacherAdd(TeacherDTO dto) {
		int result = sqlMap.insert("classINSTeacher",dto);
		return result;
	}
	
	public List<TeacherDTO> teacherList(){
		List<TeacherDTO> list = sqlMap.selectList("classSELTeacher");
		return list;
	}

	public List<TeacherDTO> teacherList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);

		List<TeacherDTO> list = sqlMap.selectList("classSELTeacherP",map);
		return list;
	}
	
	public int teatotalCnt(){
		int count = sqlMap.selectOne("teatotalCnt");
		return count;
	}

}
