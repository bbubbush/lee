package ju.review.model;

import java.util.List;

import ju.dto.ReviewDTO;

public interface ReviewDAO {

	public List<ReviewDTO> reviewList(String sql);
	public int reviewWrite(ReviewDTO dto);
	public ReviewDTO reviewContent(String review_idx);
	public int reviewDelete(String review_idx);
	public ReviewDTO reviewChange(String review_idx);
	public int reviewChangeOk(ReviewDTO dto);
	public int reviewTotalCount();
	public String makeIdx(String tableName);
	public ReviewDTO reviewPreInfo(String review_idx);
	public ReviewDTO reviewNextInfo(String review_idx);
}