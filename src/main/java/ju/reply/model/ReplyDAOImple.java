package ju.reply.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.ReplyDTO;

public class ReplyDAOImple implements ReplyDAO{
	
	public SqlSessionTemplate sqlMap;

	public ReplyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<ReplyDTO> relpyList(String idx) {
		List<ReplyDTO> list = sqlMap.selectList("replyList", idx);
		return list;
	}
	public int replyWrite(ReplyDTO dto) {
		int count = sqlMap.insert("replyWrite", dto);
		return count;
	}
	public int totalCount() {
		int count = sqlMap.selectOne("totalCount");
		return count;
	}
	public int replyDelete(String reply_idx) {
		int count = sqlMap.delete("replyDelete", reply_idx);
		return count;
	}
}
