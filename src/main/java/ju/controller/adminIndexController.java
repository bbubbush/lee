package ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class adminIndexController {

	
	//관리자 메인페이지로 이동
		@RequestMapping("/adminIndex.ju")
		public ModelAndView adminIndex(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/adminIndex");
			return mav;
		}
}
