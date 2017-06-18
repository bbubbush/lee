package ju.dto;

public class ReplyDTO {
	private int reply_idx;
	private String mem_idx;
	private String reply_content;
	private String reply_cate;
	public ReplyDTO() {
		// TODO Auto-generated constructor stub
	}
	public ReplyDTO(int reply_idx, String mem_idx, String reply_content, String reply_cate) {
		super();
		this.reply_idx = reply_idx;
		this.mem_idx = mem_idx;
		this.reply_content = reply_content;
		this.reply_cate = reply_cate;
	}
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_cate() {
		return reply_cate;
	}
	public void setReply_cate(String reply_cate) {
		this.reply_cate = reply_cate;
	}
	
	
	
}
