/**
 * 
 */
package com.terrence.crm.dol.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.terrence.crm.dol.base.utils.ConvertUtils;
import com.terrence.crm.dol.base.utils.DES;



/**
 * @author Administrator
 *
 */
public class StringCodeUtils {
	private static DES des = new DES("disney.cn");
	protected static Logger logger = LoggerFactory.getLogger(StringCodeUtils.class);
	private static char[] randomStringPool = "1234567890qwrtyuiopasdfghjklzxcvbnmMNBVCXZLKJHGFDSAPOIUYTREWQ".toCharArray();
	/**
	 * 解密
	 * @param str 字符串
	 * @return 解密字符串
	 */
	public static String decode(String str){
		//加密 解密 
		try {
			str = new String(des.DESDecrypt(ConvertUtils.HexStringToBytes(str)));
		} catch (Exception e) {
			logger.warn("decode error", e);
		}
		return str;
	}
	/**
	 * 加密
	 * @param str 字符串
	 * @return 加密字符串
	 */
	public static String encode(String str){
		try {
			str = ConvertUtils.BytesToHexString(des.DESEncrypt(str.getBytes()));
		} catch (Exception e) {
			logger.warn("encode error", e);
		}
		return str;
	}
	
	public static String random(int length){
		StringBuffer rnt = new StringBuffer();
		int poolLength = randomStringPool.length;
		java.util.Random r = new java.util.Random();
		for(int i=0;i<length;i++){
			int index = r.nextInt(poolLength);
			rnt.append(randomStringPool[index]);
		}
		return rnt.toString();
	}
	/**
	 * 
	 * @param seqval
	 * @param len
	 * @return
	 */
	public static String generatorseq(Integer seqval,Integer len)
	{
		int vallen=seqval.toString().length();
		String str="";
		while(vallen<len.intValue())
		{
			str+="0";
			vallen++;
		}
		return str+seqval;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*String str = "123456789_1305940474449_127.111.111.111_AOIGr1";
		String encodeStr = StringCodeUtils.encode(str);
		System.out.println("encodeStr:"+encodeStr);
		System.out.println("e"+StringCodeUtils.encode("123456789_1305940474449_127.111.111.111_"));
		System.out.println("e"+StringCodeUtils.encode("AOIGr"));
		encodeStr = "1A60104F5536D3DE035A030FCB787ECE359877CE77C745A08B1CA09DB9BE2F0756D6193199501CB7";
		String decodeStr = StringCodeUtils.decode(encodeStr);
		System.out.println("decodeStr:"+decodeStr);
		System.out.println(StringCodeUtils.random(4));*/
		System.out.println(generatorseq(1,6));
	}

}
