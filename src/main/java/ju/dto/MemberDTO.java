package ju.dto;

public class MemberDTO {

	private String mem_idx;
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_hp;
	private String mem_addr;
	private int mem_hint;
	private String mem_answer;
	private String mem_birth;
	private int mem_like;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(String mem_idx, String mem_id, String mem_pwd, String mem_name, String mem_hp, String mem_addr,
			int mem_hint, String mem_answer, String mem_birth, int mem_like) {
		super();
		this.mem_idx = mem_idx;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_name = mem_name;
		this.mem_hp = mem_hp;
		this.mem_addr = mem_addr;
		this.mem_hint = mem_hint;
		this.mem_answer = mem_answer;
		this.mem_birth = mem_birth;
		this.mem_like = mem_like;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_hp() {
		return mem_hp;
	}

	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public int getMem_hint() {
		return mem_hint;
	}

	public void setMem_hint(int mem_hint) {
		this.mem_hint = mem_hint;
	}

	public String getMem_answer() {
		return mem_answer;
	}

	public void setMem_answer(String mem_answer) {
		this.mem_answer = mem_answer;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public int getMem_like() {
		return mem_like;
	}

	public void setMem_like(int mem_like) {
		this.mem_like = mem_like;
	}

	
	
}
