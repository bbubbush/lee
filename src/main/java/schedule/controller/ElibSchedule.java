package schedule.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import ju.model.LoanDAO;

@Component
public class ElibSchedule {
	
	@Autowired
	private LoanDAO loandao;
	
	@Scheduled(cron="0/30 * * * * *")
	public void testSchedule() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("현재시간 : " + dateFormat.format(cal.getTime()));
	}
	
	@Scheduled(cron="0 0 0/1 * * *")
	public void elibSchedule() {
		@SuppressWarnings("unused")
		int resultCount=loandao.elibLoanScheduleReturn();
	}

}
