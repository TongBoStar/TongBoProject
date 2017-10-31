package com.terrence.crm.dol.contasnt;

public enum TeamTaskStatus {
	UNWORK("未开工",0),WORKING("已开工",1),WORKED("完工",2),NOWORKONTIME("未按时完工",3),UNFINISHED("到时未完工",4),UNCHECK("反检",5);
	private String name;
	private int index;
	private TeamTaskStatus(String name,int index)
	{
		this.name=name;
		this.index=index;
	}
	public static String getName(int index)
	{
		for(TeamTaskStatus tts:TeamTaskStatus.values())
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
	public static void main(String args[])
	{
		System.out.println(TeamTaskStatus.getName(1));
	}
}
