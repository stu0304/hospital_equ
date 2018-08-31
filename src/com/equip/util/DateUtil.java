package com.equip.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class DateUtil {

	public static String dateToStringHHmm(Date myDate)
	{
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 return sdf.format(myDate);
	}
	
	@Test
	public void test1()
	{
		System.out.println(this.dateToStringHHmm(new Date()));
	}
}
