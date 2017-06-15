package ju.model;
import java.util.*;
import ju.dto.*;

public interface BookDAO {

	public List<BookDTO> bookList(int cp, int ls); // 일반도서 목록 가져오는 리스트
	public List<BookDTO> bookUpList(int cp, int ls); // 일반도서 목록 가져오는 리스트
	public List<BookDTO> bookDownList(int cp, int ls); // 일반도서 목록 가져오는 리스트
	public BookDTO bookInfo(String bk_idx, String mem_idx); // 일반도서 정보
	public BookDTO bookInfo(String bk_idx);
	public BookDTO bookReInfo(String bk_idx);
	public int getTotlaCnt();
	public int bookDuple(BookDTO dto);
	public int bookInfoUpdate(int bk_break,String bk_idx);
	public int bookTakeUpdate(String bk_idx);
	public int bookReUpdate(String bk_idx);
	public int bookAdd(BookDTO dto);
	public int bookDel(String bk_idx);
	
}
