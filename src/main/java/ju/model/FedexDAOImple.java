package ju.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.FedexDTO;

public class FedexDAOImple implements FedexDAO {

private SqlSessionTemplate sqlMap;
	
	public FedexDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<FedexDTO> fedexBeforeList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<FedexDTO> list = sqlMap.selectList("fdSELBefore",map);
		return list;
	}
	
	public List<FedexDTO> fedexAfterList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<FedexDTO> list = sqlMap.selectList("fdSELAfter",map);
		return list;
	}
	
	public int beforeCnt(){
		int count = sqlMap.selectOne("beforeCnt");
		return count;
	}
	
	public int afterCnt(){
		int count = sqlMap.selectOne("afterCnt");
		return count;
	}
	
	public int fedexCheckOut(FedexDTO dto, String fedex_idx){
		Map<String,Object> fdMap=new HashMap<String,Object>();
		fdMap.put("dto", dto);
		fdMap.put("fedex_idx",fedex_idx);
		System.out.println(fedex_idx);
		int result = sqlMap.insert("fdINSAdd",fdMap);
		return result;
	}
	
	public int fedexDel(String bk_idx){
		System.out.println("택배반납임플");
		int result = sqlMap.delete("feDEL",bk_idx);
		return result;
	}
	
}
