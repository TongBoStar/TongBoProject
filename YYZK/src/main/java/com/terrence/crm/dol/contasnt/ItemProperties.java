package com.terrence.crm.dol.contasnt;
/**
 * 物料属性
 * @author frank
 *
 */
public enum ItemProperties {
	BOUGHT("外购",1),OWNPRODUCT("自制",2),OUTSOURCED("委外加工",3),VIRTUAL("虚拟件",5);
	private String name;
	private int index;
	private ItemProperties(String name,int index)
	{
		this.name=name;
		this.index=index;
	}
	public static String getName(int index)
	{
		for(ItemProperties tts:ItemProperties.values())
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
