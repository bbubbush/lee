package ju.reply.model;

import java.util.List;

import ju.dto.ReplyDTO;

public interface ReplyDAO {
	
	public List<ReplyDTO> relpyList(String idx);
	public int replyWrite(ReplyDTO dto);
	public int totalCount();
	public int replyDelete(String reply_idx);
}
