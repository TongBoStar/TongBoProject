package com.terrence.crm.dol.contasnt;

public enum ItemProcessStatus {
	NOTMAKE("未制做",0),MAKING("制做中",5),WAITCHECK("待审核",1),REGECT("驳回",2),PASS("通过",3);
	private String name;
	private int index;
	private ItemProcessStatus(String name,int index)
	{
		this.name=name;
		this.index=index;
	}
	public static String getName(int index)
	{
		for(ItemProcessStatus tts:ItemProcessStatus.values())
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
