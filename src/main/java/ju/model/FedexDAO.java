package ju.model;
import java.util.*;
import ju.dto.*;

public interface FedexDAO {

	public List<FedexDTO> fedexBeforeList();
	public List<FedexDTO> fedexAfterList();
	public int fedexCheckOut(FedexDTO dto, String fedex_idx);
	public int fedexDel(String bk_idx);
}
