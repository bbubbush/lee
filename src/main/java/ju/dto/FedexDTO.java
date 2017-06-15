package ju.dto;
import java.util.*;

public class FedexDTO {

	private String fedex_idx;
	private String mem_idx; //from성윤
	private String bk_idx;
	private int fedex_num;
	private String lb_idx;
	private String mem_name;
	private String bk_subject;
	private String mem_addr;
	private String mem_hp;
	private Date lb_sd;
	private Date lb_ed;
	private String dto2;
	private String lb_sday;
	private String lb_eday;
	
	public FedexDTO() {
		super();
	}

	public FedexDTO(String fedex_idx, String mem_idx, String bk_idx, int fedex_num, String lb_idx, String mem_name,
			String bk_subject, String mem_addr, String mem_hp, Date lb_sd, Date lb_ed, String dto2, String lb_sday,
			String lb_eday) {
		super();
		this.fedex_idx = fedex_idx;
		this.mem_idx = mem_idx;
		this.bk_idx = bk_idx;
		this.fedex_num = fedex_num;
		this.lb_idx = lb_idx;
		this.mem_name = mem_name;
		this.bk_subject = bk_subject;
		this.mem_addr = mem_addr;
		this.mem_hp = mem_hp;
		this.lb_sd = lb_sd;
		this.lb_ed = lb_ed;
		this.dto2 = dto2;
		this.lb_sday = lb_sday;
		this.lb_eday = lb_eday;
	}

	public String getFedex_idx() {
		return fedex_idx;
	}

	public void setFedex_idx(String fedex_idx) {
		this.fedex_idx = fedex_idx;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getBk_idx() {
		return bk_idx;
	}

	public void setBk_idx(String bk_idx) {
		this.bk_idx = bk_idx;
	}

	public int getFedex_num() {
		return fedex_num;
	}

	public void setFedex_num(int fedex_num) {
		this.fedex_num = fedex_num;
	}

	public String getLb_idx() {
		return lb_idx;
	}

	public void setLb_idx(String lb_idx) {
		this.lb_idx = lb_idx;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getBk_subject() {
		return bk_subject;
	}

	public void setBk_subject(String bk_subject) {
		this.bk_subject = bk_subject;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_hp() {
		return mem_hp;
	}

	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
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

	public String getDto2() {
		return dto2;
	}

	public void setDto2(String dto2) {
		this.dto2 = dto2;
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
