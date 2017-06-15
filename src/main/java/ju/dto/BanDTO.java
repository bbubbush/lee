package ju.dto;
import java.util.*;

public class BanDTO {

	private String ban_idx;
	private String mem_idx;
	private Date ban_start;
	private Date ban_end;
	private int ban_reason;
	private int ban_day;
	private int ban_period;
	private String mem_name;
	private String mem_id;
	private String ban_sday;
	private String ban_eday;
	private String ban_str;
	
	public BanDTO() {
		super();
	}

	public BanDTO(String ban_idx, String mem_idx, Date ban_start, Date ban_end, int ban_reason, int ban_day,
			int ban_period, String mem_name, String mem_id, String ban_sday, String ban_eday, String ban_str) {
		super();
		this.ban_idx = ban_idx;
		this.mem_idx = mem_idx;
		this.ban_start = ban_start;
		this.ban_end = ban_end;
		this.ban_reason = ban_reason;
		this.ban_day = ban_day;
		this.ban_period = ban_period;
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.ban_sday = ban_sday;
		this.ban_eday = ban_eday;
		this.ban_str = ban_str;
	}

	public String getBan_idx() {
		return ban_idx;
	}

	public void setBan_idx(String ban_idx) {
		this.ban_idx = ban_idx;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public Date getBan_start() {
		return ban_start;
	}

	public void setBan_start(Date ban_start) {
		this.ban_start = ban_start;
	}

	public Date getBan_end() {
		return ban_end;
	}

	public void setBan_end(Date ban_end) {
		this.ban_end = ban_end;
	}

	public int getBan_reason() {
		return ban_reason;
	}

	public void setBan_reason(int ban_reason) {
		this.ban_reason = ban_reason;
	}

	public int getBan_day() {
		return ban_day;
	}

	public void setBan_day(int ban_day) {
		this.ban_day = ban_day;
	}

	public int getBan_period() {
		return ban_period;
	}

	public void setBan_period(int ban_period) {
		this.ban_period = ban_period;
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

	public String getBan_sday() {
		return ban_sday;
	}

	public void setBan_sday(String ban_sday) {
		this.ban_sday = ban_sday;
	}

	public String getBan_eday() {
		return ban_eday;
	}

	public void setBan_eday(String ban_eday) {
		this.ban_eday = ban_eday;
	}

	public String getBan_str() {
		return ban_str;
	}

	public void setBan_str(String ban_str) {
		this.ban_str = ban_str;
	}
	
	
}
