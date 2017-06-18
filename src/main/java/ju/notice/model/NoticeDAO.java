package ju.notice.model;

import java.util.*;
import ju.dto.NoticeDTO;
import ju.dto.QnaDTO;

public interface NoticeDAO {
	

	public List<NoticeDTO> noticeList(String sql);
	public int noticeWrite(NoticeDTO dto);
	public NoticeDTO noticeContent(String nt_idx);
	public int noticeDelete(String nt_idx);
	public NoticeDTO noticeChange(String nt_idx);
	public int noticeChangeOk(NoticeDTO dto);
	public NoticeDTO noticePreInfo(String nt_idx);
	public NoticeDTO noticeNextInfo(String nt_idx);
	public int noticeTotalCount();
	public int noticeRead(String nt_idx);

}
