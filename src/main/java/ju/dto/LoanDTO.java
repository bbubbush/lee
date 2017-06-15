package ju.dto;

import java.util.*;

public class LoanDTO {

	private String lb_idx;
	private String mem_idx;
	private String book_idx;
	private Date lb_sd;
	private Date lb_ed;
	private String lb_etc;
	private int lb_return;
	private int lb_delay;
	private String mem_name;
	private String bk_subject;
	private String mem_id;
	private String bk_idx;
	private String bk_isbn;
	private int bk_yeyak;
	private String lb_returnStr;
	private String lb_sday;
	private String lb_eday;
	
	public LoanDTO() {
		super();
	}

	

	public LoanDTO(String lb_idx, String mem_idx, String book_idx, Date lb_sd, Date lb_ed, String lb_etc, int lb_return,
			int lb_delay, String mem_name, String bk_subject, String mem_id, String bk_idx, String bk_isbn,
			int bk_yeyak, String lb_returnStr, String lb_sday, String lb_eday) {
		super();
		this.lb_idx = lb_idx;
		this.mem_idx = mem_idx;
		this.book_idx = book_idx;
		this.lb_sd = lb_sd;
		this.lb_ed = lb_ed;
		this.lb_etc = lb_etc;
		this.lb_return = lb_return;
		this.lb_delay = lb_delay;
		this.mem_name = mem_name;
		this.bk_subject = bk_subject;
		this.mem_id = mem_id;
		this.bk_idx = bk_idx;
		this.bk_isbn = bk_isbn;
		this.bk_yeyak = bk_yeyak;
		this.lb_returnStr = lb_returnStr;
		this.lb_sday = lb_sday;
		this.lb_eday = lb_eday;
	}



	public String getLb_idx() {
		return lb_idx;
	}

	public void setLb_idx(String lb_idx) {
		this.lb_idx = lb_idx;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getBook_idx() {
		return book_idx;
	}

	public void setBook_idx(String book_idx) {
		this.book_idx = book_idx;
	}

	public Date getLb_sd() {
		return lb_sd;
	}

	public void setLb_sd(Date lb_sd) {
		this.lb_sd = lb_sd;
	}

	public Date getLb_ed() {
		return lb_ed;
	}

	public void setLb_ed(Date lb_ed) {
		this.lb_ed = lb_ed;
	}

	public String getLb_etc() {
		return lb_etc;
	}

	public void setLb_etc(String lb_etc) {
		this.lb_etc = lb_etc;
	}

	public int getLb_return() {
		return lb_return;
	}

	public void setLb_return(int lb_return) {
		this.lb_return = lb_return;
	}

	public int getLb_delay() {
		return lb_delay;
	}

	public void setLb_delay(int lb_delay) {
		this.lb_delay = lb_delay;
	}

	public String getBk_subject() {
		return bk_subject;
	}

	public void setBk_subject(String bk_subject) {
		this.bk_subject = bk_subject;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBk_idx() {
		return bk_idx;
	}

	public void setBk_idx(String bk_idx) {
		this.bk_idx = bk_idx;
	}

	public String getBk_isbn() {
		return bk_isbn;
	}

	public void setBk_isbn(String bk_isbn) {
		this.bk_isbn = bk_isbn;
	}

	public int getBk_yeyak() {
		return bk_yeyak;
	}

	public void setBk_yeyak(int bk_yeyak) {
		this.bk_yeyak = bk_yeyak;
	}

	public String getLb_returnStr() {
		return lb_returnStr;
	}

	public void setLb_returnStr(String lb_returnStr) {
		this.lb_returnStr = lb_returnStr;
	}



	public String getLb_sday() {
		return lb_sday;
	}



	public void setLb_sday(String lb_sday) {
		this.lb_sday = lb_sday;
	}



	public String getLb_eday() {
		return lb_eday;
	}



	public void setLb_eday(String lb_eday) {
		this.lb_eday = lb_eday;
	}
	
}
