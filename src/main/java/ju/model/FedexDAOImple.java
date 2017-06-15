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

	public List<FedexDTO> fedexBeforeList() {
		List<FedexDTO> list = sqlMap.selectList("fdSELBefore");
		return list;
	}
	
	public List<FedexDTO> fedexAfterList() {
		List<FedexDTO> list = sqlMap.selectList("fdSELAfter");
		return list;
	}
	
	public int fedexCheckOut(FedexDTO dto, String fedex_idx){
		System.out.println("임플정보"+dto.getBk_idx());
		System.out.println("임플정보"+dto.getMem_idx());
		System.out.println("임플정보"+dto.getLb_idx());
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
