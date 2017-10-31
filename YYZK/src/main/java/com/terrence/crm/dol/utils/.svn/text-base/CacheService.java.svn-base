package com.terrence.crm.dol.utils;

import java.util.Date;

import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;

public class CacheService {
	public static MemCachedClient mcc=new MemCachedClient();
	protected static CacheService memCached=new CacheService();
	static
	{
		String [] servers={"127.0.0.1:11211"};
		Integer[] weights={3};
		SockIOPool pool=SockIOPool.getInstance();
		pool.setServers(servers);
		pool.setWeights(weights);
		pool.setInitConn(5);
		pool.setMinConn(5);
		pool.setMaxConn(250);
		pool.setMaxIdle(1000*60*60*6);
		pool.setMaintSleep(30);
		pool.setNagle(false);
		pool.setSocketTO(3000);
		pool.setSocketConnectTO(0);
		pool.initialize();
		mcc.setCompressEnable(true);
		mcc.setCompressThreshold(64*1024);
	}
	protected CacheService()
	{
		
	}
	 /**
     * 获取唯一实例.
     *@return
    */
   public static CacheService getInstance()
    {
       return memCached;
    }
	public boolean add(String key, Object value)
    {
       return mcc.add(key, value);
    }
   
   public boolean add(String key, Object value, Date expiry)
    {
       return mcc.add(key, value, expiry);
    }
   
   public boolean replace(String key, Object value)
    {
       return mcc.replace(key, value);
    }
   
   public boolean replace(String key, Object value, Date expiry)
    {
	    
       return mcc.replace(key, value, expiry);
    }
   public boolean delete(String key )
   {
	    
      return mcc.delete(key);
   }
   public boolean flushAll( )
   {
	    
      return mcc.flushAll();
   }
   /**
    * 根据指定的关键字获取对象.
    *@paramkey
    *@return
   */
  public Object get(String key)
   {
      return mcc.get(key);
   }
	public static void main(String args[])
	{		
//		for(int i=0;i<6;i++)
//		{
//			NewsFeed newsFeed=new NewsFeed();
//			newsFeed.setTitle("tilte"+i);
//			newsfeedList.add(newsFeed);
//		}
//		mcc.set(NEWSFEEDKEY, newsfeedList);
//		List list = new ArrayList();
//		for(int i=0;i<12;i++){
//			NewsFeed newsFeed=new NewsFeed();
//			newsFeed.setFlag(2);
//			list.add(newsFeed);
//		}
//		CacheService.mcc.add(CacheService.INITNEWSFEEDKEY, list);
		//List<NewsFeed> u=(List<NewsFeed>)mcc.get(NEWSFEEDKEY);
		//CacheService.newsfeedList=(List<NewsFeed>)CacheService.mcc.get(CacheService.NEWSFEEDKEY);
		//CacheService.initNewsFeedList=(List<NewsFeed>)CacheService.mcc.get(CacheService.INITNEWSFEEDKEY);
		//System.out.println(CacheService.newsfeedList.get(0).getTrappingname());
		//System.out.println(CacheService.newsfeedList.get(0).getFlag());
		//listBlade=(List<Blade>)CacheService.mcc.get(CacheService.BLADEKEY);
		/*for(int i=0;i<CacheService.newsfeedList.size();i++)
		{
		System.out.println(CacheService.newsfeedList.get(i));
		CacheService.newsfeedList.remove(1);
		}*/
	}
}
