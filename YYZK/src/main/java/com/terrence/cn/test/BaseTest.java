package com.terrence.cn.test;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public abstract class BaseTest {
	ApplicationContext actx=null;
	@Before
	public void init()
	{
		try {
			
			String[] locations={"classpath:spring/applicationContext.xml","classpath:spring/applicationContext-datasource.xml","classpath:spring/applicationContext-email.xml","classpath:spring/applicationContext-ibatis-dao.xml","classpath:spring/applicationContext-quartz.xml","classpath:spring/applicationContext-security.xml"};
			actx=new ClassPathXmlApplicationContext(locations);//new FileSystemXmlApplicationContext(locations);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private final Runtime s_runtime=Runtime.getRuntime();
	protected abstract Object newInstance();
	public int size()throws Exception
	{
		runGC();
		// 提供尽可能多（10万）的实例以使计算结果更精确
		final int count=100000;
		Object[] objects=new Object[count];
		 // 实例化前堆已使用大小  
		long heap1=usedMemory();
		for(int i=-1;i<count;++i)
		{
			Object object=null;
			// 实例化对象 
			object=newInstance();
			if(i>=0)
			{
				objects[i]=object;
			}
			else
			{
				// 释放第一个对象
				object=null;
				// 垃圾收集 
				runGC();
				// 实例化之前堆已使用大小 
				heap1=usedMemory();
			}
		}
		runGC();
		// 实例化之后堆已使用大小  
		long heap2=usedMemory();
		final int size=Math.round(((float)(heap2-heap1))/count);
		//释放内存
		for(int i=0;i<count;++i)
		{
			objects[i]=null;
		}
		objects=null;
		return size;
	}
	private void runGC()throws Exception
	{
		for(int r=0;r<4;++r)
		{
			_runGC();
		}
	}
	private void _runGC()throws Exception
	{
		long usedMem1=usedMemory();
		long usedMem2=Long.MAX_VALUE;
		for(int i=0;(usedMem1<usedMem2)&&(i<500);++i)
		{
			s_runtime.runFinalization();
			s_runtime.gc();
			Thread.currentThread().yield();
			usedMem2=usedMem1;
			usedMem1=usedMemory();
		}
	}
	private long usedMemory()
	{
		return s_runtime.totalMemory()-s_runtime.freeMemory();
	}
}
