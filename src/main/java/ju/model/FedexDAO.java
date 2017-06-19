package ju.model;
import java.util.*;
import ju.dto.*;

public interface FedexDAO {

	public List<FedexDTO> fedexBeforeList(int cp, int ls);
	public List<FedexDTO> fedexAfterList(int cp, int ls);
	public int fedexCheckOut(FedexDTO dto, String fedex_idx);
	public int fedexDel(String bk_idx);
	public int beforeCnt();
	public int afterCnt();
}
