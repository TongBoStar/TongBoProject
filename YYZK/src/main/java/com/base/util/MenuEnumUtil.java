package com.base.util;

public class MenuEnumUtil {
	public enum MenuEnum{
		Menu000001000001000002(10L,"日常工作"),
		Menu000002000001000002(14L,"用车申请"),
		Menu000002000002000002(17L,"用车申请");
		
		public Long value;
		public String valueName;
		
		private MenuEnum(Long value,String valueName){
			this.value = value;
			this.valueName = valueName;
		}
	}
}
