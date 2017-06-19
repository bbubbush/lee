package ju.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.ElibDTO;
import ju.dto.FindDTO;
import ju.dto.NoticeDTO;
import ju.elib.model.ElibDAO;
import ju.find.model.FindDAO;
import ju.notice.model.NoticeDAO;

@Controller
public class IndexController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	FindDAO FindDao;
	@Autowired
	ElibDAO elibDAO;
	@Autowired
	private NoticeDAO noticeDao;
	
	@RequestMapping("/index.ju")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		String sql = "select * from book order by bk_idx desc";
		String sql2 = "select * from notice order by nt_idx desc";
		List<FindDTO> list = FindDao.bkList(sql);
		List<ElibDTO> elibArr=elibDAO.elibFirst("EL_recocount", 1, 1, "EB");
		List<NoticeDTO> notilist = noticeDao.noticeList(sql2);
		mav.addObject("bklist", list);
		mav.addObject("eliblist", elibArr);
		mav.addObject("notilist", notilist);
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("/disable.ju")
	public ModelAndView disable() {
        //client ip
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null){
        	ip = req.getRemoteAddr();
        }
        log.info("ip:"+ip+"/");
        
        ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	
	

}
