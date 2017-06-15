package ju.dto;

public class RefRoomDTO {
	
	private String rr_idx;
	private int rr_cate;
	private int rr_seatno;
	private String mem_idx;
	private java.util.Date rr_start;
	private java.util.Date rr_end;
	private String rr_add;
	private java.util.Date rr_date;
	
	public RefRoomDTO() {
		// TODO Auto-generated constructor stub
	}

	public RefRoomDTO(String rr_idx, int rr_cate, int rr_seatno, String mem_idx, java.util.Date rr_start, java.util.Date rr_end,
			String rr_add, java.util.Date rr_date) {
		super();
		this.rr_idx = rr_idx;
		this.rr_cate = rr_cate;
		this.rr_seatno = rr_seatno;
		this.mem_idx = mem_idx;
		this.rr_start = rr_start;
		this.rr_end = rr_end;
		this.rr_add = rr_add;
		this.rr_date = rr_date;
	}

	public String getRr_idx() {
		return rr_idx;
	}

	public void setRr_idx(String rr_idx) {
		this.rr_idx = rr_idx;
	}

	public int getRr_cate() {
		return rr_cate;
	}

	public void setRr_cate(int rr_cate) {
		this.rr_cate = rr_cate;
	}

	public int getRr_seatno() {
		return rr_seatno;
	}

	public void setRr_seatno(int rr_seatno) {
		this.rr_seatno = rr_seatno;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public java.util.Date getRr_start() {
		return rr_start;
	}

	public void setRr_start(java.util.Date rr_start) {
		this.rr_start = rr_start;
	}

	public java.util.Date getRr_end() {
		return rr_end;
	}

	public void setRr_end(java.util.Date rr_end) {
		this.rr_end = rr_end;
	}

	public String getRr_add() {
		return rr_add;
	}

	public void setRr_add(String rr_add) {
		this.rr_add = rr_add;
	}

	public java.util.Date getRr_date() {
		return rr_date;
	}

	public void setRr_date(java.util.Date rr_date) {
		this.rr_date = rr_date;
	}
	
	
}
