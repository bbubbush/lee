package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.*;
import ju.dto.*;
import ju.model.*;

@Controller
public class AdminFedexController {
	
	@Autowired
	public FedexDAO fedexDao;
	
	@Autowired
	public MemberDAO memberDao;


	
	@Autowired
	public BookDAO bookDao;
	
	@Autowired
	public LoanDAO loanDao;

	// 택배대출 메인페이지
	@RequestMapping("/fedexList.ju")
	public ModelAndView fedexList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="cp2",defaultValue="1")int cp2){
		int totalCnt = fedexDao.beforeCnt();
		int totalCnt2 = fedexDao.afterCnt();
		totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
		int listSize = 5;
		int pageSize = 5;
		String pageStr = ju.page.PageModule.pageMake("fedexList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
		String pageStr2 = ju.page.PageModule.pageMake2("fedexList.ju", totalCnt2, listSize, pageSize, cp2); // 페이징을 위해 저장
		List<FedexDTO> list = fedexDao.fedexBeforeList(cp, listSize);
		List<FedexDTO> list2 = fedexDao.fedexAfterList(cp2, listSize);
		String dateFormat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
		
		for(int i=0; i<list2.size(); i++){
			String sdDay = sdf.format(list2.get(i).getLb_sd());
			list2.get(i).setLb_sday(sdDay);
			String edDay = sdf.format(list2.get(i).getLb_ed());
			list2.get(i).setLb_eday(edDay);
		}
		ModelAndView mav = new ModelAndView("admin/fedexManage/fedexList","list",list);
		mav.addObject("list2",list2);
		mav.addObject("pageStr",pageStr);
		mav.addObject("pageStr2",pageStr2);
		return mav;
	}
	
	// 택배 신청 정보 가져오기
	@RequestMapping("/fedexInfo.ju")
	public ModelAndView fedexInfo(String mem_idx, String bk_idx,String fedex_idx){
		MemberDTO dto = memberDao.memberInfo(mem_idx);
		BookDTO dto2 = bookDao.bookInfo(bk_idx);
		ModelAndView mav = new ModelAndView("admin/fedexManage/fedexInfo","dto",dto);
		mav.addObject("dto2",dto2);
		mav.addObject("fedex_idx",fedex_idx);
		System.out.println(mem_idx);
		System.out.println(bk_idx);
		System.out.println("택배idx"+fedex_idx);
		return mav;
	}
	
	// 택배대출하기
		@RequestMapping(value="/fedexCheckOut.ju",method=RequestMethod.GET)
		public ModelAndView fedexCheckOut(String bk_idx, String mem_idx, LoanDTO dto, FedexDTO dto2, String fedex_idx){
			Long unixTime=System.currentTimeMillis();
			String lb_idx="LB"+unixTime;
			dto.setLb_idx(lb_idx);
			dto.setMem_idx(mem_idx);
			dto.setBook_idx(bk_idx);
			dto.setLb_return(2);
			int result = bookDao.bookTakeUpdate(bk_idx);
			int count = loanDao.checkOutGo(dto);
	
			dto2.setMem_idx(mem_idx);
			dto2.setBk_idx(bk_idx);
			dto2.setLb_idx(lb_idx);
			System.out.println("택배책정보:"+dto2.getBk_idx());
			System.out.println("택배회원정보:"+dto2.getMem_idx());
			System.out.println("택배대출책정보:"+dto2.getLb_idx());
			System.out.println("넘어온 택배idx"+fedex_idx);
			int fedexCount = fedexDao.fedexCheckOut(dto2, fedex_idx);
			System.out.println("최종디비다녀옴");
			ModelAndView mav = new ModelAndView("admin/fedexManage/fedexList","dto",dto);
			mav.addObject("dto2",dto2);
			return mav;
		}
}
