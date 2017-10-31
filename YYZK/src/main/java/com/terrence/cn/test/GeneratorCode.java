package com.terrence.cn.test;
import org.apache.log4j.Logger;
import com.terrence.cn.test.gencode.GenCode;
public class GeneratorCode {
	private static final Logger log = Logger.getLogger(GeneratorCode.class);
	public static void main(String[] args) {
		log.debug("代码生成开始!");
		GenCode genCode = new GenCode();
		try {
			//genCode.setOtherPath("D:\\workspace\\ProductionStepCore");
			genCode.genCodeMain("t_unityscene");
			log.debug("代码已经生成,请刷新工程!");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
}