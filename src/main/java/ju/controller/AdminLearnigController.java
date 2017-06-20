package ju.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import ju.dto.*;
import ju.model.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminLearnigController {

	@Autowired
	public TeacherDAO teacherDao;
	
	
	@Autowired
	public SubjectDAO subjectDao;
	

	// 교육 메인페이지로 이동
		@RequestMapping("/learningList.ju")
		public ModelAndView learningList(
				@RequestParam(value="cp",defaultValue="1")int cp){
			int totalCnt = subjectDao.classtotalCnt(); // 페이징을 위해
			totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
			int listSize = 10;
			int pageSize = 5;
			String pageStr = ju.page.PageModule.pageMake("learningList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
			List<SubjectDTO> list = subjectDao.classList(cp, listSize);
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			for(int i=0; i<list.size(); i++){
				String sdDay = sdf.format(list.get(i).getSj_sd());
				list.get(i).setSj_sday(sdDay);
				String edDay = sdf.format(list.get(i).getSj_ed());
				list.get(i).setSj_eday(edDay);
			}
			ModelAndView mav = new ModelAndView("admin/learningManage/learningList","list",list);
			mav.addObject("pageStr",pageStr);
			return mav;
		}
		
	// 강사 메인페이지로 이동
		@RequestMapping("/learningTeacherList.ju")
		public ModelAndView learningTeacherList(
				@RequestParam(value="cp",defaultValue="1")int cp){
			int totalCnt = subjectDao.classtotalCnt(); // 페이징을 위해
			totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
			int listSize = 10;
			int pageSize = 5;
			String pageStr = ju.page.PageModule.pageMake("learningTeacherList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
			List<TeacherDTO> list = teacherDao.teacherList(cp, listSize);
			for(int i=0; i<list.size(); i++){
				String tc_idx = list.get(i).getTc_idx();
				int count = subjectDao.classNum(tc_idx);
				int result = subjectDao.classEnd(tc_idx);
				list.get(i).setTc_num(count);
				list.get(i).setTc_end(result);
			}
			ModelAndView mav = new ModelAndView("admin/learningManage/learningTeacherList","list",list);
			mav.addObject("pageStr",pageStr);
			return mav;
			}
		
	// 수업 등록 폼으로 이동
		@RequestMapping(value="/learningClassAdd.ju",method=RequestMethod.GET)
		public ModelAndView classAddForm(){
			List<TeacherDTO> list = teacherDao.teacherList();
			ModelAndView mav = new ModelAndView("admin/learningManage/learningClassAdd","list",list);
			return mav;
		}
		
	// 수업 등록하기
		@RequestMapping(value="/learningClassAdd.ju",method=RequestMethod.POST)
		public ModelAndView classAdd(
				@ModelAttribute("dto") SubjectDTO dto,
				@RequestParam("sj_sd_s") String sj_sd_s,
				@RequestParam("sj_ed_s") String sj_ed_s) throws ParseException{
			System.out.println("수업생성 컨트롤러");
			
			dto.setSj_sd(new Date(new SimpleDateFormat("yyyy-MM-dd").parse(sj_sd_s).getTime()));;
			dto.setSj_ed(new Date(new SimpleDateFormat("yyyy-MM-dd").parse(sj_ed_s).getTime()));;
			
			System.out.println("개강 : "+dto.getSj_sd());
			System.out.println("종강 : "+dto.getSj_ed());
			
			Long unixTime=System.currentTimeMillis();
			String sj_idx="SJ"+unixTime;
			dto.setSj_idx(sj_idx);
			int result = subjectDao.classAdd(dto);
			String msg = result>0?"수업 등록":"수업 등록 실패";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","learningList.ju");
			return mav;
		}
	
	// 강사 등록 폼으로 이동
		@RequestMapping(value="/learningTeacherAdd.ju",method=RequestMethod.GET)
		public ModelAndView teacherAddForm(){
			ModelAndView mav = new ModelAndView("admin/learningManage/learningTeacherAdd");
			return mav;
		}
		
	// 수업삭제
		@RequestMapping("/classDel.ju")
		public ModelAndView classDel(String sj_idx){
			System.out.println(sj_idx);
			int result = subjectDao.classDel(sj_idx);
			String msg = result>0? "수업삭제":"수업삭제실패";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","learningList.ju");
			return mav;
		}	
		
		// 강사삭제
		@RequestMapping("/teacherDel.ju")
		public ModelAndView teacherDel(String tc_idx){
			System.out.println(tc_idx);
			int result = teacherDao.teacherDel(tc_idx);
			String msg = result>0? "강사 삭제":"강사 삭제실패";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","learningTeacherList.ju");
			return mav;
		}	
		
	// 강사 등록하기
		@RequestMapping(value="/learningTeacherAdd.ju",method=RequestMethod.POST)
		public ModelAndView teacherAdd(
				@ModelAttribute("dto") TeacherDTO dto){
			Long unixTime=System.currentTimeMillis();
			String tc_idx="TC"+unixTime;
			dto.setTc_idx(tc_idx);
			int result = teacherDao.teacherAdd(dto);
			String msg = result>0?"강사 등록":"강사 등록 실패";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","learningTeacherList.ju");
			return mav;
		}
		
		// 학생들 정보
		@RequestMapping(value="/memberCheck.ju", method=RequestMethod.POST)
		public ModelAndView memberCheck(String sj_idx){	
			List<SubjectDTO> list = subjectDao.memberCheck(sj_idx);
			for(int i=0; i<list.size(); i++){
				String birth = list.get(i).getMem_birth().split("~")[0];
				list.get(i).setMem_birth(birth);
			}
			ModelAndView mav = new ModelAndView("admin/learningManage/learningInfo","list",list);
			mav.addObject("sub_idx",sj_idx);
			return mav;
		}
	

	// 선생님별 수업정보 가져오는 것
		@RequestMapping("/teacherInfo.ju")
		public ModelAndView teacherInfo(String tc_idx){
			List<SubjectDTO> list = subjectDao.teacherInfo(tc_idx);
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			for(int i=0; i<list.size(); i++){
				String sdDay = sdf.format(list.get(i).getSj_sd());
				list.get(i).setSj_sday(sdDay);
				String edDay = sdf.format(list.get(i).getSj_ed());
				list.get(i).setSj_eday(edDay);
				int day = list.get(i).getCday();
				if(day>0){
					list.get(i).setcStr("진행중");
				}else{
					list.get(i).setcStr("종료됨");
				}
			}
			
			ModelAndView mav = new ModelAndView("admin/learningManage/learningTeacherInfo","list",list);
			mav.addObject("tea_idx",tc_idx);
			return mav;
		}
}
