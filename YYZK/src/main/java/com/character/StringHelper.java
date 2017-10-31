package com.character;

public class StringHelper {

	public static String padLeft(String s, int n, String replace) {
		while (s.length() < n) {
			s = replace + s;
		}
		return s;
	}

	public static String padRight(String s, int n, String replace) {
		while (s.length() < n) {
			s = s + replace;
		}
		return s;
	}

	/**
	 * 判断字符串是否为空值
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isNull(String... obj) {
		for (String s : obj) {
			if (s == null || "".equals(s)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 如果字符串是以指定的字符串结尾，则删除
	 * 
	 * @param originalString
	 * @param delChar
	 * @return
	 */
	public static String delEndChar(String originalString, String delChar) {
		if (originalString.endsWith(delChar)) {
			return originalString.substring(0,
					originalString.lastIndexOf(delChar));
		} else {
			return originalString;
		}
	}

	/**
	 * 如果字符串是以指定的字符串开头，则删除
	 * 
	 * @param originalString
	 * @param delChar
	 * @return
	 */
	public static String delStartChar(String originalString, String delChar) {
		if (originalString.startsWith(delChar)) {
			return originalString.substring(delChar.length());
		} else {
			return originalString;
		}
	}

	public static String delChar(String originalString, String delChar) {
		return delEndChar(delStartChar(originalString, delChar), delChar);
	}

	public static String changeString(String str) {
		// str含有HTML标签的文本
		str = str.replace("<", "&lt;");
		str = str.replace(">", "&gt;");
		str = str.replace(" ", "&nbsp;");
		str = str.replace("\n", "<br>");
		str = str.replace("&", "&amp;");
		return str;
	}

	public static String htmlEncode(String content) {
		// if (source == null) {
		// return "";
		// }
		// String html = "";
		// StringBuffer buffer = new StringBuffer();
		// for (int i = 0; i < source.length(); i++) {
		// char c = source.charAt(i);
		// switch (c) {
		// case '<':
		// buffer.append("&lt;");
		// break;
		// case '>':
		// buffer.append("&gt;");
		// break;
		// case '&':
		// buffer.append("&amp;");
		// break;
		// case '"':
		// buffer.append("&quot;");
		// break;
		// case 10:
		// case 13:
		// break;
		// default:
		// buffer.append(c);
		// }
		// }
		// html = buffer.toString();
		// return html;
		if (content == null)
			return "";
		String html = content;
		html = html.replace("'", "&apos;");
		html = html.replace("\"", "&quot;");
		html = html.replace("\n\r", "<br>  ");
		html = html.replace("\r\n", "<br>  ");
		html = html.replace("\t", "&nbsp;&nbsp;");// 替换跳格
		// html = StringUtils.replace(html, " ", "&nbsp;");// 替换空格
		html = html.replace("<", "&lt;");
		html = html.replace(">", "&gt;");
		return html;

	}

	public static String string2Json(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			switch (c) {
			case '\"':
				sb.append("\\\"");
				break;
			case '\\':
				sb.append("\\\\");
				break;
			case '/':
				sb.append("\\/");
				break;
			case '\b':
				sb.append("\\b");
				break;
			case '\f':
				sb.append("\\f");
				break;
			case '\n':
				sb.append("\\n");
				break;
			case '\r':
				sb.append("\\r");
				break;
			case '\t':
				sb.append("\\t");
				break;
			default:
				sb.append(c);
			}
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(delStartChar("/$$dsfsfaf", "/$$"));
		System.out.println(delEndChar("/dsfsfaf/$$", "/$$"));
	}

}
