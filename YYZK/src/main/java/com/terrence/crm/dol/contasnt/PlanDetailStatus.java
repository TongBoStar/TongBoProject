package com.terrence.crm.dol.contasnt;


public enum PlanDetailStatus {
	PLAN("待审",0),ENTRY("已审",1),DOWN("下达",2),END("结案",3),COLSE("关闭",4);
	private String name;
	private int index;
	private PlanDetailStatus(String name,int index)
	{
		this.name=name;
		this.index=index;
	}
	public static String getName(int index)
	{
		for(PlanDetailStatus tts:PlanDetailStatus.values())
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
	@Override
    public String toString() {
    return this.getName();
    } 
}
