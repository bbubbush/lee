package ju.orderbook.model;

import java.util.List;

import ju.dto.OrderbookDTO;

public interface OrderbookDAO {
	
	public List<OrderbookDTO> orderbookList(String sql);
	public int orderbookWrite(OrderbookDTO dto);
	public OrderbookDTO orderbookContent(String orderbook_idx);
	public int orderbookDelete(String orderbook_idx);
	public OrderbookDTO orderbookChange(String orderbook_idx);
	public int orderbookChangeOk(OrderbookDTO dto);
	public int orderbookTotalCount();
	public int orderbookRead(String orderbook_idx);
	public String makeIdx(String tableName);
	public OrderbookDTO orderbookPreInfo(String orderbook_idx);
	public OrderbookDTO orderbookNextInfo(String orderbook_idx);
	
}
