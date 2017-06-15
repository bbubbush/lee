package ju.page;

public class PageModule {

	/**페이징 메서드
	 * totalCnt = 총 게시글 수
	 * listSize = 한번에 보여줄 게시글 수
	 * pageSize = 페이지 크기
	 * cp = 현재 페이지*/
	public static String pageMake(String pageName, int totalCnt, int listSize, int pageSize, int cp){
		
		StringBuffer sb = new StringBuffer();
		
		
		int totalPage = (totalCnt / listSize) + 1; 
		if(totalCnt%listSize==0) totalPage--;

		int userGroup = cp/pageSize;
		if(cp%pageSize==0) userGroup--;
		
		if(userGroup!=0){
			sb.append("<li><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp =(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a></li>");
		}
		
		for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
			sb.append("&nbsp;<li><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>&nbsp;");
			
			if(i==totalPage)break;
		}
		
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<li><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a></li>");
		}
		return sb.toString();
	}
}
