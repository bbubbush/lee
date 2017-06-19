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
			
			sb.append("<li aria-label='Previous'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp =(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&laquo;</a></li>");
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
			sb.append("<li aria-label='Next'><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>&raquo;</a></li>");
		}
		return sb.toString();
	}
	
public static String pageMake2(String pageName, int totalCnt, int listSize, int pageSize, int cp2){
		
		StringBuffer sb = new StringBuffer();
		
		
		int totalPage = (totalCnt / listSize) + 1; 
		if(totalCnt%listSize==0) totalPage--;

		int userGroup = cp2/pageSize;
		if(cp2%pageSize==0) userGroup--;
		
		if(userGroup!=0){
			sb.append("<li><a href='");
			sb.append(pageName);
			sb.append("?cp2=");
			int temp =(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a></li>");
		}
		
		for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
			sb.append("&nbsp;<li><a href='");
			sb.append(pageName);
			sb.append("?cp2=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>&nbsp;");
			
			if(i==totalPage)break;
		}
		
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<li><a href='");
			sb.append(pageName);
			sb.append("?cp2=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a></li>");
		}
		return sb.toString();
	}
	
public static String pageMakeMemSearch(String pageName, String name, int totalCnt, int listSize, int pageSize, int cp){
		
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
			sb.append("&mem_name="+name+"'>&lt;&lt;</a></li>");
		}
		
		for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
			sb.append("&nbsp;<li><a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&mem_name="+name+"'>");
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
			sb.append("&mem_name="+name+"'>&gt;&gt;</a></li>");
		}
		return sb.toString();
	}

public static String pageMakeValueSearch(String pageName, int value, int totalCnt, int listSize, int pageSize, int cp){
	
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
		sb.append("&tagNum="+value+"'>&lt;&lt;</a></li>");
	}
	
	for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
		sb.append("&nbsp;<li><a href='");
		sb.append(pageName);
		sb.append("?cp=");
		sb.append(i);
		sb.append("&tagNum="+value+"'>");
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
		sb.append("&tagNum="+value+"'>&gt;&gt;</a></li>");
	}
	return sb.toString();
}
}
