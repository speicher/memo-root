package org.memo.core.common;

import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.CollectionUtils;

//import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 通用函数类
 * @author Danica
 * @date 2016-4-29
 */
public class CommonMethod {

	public static String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	public static String getRound(double d) {
		if (d == 0) {
			return "0";
		}
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(d);
	}

	@SuppressWarnings("unused")
	private static String replace(String str, String replace, String replaceStr) {
		if (str != null) {
			int i = str.indexOf(replace);
			int j = 0;
			while (i != -1) {
				j++;
				str = str.substring(0, i) + replaceStr + str.substring(i + replace.length());
				i = str.indexOf(replace, i + replaceStr.length());
			}
		}
		return str;
	}

	public static String htmlType(String s) {
		if (s == null || s.toLowerCase().equals("null")) {
			return "";
		}
		s = replace(s, " ", "&nbsp;");
		s = replace(s, "\r\n", "<br>");
		return s;
	}

	/**
	 * 判断该字符串是否为中文
	 * 
	 * @param str
	 *            String 输入字符
	 * @return boolean
	 */
	public static boolean IsChinese(String str) {
		if (str.matches("[\u4e00-\u9fa5]+")) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isGB(String str) {
		if (null == str) {
			return false;
		}
		if (str.trim() == "") {
			return false;
		}
		byte[] bytes = str.getBytes();
		if (bytes.length < 2) {
			return false;
		}
		byte aa = (byte) 0xB0;
		byte bb = (byte) 0xF7;
		byte cc = (byte) 0xA1;
		byte dd = (byte) 0xFE;
		if (bytes[0] >= aa && bytes[0] <= bb) {
			if (bytes[1] < cc || bytes[1] > dd) {
				return false;
			}
			return true;
		}
		return false;
	}

	public static boolean isBig5(String str) {
		if (null == str) {
			return false;
		}
		if (str.trim() == "") {
			return false;
		}
		byte[] bytes = str.getBytes();
		if (bytes.length < 2) {
			return false;
		}
		byte aa = (byte) 0xB0;
		byte bb = (byte) 0xF7;
		byte cc = (byte) 0xA1;
		byte dd = (byte) 0xFE;
		if (bytes[0] >= aa && bytes[0] <= bb) {
			if (bytes[1] < cc || bytes[1] > dd) {
				return true;
			}
			return false;
		}
		return false;
	}

	/**
	 * 对字符串进行MD5加密
	 * 
	 * @param plainText
	 *            String
	 * @return String
	 */
	public static String md5(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0) {
					i += 256;
				}
				if (i < 16) {
					buf.append("0");
				}
				buf.append(Integer.toHexString(i));
			}
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		}
	}

	/** 将输入字符串转化为utf8编码,并返回该编码的字符串 */
	public static String changeEncode(String in) {
		String s = null;
		byte temp[];
		if (in == null) {
			System.out.println("Warn:Chinese null founded!");
			return new String("");
		}
		try {
			temp = in.getBytes("utf8");
			s = new String(temp);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.toString());
		}
		return s;
	}

	/** 根据时间生成唯一编号 */
	public static String buildNumber(int length) {
		long time = System.currentTimeMillis();

		Random random = new Random();
		StringBuffer buffer = new StringBuffer().append(time);

		String result = "";

		if (buffer.length() >= length) {
			buffer = new StringBuffer();
			for (int i = 0; i < length; i++) {
				buffer.append(random.nextInt(9));
			}
		} else {
			for (int i = 0; i < (length - buffer.length()); i++) {
				buffer.append(random.nextInt(9));
			}
		}

		result = buffer.toString();
		return result;
	}

	/**
	 * 获取国际化资源文件中的键所对应的值
	 * 
	 * @param key
	 * @return
	 */
	public static String getLocaleBundleResourceValue(String key) {
		// 获取系统默认的国家/语言环境
		Locale myLocale = Locale.getDefault();
		// 根据指定的国家/语言环境加载资源文件
		ResourceBundle bundle = ResourceBundle.getBundle("yitianplatform", myLocale);
		// 获取资源文件中的key为hello的value值
		return bundle.getString(key);

	}

	/**
	 * @Title: writeTxt
	 * @Description: 将list的内容写入到指定的txt文档里
	 * @param @param dir
	 * @param @param list
	 * @param @throws IOException 设定文件
	 * @return void 返回类型
	 * @author zhu.b
	 * @date 2011-6-16 下午01:32:31
	 * @throws
	 */
	public static void writeTxt(String dir, List<Object> list) throws IOException {
		FileWriter fileWriter = new FileWriter(dir);
		for (int i = 0; i < list.size(); i++) {
			fileWriter.write(String.valueOf(list.get(i) + ""));

		}
		fileWriter.flush();
		fileWriter.close();

	}

	/**
	 * wei.hj
	 * 判断list是否有值 
	 * */
	@SuppressWarnings("rawtypes")
	public static boolean hasValue(List list) {
		return ((null != list) && (list.size() > 0));
	}

	public static boolean hasValue(String s) {
		return (s != null) && (s.trim().length() > 0);
	}

	/**
	 * wei.hj
	 * 验证是否为Double
	 * @param value
	 * @return
	 */
	public static boolean validateDouble(String value) {
		if (value == null || value.equals(""))
			return false;
		try {
			new Double(value);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/**
	 * wei.hj
	 * 验证是否为Long
	 * @param value
	 * @return
	 */
	public static boolean validateLong(String value) {
		if (value == null || value.equals(""))
			return false;
		try {
			new Long(value);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/**
	 * wei.hj
	 * 验证是否为Date类型
	 * @param value
	 * @return
	 */
	public static boolean validateDate(String value) {
		if (value == null || value.equals(""))
			return false;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			sdf.setLenient(false);
			sdf.parse(value);
			System.out.println(sdf.parse(value));
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/**
	 * wei.hj
	 * 从字符串转换为Double
	 * @param str
	 * @return
	 */
	public static double stringToDouble(String str) {
		NumberFormat formater = NumberFormat.getInstance();
		double value = 0;
		try {
			if (str == null || str.trim().length() == 0 || !validateDouble(str)) {
				str = "0";
			}
			value = formater.parse(str).doubleValue();
		} catch (Exception e) {
			// SuperContext.showExceptionMsg(e);
		}
		return value;
	}

	public static Map<String, String> conditionExpMap() {
		Map<String, String> conditionExpMap = new HashMap<String, String>();
		conditionExpMap.put("等于", "=");
		conditionExpMap.put("不等于", "<>");
		conditionExpMap.put("大于", ">");
		conditionExpMap.put("大于等于", ">=");
		conditionExpMap.put("小于", "<");
		conditionExpMap.put("小于等于", "<=");
		conditionExpMap.put("包含", "like"); 
		conditionExpMap.put("不包含", "not like");
		conditionExpMap.put("以开头", "like"); 
		conditionExpMap.put("以结尾", "like");
		return conditionExpMap;
	}

	public static String getConditionExpMap(String conditionExp) {
		return (conditionExpMap().get(conditionExp) != null) ? (String.valueOf(conditionExpMap().get(conditionExp)))
				: "=";
	}

	public static String getCurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());

	}

	public static String getCurrentDateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

	/**
	 * wei.hj
	 * 通过反射获得某方法信息
	 * @param owner
	 * @param methodName
	 * @param args
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Object invokeMethod(Object owner, String methodName, Object[] args) throws Exception {
		Class ownerClass = owner.getClass();
		Class[] argsClass = new Class[args.length];
		for (int i = 0, j = args.length; i < j; i++) {
			argsClass[i] = args[i].getClass();
		}
		Method method = ownerClass.getMethod(methodName, argsClass);
		return method.invoke(owner, args);
	}

	/**
	 * wei.hj
	 * 验证权限位
	 * @param power_value  存在 角色模块相关表中
	 * @param index  1-增加 2-修改   操作编号
	 * @return
	 */
	public static boolean checkPower(int power_value, int index) {
		boolean flag = false;
		int temp = (int) Math.pow(2, index);
		int result = power_value & temp;
		if (result == temp) {
			flag = true;
		}
		return flag;
	}
	
	public static boolean checkPower(String power_value,int index){
	    boolean flag=false;
	    String [] powerArray = power_value.split(",");
	    for(int i=0; i<powerArray.length; i++){
	        if(Integer.parseInt(powerArray[i]) == index){
	            flag = true;
	            break;
	        }
	    }
	    return flag;
	}

	public static String lPadNumber(Object object, int toalNum, String fixStr) {
		StringBuffer sbBuffer = new StringBuffer(String.valueOf(object).substring(0,
				String.valueOf(object).length() >= toalNum ? toalNum : String.valueOf(object).length()));
		sbBuffer = sbBuffer.reverse();
		int initLength = sbBuffer.length();
		for (int i = 0; i < toalNum - initLength; i++) {
			sbBuffer.append(fixStr);
		}
		return sbBuffer.reverse().toString();
	}
	/**
	 * 
	 * @param powerStr 1,2,3,4
	 * @return
	 */
	public static int getPower(String powerStr) {
		int result = 0;
		if (CommonMethod.hasValue(powerStr)) {
			String[] temp = powerStr.split(",");
			if (temp != null && temp.length > 0) {
				for (String tempV : temp) {
					if (hasValue(tempV)) {
						result += (int) Math.pow(2, Integer.valueOf(tempV));
					}
				}
			}
		}
		return result;
	}
	/**  
	 * 将字符串转换成ASCII码  
	 * @param cnStr  
	 * @return String  
	 */
	public static String getCnASCII(String cnStr) {
		StringBuffer strBuf = new StringBuffer();
		//将字符串转换成字节序列   
		byte[] bGBK = cnStr.getBytes();
		for (int i = 0; i < bGBK.length; i++) {
			//          System.out.println(Integer.toHexString(bGBK[i] & 0xff));   
			//将每个字符转换成ASCII码   
			strBuf.append(Integer.toHexString(bGBK[i] & 0xff));
		}
		return strBuf.toString();
	}

//	/**
//	 * 将json串转换为指定对象
//	 */
//	@SuppressWarnings({ "rawtypes", "unchecked" })
//	public static Object jsonToObject(byte[] jsonBytes, Class clazz) throws Exception {
//		Object object = null;
//		if (jsonBytes == null) {
//			return object;
//		}
//		ObjectMapper mapper = new ObjectMapper();
//		return mapper.readValue(jsonBytes, clazz);
//	}

	/**
	 * 转换成整型
	 * @param rowAccessWindowSizeStr
	 * @return
	 */
	public static Integer getRowAccessWindowSizeValue(String rowAccessWindowSizeStr) {

		Integer rowAccessWindowSize = 1;

		if (!StringUtils.isEmpty(rowAccessWindowSizeStr)) {

			try {

				rowAccessWindowSize = Integer.parseInt(rowAccessWindowSizeStr);
			} catch (NumberFormatException e) {

				rowAccessWindowSize = 1;
			}
		}

		return rowAccessWindowSize;
	}
	
	/**
	 * 分割字符串,返回String List
	 * @param input
	 * @param segment
	 * @return
	 */
	public static List<String> split2StringList(String input, String segment) {
		List<String> list = new ArrayList<String>();
		if (!StringUtils.isEmpty(input)) {
			String[] output = input.split(segment);
			for (int i = 0; i < output.length; i++) {
				String tmp = output[i];
				list.add(tmp);
			}
		} 
		return list;
	}
	
	/**
	 * list转为字符串
	 * @param list
	 * @return
	 */
	public static String splitList2String(List<String> list, String sparator){
		String result = "";
		if(!CollectionUtils.isEmpty(list)){
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < list.size(); i++){
				sb.append(list.get(i));
				if(i != (list.size() -1)){
					sb.append(sparator);
				}
			}
			result = sb.toString();
		}
		return result;
	}
	
	/**
	 * <p> 分割字符串,返回String  </p>
	 * <pre>
	 *  input: 1,2,3
	 *  segment: ,
	 *  result : '1','2','3'
	 *  </pre>
	 * @param input 
	 * @param segment 
	 * @return String
	 *  
	 */ 
	public static String split2StringList3(String input, String segment) {
 		String str = "";
		if (!StringUtils.isEmpty(input)) {
			String[] output = input.split(segment);
			StringBuffer s = new StringBuffer();
			for (int i = 0; i < output.length; i++) {
				String tmp = output[i];
				s.append("'");
				s.append(tmp);
  				s.append("'");
 				s.append(",");
			}
			str = s.toString().substring(0, s.toString().length()-1);
		} 
		return str;
	}

	/**
	 * jin.jd
	 * 货号去空格 （导入文件录进来空格会是\u00a0）
	 * @param str
	 * @return
	 */
	public static String trimAllBlank(String str) {
		if(null == str){
			return str;
		}
		str = str.trim();
		char[] chars = str.toCharArray();
		int pos = 0;
		for(int i = 0; i < chars.length; i++){
			if(chars[i] != 0xa0){
				chars[pos++] = chars[i];
			}
		}	        
		return new String(chars, 0, pos);
	}
	
	/**
	 * jin.jd
	 * object2MapWithoutNull方法重写，BigDecimal类型导出时 去掉.00
	 * @param obj
	 * @param map
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void object2MapWithoutNull(Object obj, Map<String, Object> map) throws IllegalArgumentException, IllegalAccessException{
//		NumberFormat numberFormat1 = NumberFormat.getNumberInstance();
		Field[] fields = obj.getClass().getDeclaredFields();
		for(int j = 0; j < fields.length; j++){
			fields[j].setAccessible(true);
			if(fields[j].get(obj) != null){
				if ((fields[j].get(obj) instanceof Date)){
					SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
					map.put(fields[j].getName(), sdf.format(fields[j].get(obj)));
		        } else if(fields[j].get(obj) instanceof BigDecimal){
		        	String strV = fields[j].get(obj).toString();
		        	String strV2 = strV.substring(0, strV.indexOf("."));		        	
		        	BigDecimal b1 = new BigDecimal(strV);
		    		BigDecimal b2 = new BigDecimal(strV2);
		    		if(b1.compareTo(b2) == 0){
//		    			暂不搞千分位：用户习惯拿导出的数据直接导入，数据格式会出错
//		    			map.put(fields[j].getName(), numberFormat1.format(b2.longValue()));//千分位
		    			map.put(fields[j].getName(), strV2);
		    		} else{
		    			map.put(fields[j].getName(), strV);
		    		}
		        } else {
		        	map.put(fields[j].getName(), fields[j].get(obj));
		        }
			} else {
				map.put(fields[j].getName(), "");
			}
		}
		Field[] fields2 = obj.getClass().getSuperclass().getDeclaredFields();
		for(int j = 0; j < fields2.length; j++){
			fields2[j].setAccessible(true);
			if(fields2[j].get(obj) != null){
				if ((fields2[j].get(obj) instanceof Date)){ 
					SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT); 
					map.put(fields2[j].getName(), sdf.format(fields2[j].get(obj)));
		        } else if(fields2[j].get(obj) instanceof BigDecimal){
		        	String strV = fields2[j].get(obj).toString();
		        	String strV2 = strV.substring(0, strV.indexOf("."));		        	
		        	BigDecimal b1 = new BigDecimal(strV);
		    		BigDecimal b2 = new BigDecimal(strV2);
		    		if(b1.compareTo(b2) == 0){
//		    			map.put(fields2[j].getName(), numberFormat1.format(b2.longValue()));//千分位
		    			map.put(fields2[j].getName(), strV2);
		    		} else{
		    			map.put(fields2[j].getName(), strV);
		    		}
		        } else {
		        	map.put(fields2[j].getName(), fields2[j].get(obj));
		        }
			} else {
				map.put(fields2[j].getName(), "");
			}
		}
	}

	/**
	 * 获取指定月份第一天
	 * @param date
	 * @return
	 */
	public static Date getMonthFisrtDay(Date date){
		Calendar  c=Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, 1);
		return c.getTime();
	}
	
	/**
	 * 获取指定月份最后一天
	 * @param date
	 * @return
	 */
	public static Date getMonthLastDay(Date date){
		Calendar  c=Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, 1);
		c.set(Calendar.DAY_OF_MONTH, 0);
		return c.getTime();
	}
	
	/**
	 * 验证正则表达式
	 * @param regex 正则字符串
	 * @param str 待验证字符串
	 * @return
	 */
	public  static boolean  checkRegex(String regex,String str){
		 Pattern pattern = Pattern.compile(regex);
		 return pattern.matcher(str).matches();
	}
	
	/**
	 * 验证合同扣率代码是否合法
	 * @param rateCode 扣率代码
	 * @return
	 */
	public static boolean checkContractRateCode(String rateCode){
		return checkRegex("^[a-zA-Z]*[0-9]*$", rateCode);
	}
	
	/**
	 * 验证促销扣率代码是否合法
	 * @param rateCode
	 * @return
	 */
	public static boolean checkPromotionRateCode(String rateCode){
		return checkRegex("^[b-zB-Z][a-zA-Z]*[0-9]*$", rateCode);
	}
	
	public static boolean equals(BigDecimal b1,BigDecimal b2){
		if(b1==null && b2==null){
			return true;
		}else if(b1!=null && b2!=null){
			return b1.compareTo(b2)==0;
		}else{
			return false;
		}
	}
	
	public static boolean equals(String s1,String s2){
		if(s1==null && s2==null){
			return true;
		}else if(s1!=null && s2!=null){
			return s1.equals(s2);
		}else{
			return false;
		}
		
	}
	
	public static boolean  equals(Short s1,Short s2){
		if(s1==null && s2==null){
			return true;
		}else if(s1!=null && s2!=null){
			return s1.compareTo(s2)==0;
		}else{
			return false;
		}
	}
}
