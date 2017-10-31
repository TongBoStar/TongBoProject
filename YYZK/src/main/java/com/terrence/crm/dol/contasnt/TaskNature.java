package com.terrence.crm.dol.contasnt;

public enum TaskNature {
	UNWORK("订单",14087),WORKING("备货",14088),WORKED("试制",14089);
	private String name;
	private int index;
	private TaskNature(String name,int index)
	{
		this.name=name;
		this.index=index;
	}
	public static String getName(int index)
	{
		for(TaskNature tts:TaskNature.values())
		{
			if(tts.getIndex()==index)
			{
				return tts.name;
			}
		}
		return null;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
}
