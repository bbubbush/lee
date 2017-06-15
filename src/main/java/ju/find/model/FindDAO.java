package ju.find.model;

import java.util.List;

import ju.dto.FindDTO;

public interface FindDAO {

	public List<FindDTO> bkList(String sql);
	public List<FindDTO> bkView(String bk_idx);
	public int totalPages(String sql);
	public List<Integer> bkRefresh(String bk_idx);
	public int bkYeyak(String ye_idx, String bk_idx, String mem_id, int ye_sunbun);
	public int chkYeyak(String mem_id, String bk_idx);
	public int yeyakSunbun(String bk_idx);
	public String getIdx(String tableName);
	public int getCountYeyak(String mem_id);
	public int getTotalCountLoan(String mem_id);
	public int bkFedex(String fedex_idx ,String mem_id, String bk_id);
	public List<String> chkBook(String bk_subject);
	public int sumBktake(String bk_subject);
	public int countBkSubject(String bk_subject);
	public int chkLoanbook(String bk_idx);
	public int chkFedexbook(String bk_idx);
	
}
