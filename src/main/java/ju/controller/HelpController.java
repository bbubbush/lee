package ju.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.MissingDTO;
import ju.dto.NoticeDTO;
import ju.dto.OrderbookDTO;
import ju.dto.QnaDTO;
import ju.dto.ReplyDTO;
import ju.dto.ReviewDTO;
import ju.missing.model.MissingDAO;
import ju.notice.model.NoticeDAO;
import ju.orderbook.model.OrderbookDAO;
import ju.quest.model.QnaDAO;
import ju.reply.model.ReplyDAO;
import ju.review.model.ReviewDAO;




@Controller
public class HelpController {
   final int COUNTPAGE = 5;
   final int COUNTLIST = 10;
   
   
   @Autowired
   private NoticeDAO noticeDao;
   @Autowired
   private MissingDAO missingDao;
   @Autowired
   private QnaDAO qnaDao;
   @Autowired
   private ReviewDAO reviewDao;
   @Autowired
   private OrderbookDAO orderbookDao;
   @Autowired
   private ReplyDAO replyDao;

   
   
   //공지사항 게시판 리스트관련 메소드
   @RequestMapping("/noticeList.ju")
   public ModelAndView noticeList(@RequestParam(value="type", defaultValue="nt_subject")String type,
            @RequestParam(value="query", defaultValue="")String query,
            @RequestParam(value="page", defaultValue="1")int page,
            HttpSession session){
      
      int totalCount = noticeDao.noticeTotalCount(); // 총 게시물
      int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
      if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
         totalPage++;
      }
      
      if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
         page = totalPage;
      }else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
         page = 1;
      }
      
      int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;   // 시작 페이지
      int endPage = startPage + COUNTPAGE -1; // 끝 페이지
      if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
         endPage = totalPage;
      }
      
      String sql = "select b.* from (select rownum as rnum, a.* from(select nt_idx, nt_cate, nt_subject, mem_idx, nt_date, nt_readnum from notice where "+ type +" like '%" + query + "%' order by nt_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
      List<NoticeDTO> list=noticeDao.noticeList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
      
      ModelAndView mav=new ModelAndView("help/notice/noticeList","list",list); //이 페이지로 보낸다 리스트를같이
      
      // 세션 idx 권한체크
      String idx = "";
      if(session.getAttribute("sidx")!=null){
         idx = (String)session.getAttribute("sidx");
         if(idx.substring(0, 2).equals("GH")){
            mav.addObject("chk", true);
         }
      }
      mav.addObject("page", page);
      mav.addObject("startPage", startPage);
      mav.addObject("endPage", endPage);
      
      return mav;
   }
   
   //공지사항 게시판 작성관련 메소드
   @RequestMapping("/noticeWrite.ju")
   public ModelAndView noticeWrite(){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("help/notice/noticeWrite");

      return mav;
   }
      
   @RequestMapping("/noticeWriteok.ju")
   public ModelAndView noticeWrite(NoticeDTO dto){
      
         Long unixTime=System.currentTimeMillis();
         String nt_idx="NT"+unixTime;  //NT~로 시작하는 idx를 생성시킨다
          dto.setNt_idx(nt_idx);      //dto에 담아 출력시킴
      
      int result=noticeDao.noticeWrite(dto);
      String msg=result>0?"게시물등록성공":"게시물등록실패";
      ModelAndView mav=new ModelAndView("help/WriteMsg","msg",msg); //메세지로 번환시킨다
      return mav;
   }
   
   @RequestMapping("/noticeContent.ju")
   public ModelAndView noticeContent(String nt_idx, HttpSession session){
     noticeDao.noticeRead(nt_idx);
      NoticeDTO dto=noticeDao.noticeContent(nt_idx);
      NoticeDTO preInfo = noticeDao.noticePreInfo(nt_idx);
      NoticeDTO nextInfo = noticeDao.noticeNextInfo(nt_idx);
      ModelAndView mav=new ModelAndView("help/notice/noticeContent","dto",dto);
      // 세션 idx 권한체크
      String idx = "";
      if(session.getAttribute("sidx")!=null){
         idx = (String)session.getAttribute("sidx");
         if(idx.substring(0, 2).equals("GH")){
            mav.addObject("chk", true);
         }
      }
      mav.addObject("pre", preInfo);
      mav.addObject("next", nextInfo);
      return mav;
   }

   @RequestMapping("/noticeDelete.ju")
   public ModelAndView noticeDelete(@RequestParam(value="nt_idx") String nt_idx ){
      //System.out.println("ddd"+nt_idx);
      int result=noticeDao.noticeDelete(nt_idx);
      String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
      ModelAndView mav=new ModelAndView("help/DeleteMsg","msg",msg);
      return mav;
   }


   @RequestMapping("/noticeChange.ju")
   public ModelAndView noticeChange(@RequestParam(value="nt_idx") String nt_idx){
      NoticeDTO dto=noticeDao.noticeChange(nt_idx);
      ModelAndView mav=new ModelAndView("help/notice/noticeChange","dto",dto);
      return mav;
   }
   
   @RequestMapping("/noticeChangeOk.ju")
   public ModelAndView noticeChangeOk(@RequestParam(value="nt_idx") String nt_idx,
         NoticeDTO dto){
      int result=noticeDao.noticeChangeOk(dto);
      String msg=result>0?"게시물 수정 성공":"게시물 수정 실패";
      ModelAndView mav=new ModelAndView("help/ChangeMsg","msg",msg);
      return mav;
   }
   
   /* 분실물 게시판 관련 메소드 */
   @RequestMapping("/missingList.ju")
   public ModelAndView missingList(@RequestParam(value="type", defaultValue="missing_subject")String type,
         @RequestParam(value="query", defaultValue="")String query,
         @RequestParam(value="page", defaultValue="1")int page,
         HttpSession   session){
   
   int totalCount = missingDao.missingTotalCount(); // 총 게시물
   int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
   if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
      totalPage++;
   }
   
   if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
      page = totalPage;
   }else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
      page = 1;
   }
   
   int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;   // 시작 페이지
   int endPage = startPage + COUNTPAGE -1; // 끝 페이지
   if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
      endPage = totalPage;
   }
   String sql = "select b.* from (select rownum as rnum, a.* from(select missing_idx, missing_cate, missing_subject, mem_idx, missing_date, missing_readnum from missing where "+ type +" like '%" + query + "%' order by missing_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
   List<MissingDTO> list=missingDao.missingList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
   for (int i = 0; i < list.size(); i++) {
      list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
   }
   ModelAndView mav=new ModelAndView("help/missing/missingList","list",list); //이 페이지로 보낸다 리스트를같이
    // 세션 idx 권한체크
   if(session.getAttribute("sidx")!=null){
     mav.addObject("chk", true);
   }
   mav.addObject("page", page);
   mav.addObject("startPage", startPage);
   mav.addObject("endPage", endPage);
   
   return mav;

}
   
   @RequestMapping("/missingWrite.ju")
   public ModelAndView missingWrite(HttpSession session){
      String sid = (String)session.getAttribute("sid");
      ModelAndView mav=new ModelAndView();
      mav.setViewName("help/missing/missingWrite");
      sid = missingDao.findName((String)session.getAttribute("sidx"));
      mav.addObject("sid", sid);
      return mav;
   }
   
   @RequestMapping("/missingWriteOk.ju")
   public ModelAndView missingWriteok(MissingDTO dto, HttpSession session){
      String mem_idx = (String)session.getAttribute("sidx");
      dto.setMem_idx(mem_idx);
      dto.setMissing_idx(missingDao.makeIdx("MS"));
      int result = missingDao.missingWrite(dto);
      String msg=result>0?"게시물등록성공":"게시물등록실패";      
      ModelAndView mav=new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("help/missing/missingWriteOk");
      return mav;
   }

   @RequestMapping(value="/missingContent.ju")
   public ModelAndView missingContent(String missing_idx, HttpSession session){
      missingDao.missingRead(missing_idx);
      MissingDTO dto=missingDao.missingContent(missing_idx);
      MissingDTO preInfo = missingDao.missingPreInfo(missing_idx);
      if( preInfo!=null ){
         preInfo.setMem_idx(missingDao.findName(preInfo.getMem_idx()));
      }
      MissingDTO nextInfo = missingDao.missingNextInfo(missing_idx);
      if( nextInfo!=null ){
         nextInfo.setMem_idx(missingDao.findName(nextInfo.getMem_idx()));
      }
      
      List<ReplyDTO> list = replyDao.relpyList(missing_idx);
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView("help/missing/missingContent","dto",dto);
       // 세션 idx 권한체크
         String idx = "";
         if(session.getAttribute("sidx")!=null){
            idx = (String)session.getAttribute("sidx");
            if(idx.equals(dto.getMem_idx())){
               mav.addObject("chk", true);
            }
         }
       dto.setMem_idx(missingDao.findName(dto.getMem_idx()));
      mav.addObject("pre", preInfo);
      mav.addObject("next", nextInfo);
      mav.addObject("reply", list);
      return mav;
      
   }
   
   @RequestMapping("/missingDelete.ju")
   public ModelAndView missingDelete(@RequestParam(value="missing_idx") String missing_idx ){
      int result=missingDao.missingDelete(missing_idx);
      String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
      ModelAndView mav=new ModelAndView("help/missing/deleteMsg","msg",msg);
      return mav;
   }
   
   @RequestMapping("/missingChange.ju")
   public ModelAndView missingChange(@RequestParam(value="missing_idx") String missing_idx){
      MissingDTO dto=missingDao.missingChange(missing_idx);
      ModelAndView mav=new ModelAndView("help/missing/missingChange","dto",dto);
      return mav;
   }
   
   @RequestMapping("/missingChangeOk.ju")
   public ModelAndView missingChangeOk(MissingDTO dto){
      int result=missingDao.missingChangeOk(dto);
      String msg=result>0?"게시물 수정 성공":"게시물 수정 실패";
      ModelAndView mav=new ModelAndView("help/missing/changeMsg","msg",msg);
      return mav;
   }
   
   
   /* Qna 게시판 관련 메소드 */
   @RequestMapping("/questList.ju")
   public ModelAndView questList(@RequestParam(value="type", defaultValue="qu_subject")String type,
         @RequestParam(value="query", defaultValue="")String query,
         @RequestParam(value="page", defaultValue="1")int page, 
         HttpSession session){
   
      int totalCount = qnaDao.qnaTotalCount(); // 총 게시물
      int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
      if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
         totalPage++;
      }
      
      if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
         page = totalPage;
      }else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
         page = 1;
      }
      
      int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;   // 시작 페이지
      int endPage = startPage + COUNTPAGE -1; // 끝 페이지
      if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
         endPage = totalPage;
      }         
      String sql = "select b.* from (select rownum as rnum, a.* from(select qu_idx, qu_cate, qu_subject, mem_idx, qu_date, qu_readnum from quest where "+ type +" like '%" + query + "%' order by qu_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
      List<QnaDTO> list=qnaDao.qnaList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView("help/quest/questList","list",list); //이 페이지로 보낸다 리스트를같이
       // 세션 idx 권한체크
      if(session.getAttribute("sidx")!=null){
        mav.addObject("chk", true);
      }
      mav.addObject("page", page);
      mav.addObject("startPage", startPage);
      mav.addObject("endPage", endPage);
      
      return mav;
   }
   
   
   @RequestMapping("/questWrite.ju")
   public ModelAndView questWrite(HttpSession session){
      String sid = (String)session.getAttribute("sid");
      ModelAndView mav=new ModelAndView();
      mav.setViewName("help/quest/questWrite");
      sid = missingDao.findName((String)session.getAttribute("sidx"));
      mav.addObject("sid", sid);
      return mav;
   }
   
   @RequestMapping("/questWriteOk.ju")
   public ModelAndView questWriteOk(QnaDTO dto, HttpSession session){
      String mem_idx = (String)session.getAttribute("sidx");
      dto.setMem_idx(mem_idx);
      dto.setQu_idx(qnaDao.makeIdx("QU"));
      int result = qnaDao.qnaWrite(dto);
      String msg=result>0?"게시물등록성공":"게시물등록실패";      
      ModelAndView mav=new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("help/quest/questWriteOk");
      return mav;
   }
   
   @RequestMapping(value="/questContent.ju")
   public ModelAndView questContent(String qu_idx, HttpSession session){
      qnaDao.qnaRead(qu_idx);
      QnaDTO dto=qnaDao.qnaContent(qu_idx);
      QnaDTO preInfo = qnaDao.qnaPreInfo(qu_idx);
      QnaDTO nextInfo = qnaDao.qnaNextInfo(qu_idx);
      if( preInfo!=null ){
         preInfo.setMem_idx(missingDao.findName(preInfo.getMem_idx()));
      }
      if( nextInfo!=null ){
         nextInfo.setMem_idx(missingDao.findName(nextInfo.getMem_idx()));
      }
      List<ReplyDTO> list = replyDao.relpyList(qu_idx);
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView("help/quest/questContent","dto",dto);
       // 세션 idx 권한체크
         String idx = "";
         if(session.getAttribute("sidx")!=null){
            idx = (String)session.getAttribute("sidx");
            if(idx.equals(dto.getMem_idx())){
               mav.addObject("chk", true);
            }
         }
      mav.addObject("pre", preInfo);
      dto.setMem_idx(missingDao.findName(dto.getMem_idx()));
      mav.addObject("next", nextInfo);
      mav.addObject("reply", list);
      return mav;
      
   }
   
   @RequestMapping("/questDelete.ju")
   public ModelAndView questDelete(@RequestParam(value="qu_idx") String qu_idx ){
      int result=qnaDao.qnaDelete(qu_idx);
      String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
      ModelAndView mav=new ModelAndView("help/quest/deleteMsg","msg",msg);
      return mav;
   }
   
   @RequestMapping("/questChange.ju")
   public ModelAndView questChange(@RequestParam(value="qu_idx") String qu_idx){
      QnaDTO dto=qnaDao.qnaChange(qu_idx);
      ModelAndView mav=new ModelAndView("help/quest/questChange","dto",dto);
      return mav;
   }
   
   @RequestMapping("/questChangeOk.ju")
   public ModelAndView questChangeOk(QnaDTO dto){
      int result=qnaDao.qnaChangeOk(dto);
      String msg=result>0?"게시물 수정 성공":"게시물 수정 실패";
      ModelAndView mav=new ModelAndView("help/quest/changeMsg","msg",msg);
      return mav;
   }
   
   /*FAQ 게시판 */
   @RequestMapping("/faqList.ju")
   public ModelAndView faqList(){
      String sql = "select a.* from(select qu_idx, qu_qidx, qu_cate, qu_subject, qu_content, mem_idx, qu_date, qu_readnum, RANK() over(order by qu_readnum desc)as rank from quest)a where a.rank<10";
      List<QnaDTO> list = qnaDao.topTenQna(sql);
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView();
      mav.setViewName("help/faq/faqList");
      mav.addObject("list",list);
      return mav;
   }   
   
   @RequestMapping(value="/faqContent.ju")
   public ModelAndView faqContent(String qu_idx){
      QnaDTO dto=qnaDao.qnaContent(qu_idx);
      dto.setMem_idx(missingDao.findName(dto.getMem_idx()));
      ModelAndView mav=new ModelAndView("help/faq/faqContent","dto",dto);
      return mav;
      
   }
   
   
   /* 책추천 */
   @RequestMapping("/reviewList.ju")
   public ModelAndView reviewList(@RequestParam(value="type", defaultValue="review_subject")String type,
         @RequestParam(value="query", defaultValue="")String query,
         @RequestParam(value="page", defaultValue="1")int page,
         HttpSession session){
      int totalCount = reviewDao.reviewTotalCount(); // 총 게시물
      int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
      if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
         totalPage++;
      }
      
      if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
         page = totalPage;
      }else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
         page = 1;
      }
      
      int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;   // 시작 페이지
      int endPage = startPage + COUNTPAGE -1; // 끝 페이지
      if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
         endPage = totalPage;
      }         
      String sql = "select b.* from (select rownum as rnum, a.* from(select review_idx, review_cate, review_subject, mem_idx, review_date, review_readnum from review where "+ type +" like '%" + query + "%' order by review_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
      List<ReviewDTO> list=reviewDao.reviewList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView("help/review/reviewList","list",list); //이 페이지로 보낸다 리스트를같이
       // 세션 idx 권한체크
      if(session.getAttribute("sidx")!=null){
        mav.addObject("chk", true);
      }
      mav.addObject("page", page);
      mav.addObject("startPage", startPage);
      mav.addObject("endPage", endPage);
      
      return mav;
   }
   
   @RequestMapping("/reviewWrite.ju")
   public ModelAndView reviewWrite(HttpSession session){
      String sid = (String)session.getAttribute("sid");
      ModelAndView mav=new ModelAndView();
      mav.setViewName("help/review/reviewWrite");
      sid = missingDao.findName((String)session.getAttribute("sidx"));
      mav.addObject("sid", sid);
      return mav;
   }
   
   @RequestMapping("/reviewWriteOk.ju")
   public ModelAndView reviewWriteOk(ReviewDTO dto, HttpSession session){
      String mem_idx = (String)session.getAttribute("sidx");
      dto.setMem_idx(mem_idx);
      dto.setReview_idx(reviewDao.makeIdx("RE"));
      int result = reviewDao.reviewWrite(dto);
      String msg=result>0?"게시물등록성공":"게시물등록실패";      
      ModelAndView mav=new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("help/review/reviewWriteOk");
      return mav;
   }
   
   @RequestMapping(value="/reviewContent.ju")
   public ModelAndView reviewContent(String review_idx, HttpSession session){
      reviewDao.reviewRead(review_idx);
      ReviewDTO dto=reviewDao.reviewContent(review_idx);
      ReviewDTO preInfo = reviewDao.reviewPreInfo(review_idx);
      ReviewDTO nextInfo = reviewDao.reviewNextInfo(review_idx);
      if( preInfo!=null ){
         preInfo.setMem_idx(missingDao.findName(preInfo.getMem_idx()));
      }
      if( nextInfo!=null ){
         nextInfo.setMem_idx(missingDao.findName(nextInfo.getMem_idx()));
      }
      List<ReplyDTO> list = replyDao.relpyList(review_idx);
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView("help/review/reviewContent","dto",dto);
       // 세션 idx 권한체크
         String idx = "";
         if(session.getAttribute("sidx")!=null){
            idx = (String)session.getAttribute("sidx");
            if(idx.equals(dto.getMem_idx())){
               mav.addObject("chk", true);
            }
         }
       dto.setMem_idx(missingDao.findName(dto.getMem_idx()));
      mav.addObject("pre", preInfo);
      mav.addObject("next", nextInfo);
      mav.addObject("reply", list);
      return mav;
   }
   
   @RequestMapping("/reviewDelete.ju")
   public ModelAndView reviewDelete(@RequestParam(value="review_idx") String review_idx ){
      int result=reviewDao.reviewDelete(review_idx);
      String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
      ModelAndView mav=new ModelAndView("help/review/deleteMsg","msg",msg);
      return mav;
   }
   
   @RequestMapping("/reviewChange.ju")
   public ModelAndView reviewChange(@RequestParam(value="review_idx") String review_idx){
      ReviewDTO dto=reviewDao.reviewChange(review_idx);
      ModelAndView mav=new ModelAndView("help/review/reviewChange","dto",dto);
      return mav;
   }
   
   @RequestMapping("/reviewChangeOk.ju")
   public ModelAndView reviewChangeOk(ReviewDTO dto){
      int result=reviewDao.reviewChangeOk(dto);
      String msg=result>0?"게시물 수정 성공":"게시물 수정 실패";
      ModelAndView mav=new ModelAndView("help/review/changeMsg","msg",msg);
      return mav;
   }
   
   /* 희망도서 */
   @RequestMapping("/orderbookList.ju")
   public ModelAndView orderbookList(@RequestParam(value="type", defaultValue="orderbook_subject")String type,
         @RequestParam(value="query", defaultValue="")String query,
         @RequestParam(value="page", defaultValue="1")int page,
         HttpSession session){
      int totalCount = orderbookDao.orderbookTotalCount(); // 총 게시물
      int totalPage = totalCount/COUNTLIST; // 전체 페이지 수
      if(totalCount % COUNTLIST > 0){ // 정확한 페이지 수 계산
         totalPage++;
      }
      
      if(page>totalPage && totalPage!=0){ // 페이지가 총 페이지를 넘어가면 마지막 페이지로 돌림 
         page = totalPage;
      }else if(page < 1){  // 페이지가 1보다 작으면 1로 유지
         page = 1;
      }
      
      int startPage = ((page-1)/COUNTPAGE)*COUNTPAGE+1;   // 시작 페이지
      int endPage = startPage + COUNTPAGE -1; // 끝 페이지
      if(endPage > totalPage){  // 끝 페이지가 총페이지보다 크면 마지막으로 초기화
         endPage = totalPage;
      }         
      String sql = "select b.* from (select rownum as rnum, a.* from(select orderbook_idx, orderbook_cate, orderbook_subject, mem_idx, orderbook_date, orderbook_readnum from orderbook where "+ type +" like '%" + query + "%' order by orderbook_date desc)a)b WHERE b.rnum >= "+((page-1)*COUNTLIST+1)+" and b.rnum <= "+(page*COUNTLIST);
      List<OrderbookDTO> list=orderbookDao.orderbookList(sql); //DTO 그릇에 DAO에있는 리스트를 담아서
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView("help/orderbook/orderbookList","list",list); //이 페이지로 보낸다 리스트를같이
       // 세션 idx 권한체크
      if(session.getAttribute("sidx")!=null){
        mav.addObject("chk", true);
      }
      mav.addObject("page", page);
      mav.addObject("startPage", startPage);
      mav.addObject("endPage", endPage);
      
      return mav;
   }
   
   @RequestMapping("/orderbookWrite.ju")
   public ModelAndView orderbookWrite(HttpSession session){
      String sid = (String)session.getAttribute("sid");
      ModelAndView mav=new ModelAndView();
      mav.setViewName("help/orderbook/orderbookWrite");
      sid = missingDao.findName((String)session.getAttribute("sidx"));
      mav.addObject("sid", sid);
      return mav;
   }
   
   @RequestMapping("/orderbookWriteOk.ju")
   public ModelAndView orderbookWriteOk(OrderbookDTO dto, HttpSession session){
      String mem_idx = (String)session.getAttribute("sidx");
      dto.setMem_idx(mem_idx);
      dto.setOrderbook_idx(orderbookDao.makeIdx("OR"));
      int result = orderbookDao.orderbookWrite(dto);
      String msg=result>0?"게시물등록성공":"게시물등록실패";      
      ModelAndView mav=new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("help/orderbook/orderbookWriteOk");
      return mav;
   }
   
   @RequestMapping(value="/orderbookContent.ju")
   public ModelAndView orderbookContent(String orderbook_idx, HttpSession session){
      orderbookDao.orderbookRead(orderbook_idx);
      OrderbookDTO dto = orderbookDao.orderbookContent(orderbook_idx);
      OrderbookDTO preInfo = orderbookDao.orderbookPreInfo(orderbook_idx);
      OrderbookDTO nextInfo = orderbookDao.orderbookNextInfo(orderbook_idx);
      if( preInfo!=null ){
         preInfo.setMem_idx(missingDao.findName(preInfo.getMem_idx()));
      }
      if( nextInfo!=null ){
         nextInfo.setMem_idx(missingDao.findName(nextInfo.getMem_idx()));
      }
      List<ReplyDTO> list = replyDao.relpyList(orderbook_idx);
      for (int i = 0; i < list.size(); i++) {
         list.get(i).setMem_idx(missingDao.findName(list.get(i).getMem_idx()));
      }
      ModelAndView mav=new ModelAndView("help/orderbook/orderbookContent","dto",dto);
       // 세션 idx 권한체크
         String idx = "";
         if(session.getAttribute("sidx")!=null){
            idx = (String)session.getAttribute("sidx");
            if(idx.equals(dto.getMem_idx())){
               mav.addObject("chk", true);
            }
         }
      dto.setMem_idx(missingDao.findName(dto.getMem_idx()));
      mav.addObject("pre", preInfo);
      mav.addObject("next", nextInfo);
      mav.addObject("reply", list);
      return mav;
   }
   
   @RequestMapping("/orderbookDelete.ju")
   public ModelAndView orderbookDelete(@RequestParam(value="orderbook_idx") String orderbook_idx ){
      int result=orderbookDao.orderbookDelete(orderbook_idx);
      String msg=result>0?"게시물 삭제 성공":"게시물 삭제 실패";
      ModelAndView mav=new ModelAndView("help/orderbook/deleteMsg","msg",msg);
      return mav;
   }
   
   @RequestMapping("/orderbookChange.ju")
   public ModelAndView orderbookChange(@RequestParam(value="orderbook_idx") String orderbook_idx){
      OrderbookDTO dto=orderbookDao.orderbookChange(orderbook_idx);
      ModelAndView mav=new ModelAndView("help/orderbook/orderbookChange","dto",dto);
      return mav;
   }
   
   @RequestMapping("/orderbookChangeOk.ju")
   public ModelAndView orderbookChangeOk(OrderbookDTO dto){
      int result=orderbookDao.orderbookChangeOk(dto);
      String msg=result>0?"게시물 수정 성공":"게시물 수정 실패";
      ModelAndView mav=new ModelAndView("help/orderbook/changeMsg","msg",msg);
      return mav;
   }

   /* reply */
   @RequestMapping("/missingReplyWrite.ju")
   public ModelAndView missingReplyWrite(ReplyDTO dto){
      int totalCount = replyDao.totalCount();
      dto.setReply_idx(totalCount+1);
      int result = replyDao.replyWrite(dto);
      String msg=result>0?"댓글 등록 성공":"댓글 등록 실패";
      ModelAndView mav=new ModelAndView("help/missing/changeMsg","msg",msg);
      return mav;
   }
   @RequestMapping("/questReplyWrite.ju")
   public ModelAndView questReplyWrite(ReplyDTO dto){
      System.out.println(dto.getReply_content());
      int totalCount = replyDao.totalCount();
      dto.setReply_idx(totalCount+1);
      int result = replyDao.replyWrite(dto);
      String msg=result>0?"댓글 등록 성공":"댓글 등록 실패";
      ModelAndView mav=new ModelAndView("help/quest/changeMsg","msg",msg);
      return mav;
   }
   @RequestMapping("/reviewReplyWrite.ju")
   public ModelAndView reviewReplyWrite(ReplyDTO dto){
      int totalCount = replyDao.totalCount();
      dto.setReply_idx(totalCount+1);
      int result = replyDao.replyWrite(dto);
      String msg=result>0?"댓글 등록 성공":"댓글 등록 실패";
      ModelAndView mav=new ModelAndView("help/review/changeMsg","msg",msg);
      return mav;
   }
   @RequestMapping("/orderbookReplyWrite.ju")
   public ModelAndView orderbookReplyWrite(ReplyDTO dto){
      int totalCount = replyDao.totalCount();
      dto.setReply_idx(totalCount+1);
      int result = replyDao.replyWrite(dto);
      String msg=result>0?"댓글 등록 성공":"댓글 등록 실패";
      ModelAndView mav=new ModelAndView("help/orderbook/changeMsg","msg",msg);
      return mav;
   }
   
   
   
   
   
   @RequestMapping("/missingReplyDelete.ju")
   public ModelAndView missingReplyDelete(@RequestParam(value="reply_idx") String reply_idx ){
      int result=replyDao.replyDelete(reply_idx);
      String msg=result>0?"댓글 삭제 성공":"댓글 삭제 실패";
      ModelAndView mav=new ModelAndView("help/missing/deleteMsg","msg",msg);
      return mav;
   }
   @RequestMapping("/questReplyDelete.ju")
   public ModelAndView questReplyDelete(@RequestParam(value="reply_idx") String reply_idx ){
      int result=replyDao.replyDelete(reply_idx);
      String msg=result>0?"댓글 삭제 성공":"댓글 삭제 실패";
      ModelAndView mav=new ModelAndView("help/quest/deleteMsg","msg",msg);
      return mav;
   }
   @RequestMapping("/reviewReplyDelete.ju")
   public ModelAndView reviewReplyDelete(@RequestParam(value="reply_idx") String reply_idx ){
      int result=replyDao.replyDelete(reply_idx);
      String msg=result>0?"댓글 삭제 성공":"댓글 삭제 실패";
      ModelAndView mav=new ModelAndView("help/review/deleteMsg","msg",msg);
      return mav;
   }
   @RequestMapping("/orderbookReplyDelete.ju")
   public ModelAndView orderbookReplyDelete(@RequestParam(value="reply_idx") String reply_idx ){
      int result=replyDao.replyDelete(reply_idx);
      String msg=result>0?"댓글 삭제 성공":"댓글 삭제 실패";
      ModelAndView mav=new ModelAndView("help/orderbook/deleteMsg","msg",msg);
      return mav;
   }

   
   
   
}