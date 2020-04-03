package com.mgsoft.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	public static String getCurrentDate() {
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date date = new Date();
		return dateFormat.format(date);

	}

	public static String getCurrentDateWithAMPM(String strTime) throws ParseException {
		String dt = (new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
		Date date = dateFormat.parse(dt + " " + strTime);
		return dateFormat.format(date);

	}

	public static String getCurrentTime() {
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		return dateFormat.format(date);

	}

	public static String dateToString(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String datestr = formatter.format(date);
		return datestr;
	}

	public static String dateTimeToString(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("hh:mm a  MMM-dd-yyyy  ");
		String dateTimestr = formatter.format(date);
		return dateTimestr;
	}

	public static Date stringToDate(String datestr, String format) {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		Date date = null;
		try {
			date = formatter.parse(datestr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static String getCurrentTimeAmPm() {
		DateFormat dateFormat = new SimpleDateFormat("hh:mm:a");
		Date date = new Date();
		return dateFormat.format(date);
	}
	
	public static Integer getCurrentMonthDayCount(){
		Calendar calendar = Calendar.getInstance();
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	
	public static Integer getCurrentYearDayCount(){
		Calendar calendar = Calendar.getInstance();
		return calendar.getActualMaximum(Calendar.DAY_OF_YEAR);
	}
	
	public static Long getDayCountBetweenDates(Date firstDate, Date secondDate){
	    return ChronoUnit.DAYS.between(firstDate.toInstant(), secondDate.toInstant());
	}

	public static String getMonthNameByMonthNumber(int monthNum) {
		String[] monthNames = { "January", "February", "March", "April", "May", "June", "July", "August", "September",
				"October", "November", "December" };
		return monthNames[monthNum];
	}

	public static String getCurrentDateByFormat(String dataFormat) {
		DateFormat dateFormat = new SimpleDateFormat(dataFormat);
		Date date = new Date();
		return dateFormat.format(date);
	}

}
