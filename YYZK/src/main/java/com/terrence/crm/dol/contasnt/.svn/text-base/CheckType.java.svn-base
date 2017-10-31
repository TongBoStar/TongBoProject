package com.terrence.crm.dol.contasnt;

public enum CheckType {
	FIRSTCHECK("首检",1),TOUR("巡检",2),ENDCHECK("终检",3);
	private String name;
	private int index;
	private CheckType(String name,int index)
	{
		this.name=name;
		this.index=index;
	}
	public static String getName(int index)
	{
		for(CheckType tts:CheckType.values())
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
