package ju.model;
import java.util.*;
import ju.dto.*;

public interface SubjectDAO {

	public int classAdd(SubjectDTO dto);
	public List<SubjectDTO> classList();
	public List<SubjectDTO> classList(int cp, int ls);
	public List<SubjectDTO> memberCheck(String sj_idx);
	public List<SubjectDTO> teacherInfo(String tc_idx);
	public int classNum(String tc_idx);
	public int classEnd(String tc_idx);
	public int classtotalCnt();
}
