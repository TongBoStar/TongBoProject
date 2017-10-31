package com.terrence.crm.dol.contasnt;


public enum ICItemDesign {
	name_1("公称直径DN","fdn"),
	name_2("公称压力PN","fpn"),
	name_3("产品名称","fpdname"),
	name_4("产品型号Type","fpdtype"),
	name_5("最大进口压力","fmaxip"),
	name_6("Ps","fps"),
	name_7("进口压力范围","fipr"),
	name_8("Bpu","fbpu"),
	name_9("出口压力范围","fopr"),
	name_10("Wds","fwd"),
	name_11("设定压力范围Wd","fwds"),
	name_12("设定压力Pds","fpds"),
	name_13("阀体材质","fbody"),
	name_14("流量系数Cg","fcg");
	
	private String name;
	private String index;
	private ICItemDesign(String name,String index)
	{
		this.name=name;
		this.index=index;
	}
	public static String getName(int index)
	{
		for(ICItemDesign tts:ICItemDesign.values())
		{
			if(tts.getIndex().equals(index))
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
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	
}