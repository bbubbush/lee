package ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LibController {
	
	//도서관장 인사말 관련 메소드
	@RequestMapping("/libMaster.ju")
	public ModelAndView libMaster(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("libs/libMaster");
		return mav;
	}
	
	//도서관장 연혁 관련 메소드
	@RequestMapping("/libHistory.ju")
	public ModelAndView libHistory(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("libs/libHistory");
		return mav;
	}

	//도서관 층별소개 관련 메소드
	@RequestMapping("/libInside.ju")
	public ModelAndView libInside(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("libs/libInside");
		return mav;
	}
	
	//도서관 오시는길 메소드
	@RequestMapping("/libMap.ju")
	public ModelAndView libMap(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("libs/libMap");
		return mav;
	}
	
	//도서관 장서정보 메소드
	@RequestMapping("/libStatus.ju")
	public ModelAndView libStatus(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("libs/libStatus");
		return mav;
	}
	
	//도서관 장서정보 메소드
	@RequestMapping("/libGuide.ju")
	public ModelAndView libGuide(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("libs/libGuide");
		return mav;
	}
}
