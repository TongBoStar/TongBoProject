package com.terrence.crm.common.util;

import java.io.UnsupportedEncodingException;

public class CharSet {

	public static String toUnicode(String s) {
        StringBuffer stringbuffer = new StringBuffer();
        Object obj = null;
        if (s == null || s.equals(""))
            return "";
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (isChinese(c)) {
                stringbuffer.append("&#x");
                stringbuffer.append(Integer.toHexString(c));
                stringbuffer.append(";");
                continue;
            }
            switch (c) {
                case 32: // ' '
                    stringbuffer.append("&#32;");
                    break;

                case 34: // '"'
                    stringbuffer.append("&quot;");
                    break;

                case 38: // '&'
                    stringbuffer.append("&amp;");
                    break;

                case 60: // '<'
                    stringbuffer.append("&lt;");
                    break;

                case 62: // '>'
                    stringbuffer.append("&gt;");
                    break;

                default:
                    stringbuffer.append(c);
                    break;
            }
        }

        return stringbuffer.toString();
    }

    public static boolean isChinese(char c) {
        String s;
        Character character = new Character(c);
        s = character.toString();
        byte abyte0[] = new byte[0];
        try {
            abyte0 = s.getBytes("gb2312");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return abyte0.length > 1;
    }

    public static String getDigital(String s) {
        if (s == null || s.trim().length() == 0)
            return "0";
        StringBuffer stringbuffer = new StringBuffer();
        int i = 0;
        int j = 0;
        do {
            if (j >= s.length())
                break;
            if (Character.isDigit(s.charAt(j))) {
                i = j;
                break;
            }
            j++;
        } while (true);
        for (int k = i; k < s.length() && Character.isDigit(s.charAt(k)); k++)
            stringbuffer.append(s.charAt(k));

        return stringbuffer.toString();
    }

    public static String getChartNumber(int i) {
        if (i <= 0 || i >= NUMBER_CHART.length)
            return "";
        else
            return new String(NUMBER_CHART[i - 1]);
    }

    public static String utf2GB(String s) {
        String s1 = null;
        try {
            byte abyte0[] = s.getBytes("ISO8859_1");
            s1 = new String(abyte0, "gb2312");
        }
        catch (Exception exception) {
            return "";
        }
        return s1;
    }

    private static final String PRE_FIX_HTML = "&";
    private static final String PRE_FIX_UTF = "&#x";
    private static final String POS_FIX_UTF = ";";
    private static final byte NUMBER_CHART[][] = {
            {
                    -94, -39
            }, {
            -94, -38
    }, {
            -94, -37
    }, {
            -94, -36
    }, {
            -94, -35
    }, {
            -94, -34
    }, {
            -94, -33
    }, {
            -94, -32
    }, {
            -94, -31
    }, {
            -94, -30
    }, {
            -4, -95
    }, {
            -4, -94
    }, {
            -4, -93
    }, {
            -4, -92
    }, {
            -4, -91
    }, {
            -4, -90
    }, {
            -4, -89
    }, {
            -4, -88
    }, {
            -4, -87
    }, {
            -4, -86
    }, {
            -4, -85
    }, {
            -4, -84
    }, {
            -4, -83
    }, {
            -4, -82
    }, {
            -4, -65
    }, {
            -4, -80
    }, {
            -4, -79
    }, {
            -4, -78
    }, {
            -4, -77
    }, {
            -4, -76
    }, {
            -4, -75
    }
    };
	
}
