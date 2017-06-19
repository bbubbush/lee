package ju.orderbook.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.OrderbookDTO;

public class OrderbookDAOImple implements OrderbookDAO{
	
private SqlSessionTemplate sqlMap;
	
	public OrderbookDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	public List<OrderbookDTO> orderbookList(String sql) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("sql", sql);
		List<OrderbookDTO> list=sqlMap.selectList("orderbookList", map); //sql id 를 쓴다
		return list;
	}
	public int orderbookWrite(OrderbookDTO dto) {
		int result = sqlMap.insert("orderbookWrite", dto);
		return result;
	}
	public OrderbookDTO orderbookContent(String orderbook_idx) {
		OrderbookDTO dto = sqlMap.selectOne("orderbookContent", orderbook_idx);
		return dto;
	}
	public int orderbookDelete(String orderbook_idx) {
		int count=sqlMap.delete("orderbookDelete",orderbook_idx);
		return count;
	}
	public OrderbookDTO orderbookChange(String orderbook_idx) {
		// TODO Auto-generated method stub
		OrderbookDTO dto = sqlMap.selectOne("orderbookChange", orderbook_idx);
		return dto;
	}
	public int orderbookChangeOk(OrderbookDTO dto) {
		// TODO Auto-generated method stub
		int count = sqlMap.update("orderbookChangeOk", dto);
		return count;
	}
	public int orderbookTotalCount() {
		int count = sqlMap.selectOne("orderbookTotalCount");
		return count;
	}
	public String makeIdx(String tableName) {
		// TODO Auto-generated method stub
		Long unixTime=System.currentTimeMillis();
		String idx=tableName+unixTime;  //NT~로 시작하는 idx를 생성시킨다
		return idx;
	}
	
	public OrderbookDTO orderbookPreInfo(String orderbook_idx) {
		OrderbookDTO dto = sqlMap.selectOne("orderbookPreInfo", orderbook_idx);
		return dto;
	}
	
	public OrderbookDTO orderbookNextInfo(String orderbook_idx) {
		OrderbookDTO dto = sqlMap.selectOne("orderbookNextInfo", orderbook_idx);
		return dto;
	}
	public int orderbookRead(String orderbook_idx) {
		// TODO Auto-generated method stub
		int count = sqlMap.update("orderbookRead", orderbook_idx);
		return count;
	}
}
