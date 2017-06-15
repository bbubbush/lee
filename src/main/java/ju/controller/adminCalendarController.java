package ju.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adminCalendarController {
	
	@RequestMapping("/calendar.ju")
	public ModelAndView calendar(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/calendarManage/calendar");
		return mav;
	}
	
	@RequestMapping(value="/calex.ju",method=RequestMethod.POST)
	public ModelAndView calex(String start,String end,String title){
		System.out.println("startDate:"+start);
		System.out.println("title:"+title);
		System.out.println("endDate:"+end);
		ModelAndView mav=new ModelAndView("admin/calendarManage/calendar");
		
		return mav;
	}
	
	
}
