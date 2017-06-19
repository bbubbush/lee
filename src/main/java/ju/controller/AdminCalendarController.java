package ju.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCalendarController {
	
	@RequestMapping("/calendar.ju")
	public ModelAndView calendar(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/calendarManage/calendar");
		return mav;
	}
	
	
	
	
}
