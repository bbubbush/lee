package ju.model;
import java.util.*;

import ju.dto.*;

public interface TeacherDAO {

	public int teacherAdd(TeacherDTO dto);
	public List<TeacherDTO> teacherList();
	public List<TeacherDTO> teacherList(int cp, int ls);
	public int teatotalCnt();
	
}
