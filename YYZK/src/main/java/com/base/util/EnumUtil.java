package com.base.util;

public class EnumUtil {
	/**
	 * 审批状态
	 */
	public enum APPLY_STATUS {
		DRAFT(0, "草稿","Grey"), DOING(1, "办理中","green"), FINISH(2, "已结束","red");
		public int value;
		public String valueName;
		public String backColor;
		private APPLY_STATUS(int value, String valueName,String backColor) {
			this.value = value;
			this.valueName = valueName;
			this.backColor = backColor;
		}
		public static String valueOf(int a) {
			String tmp = "";
			for (int i = 0; i < values().length; i++) {
				if (values()[i].value == a) {
					tmp = values()[i].valueName;
					break;
				}
			}
			return tmp;
		}
	}
	
	/**
	 * 任务状态
	 * @author hf.cao
	 *
	 */
	public enum TASK_COMPLETION_STATUS{
		DRAFT(0, "待分配","Grey"), DOING(1, "完成中","green"), FINISH(2,"已完成","red");
		public int value;
		public String valueName;
		public String backColor;
		
		private TASK_COMPLETION_STATUS(int value, String valueName,String backColor) {
			this.value = value;
			this.valueName = valueName;
			this.backColor = backColor;
		}
	}
}
