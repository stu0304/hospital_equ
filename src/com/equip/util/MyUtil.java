package com.equip.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyUtil {

	public static String getDate() {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 可以方便地修改日期格式
		return dateFormat.format(now);
	}

	public static boolean checkResult(int i) {
		return i > 0;
	}

}
