package ju.dto;

import java.sql.*;

public class HolidayDTO {
	private int num;
	private Date lunar_Date;
	private Date solar_Date;
	private int yun;
	private String ganji;
	private String memo;

	public HolidayDTO() {
		super();
		
	}

	public HolidayDTO(int num, Date lunar_Date, Date solar_Date, int yun, String ganji, String memo) {
		super();
		this.num = num;
		this.lunar_Date = lunar_Date;
		this.solar_Date = solar_Date;
		this.yun = yun;
		this.ganji = ganji;
		this.memo = memo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Date getLunar_Date() {
		return lunar_Date;
	}

	public void setLunar_Date(Date lunar_Date) {
		this.lunar_Date = lunar_Date;
	}

	public Date getSolar_Date() {
		return solar_Date;
	}

	public void setSolar_Date(Date solar_Date) {
		this.solar_Date = solar_Date;
	}

	public int getYun() {
		return yun;
	}

	public void setYun(int yun) {
		this.yun = yun;
	}

	public String getGanji() {
		return ganji;
	}

	public void setGanji(String ganji) {
		this.ganji = ganji;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	
	
}
