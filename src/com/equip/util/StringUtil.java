package com.equip.util;

/**
 * string 的工具类
 * 
 * @author gaoyue
 * @date 2016�?�?4�?
 * @time 下午7:56:44
 */
public class StringUtil {
	/**
	 * 判断字符串是否为�?
	 * 
	 * @param str
	 *            字符�?
	 * @return
	 */
	public static boolean isEmpty(String str) {
		return str == null || "".equals(str);
	}

	/**
	 * 判断字符串不为空
	 * 
	 * @param str
	 *            字符�?
	 * @return
	 */
	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}

	/**
	 * 拼接多个字符�?
	 * 
	 * @param strs
	 * @return
	 */
	public static String contactStr(String... strs) {
		if (strs.length == 1)
			return strs[0];
		StringBuffer stringBuffer = new StringBuffer();
		for (int i = 0; i < strs.length; i++) {
			stringBuffer.append(strs[i]);
		}
		return stringBuffer.toString();
	}
}
