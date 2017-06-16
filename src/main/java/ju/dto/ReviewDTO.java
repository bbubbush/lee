package ju.dto;

import java.sql.Date;

public class ReviewDTO {
	private String review_idx; 
	private int review_cate;
	private String review_subject; 
	private String review_content; 
	private Date review_date; 
	private String mem_idx; 
	private int review_readnum;
	private int review_ref;
	private int review_lev;
	private int review_sunbun;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}
	public ReviewDTO(String review_idx, int review_cate, String review_subject, String review_content, Date review_date, String mem_idx, int review_readnum, int review_ref, int review_lev, int review_sunbun) {
		super();
		this.review_idx = review_idx;
		this.review_cate = review_cate;
		this.review_subject = review_subject;
		this.review_content = review_content;
		this.review_date = review_date;
		this.mem_idx = mem_idx;
		this.review_readnum = review_readnum;
		this.review_ref = review_ref;
		this.review_lev = review_lev;
		this.review_sunbun = review_sunbun;
	}
	public String getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(String review_idx) {
		this.review_idx = review_idx;
	}
	public int getReview_cate() {
		return review_cate;
	}
	public void setReview_cate(int review_cate) {
		this.review_cate = review_cate;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}
	public int getReview_readnum() {
		return review_readnum;
	}
	public void setReview_readnum(int review_readnum) {
		this.review_readnum = review_readnum;
	}
	public int getReview_ref() {
		return review_ref;
	}
	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}
	public int getReview_lev() {
		return review_lev;
	}
	public void setReview_lev(int review_lev) {
		this.review_lev = review_lev;
	}
	public int getReview_sunbun() {
		return review_sunbun;
	}
	public void setReview_sunbun(int review_sunbun) {
		this.review_sunbun = review_sunbun;
	}
	
	
}
