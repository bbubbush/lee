package ju.dto;
import java.util.*;

public class YeyakDTO {

	private String ye_idx;
	private String bk_isbn;
	private String mem_idx;
	private Date ye_date;
	private int ye_sunbun;
	private String mem_name;
	
	public YeyakDTO() {
		super();
	}

	public YeyakDTO(String ye_idx, String bk_isbn, String mem_idx, Date ye_date, int ye_sunbun, String mem_name) {
		super();
		this.ye_idx = ye_idx;
		this.bk_isbn = bk_isbn;
		this.mem_idx = mem_idx;
		this.ye_date = ye_date;
		this.ye_sunbun = ye_sunbun;
		this.mem_name = mem_name;
	}

	public String getYe_idx() {
		return ye_idx;
	}

	public void setYe_idx(String ye_idx) {
		this.ye_idx = ye_idx;
	}

	public String getBk_isbn() {
		return bk_isbn;
	}

	public void setBk_isbn(String bk_isbn) {
		this.bk_isbn = bk_isbn;
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

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	
	
}
