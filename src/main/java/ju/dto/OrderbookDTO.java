package ju.dto;

import java.sql.Date;

public class OrderbookDTO {
	private String orderbook_idx;
	private int orderbook_cate;
	private String orderbook_subject;
	private String orderbook_content;
	private Date orderbook_date;
	private String mem_idx;
	private int orderbook_readnum;
	private int orderbook_ref;
	private int orderbook_lev;
	private int orderbook_sunbun;
	
	public OrderbookDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderbookDTO(String orderbook_idx, int orderbook_cate, String orderbook_subject, String orderbook_content, Date orderbook_date, String mem_idx, int orderbook_readnum, int orderbook_ref, int orderbook_lev, int orderbook_sunbun) {
		super();
		this.orderbook_idx = orderbook_idx;
		this.orderbook_cate = orderbook_cate;
		this.orderbook_subject = orderbook_subject;
		this.orderbook_content = orderbook_content;
		this.orderbook_date = orderbook_date;
		this.mem_idx = mem_idx;
		this.orderbook_readnum = orderbook_readnum;
		this.orderbook_ref = orderbook_ref;
		this.orderbook_lev = orderbook_lev;
		this.orderbook_sunbun = orderbook_sunbun;
	}

	public String getOrderbook_idx() {
		return orderbook_idx;
	}

	public void setOrderbook_idx(String orderbook_idx) {
		this.orderbook_idx = orderbook_idx;
	}

	public int getOrderbook_cate() {
		return orderbook_cate;
	}

	public void setOrderbook_cate(int orderbook_cate) {
		this.orderbook_cate = orderbook_cate;
	}

	public String getOrderbook_subject() {
		return orderbook_subject;
	}

	public void setOrderbook_subject(String orderbook_subject) {
		this.orderbook_subject = orderbook_subject;
	}

	public String getOrderbook_content() {
		return orderbook_content;
	}

	public void setOrderbook_content(String orderbook_content) {
		this.orderbook_content = orderbook_content;
	}

	public Date getOrderbook_date() {
		return orderbook_date;
	}

	public void setOrderbook_date(Date orderbook_date) {
		this.orderbook_date = orderbook_date;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public int getOrderbook_readnum() {
		return orderbook_readnum;
	}

	public void setOrderbook_readnum(int orderbook_readnum) {
		this.orderbook_readnum = orderbook_readnum;
	}

	public int getOrderbook_ref() {
		return orderbook_ref;
	}

	public void setOrderbook_ref(int orderbook_ref) {
		this.orderbook_ref = orderbook_ref;
	}

	public int getOrderbook_lev() {
		return orderbook_lev;
	}

	public void setOrderbook_lev(int orderbook_lev) {
		this.orderbook_lev = orderbook_lev;
	}

	public int getOrderbook_sunbun() {
		return orderbook_sunbun;
	}

	public void setOrderbook_sunbun(int orderbook_sunbun) {
		this.orderbook_sunbun = orderbook_sunbun;
	}
	
	
	
	
}
