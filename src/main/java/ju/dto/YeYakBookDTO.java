package ju.dto;

import java.sql.Date;

public class YeYakBookDTO {
	private String ye_idx;
	private String bk_idx;
	private String mem_idx;
	private Date ye_date;
	private int ye_sunbun;
	
	public YeYakBookDTO() {
		// TODO Auto-generated constructor stub
	}

	public YeYakBookDTO(String ye_idx, String bk_idx, String mem_idx, Date ye_date, int ye_sunbun) {
		super();
		this.ye_idx = ye_idx;
		this.bk_idx = bk_idx;
		this.mem_idx = mem_idx;
		this.ye_date = ye_date;
		this.ye_sunbun = ye_sunbun;
	}

	public String getYe_idx() {
		return ye_idx;
	}

	public void setYe_idx(String ye_idx) {
		this.ye_idx = ye_idx;
	}

	public String getBk_idx() {
		return bk_idx;
	}

	public void setBk_idx(String bk_idx) {
		this.bk_idx = bk_idx;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public Date getYe_date() {
		return ye_date;
	}

	public void setYe_date(Date ye_date) {
		this.ye_date = ye_date;
	}

	public int getYe_sunbun() {
		return ye_sunbun;
	}

	public void setYe_sunbun(int ye_sunbun) {
		this.ye_sunbun = ye_sunbun;
	}
	
	
	
	
}
