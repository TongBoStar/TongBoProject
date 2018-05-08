package com.yiyunzk.demo;
import android.app.Application;

import com.youku.cloud.player.YoukuPlayerConfig;
import com.youku.cloud.player.YoukuProfile;

/**
 * Created by liyh on 2017/2/8.
 */

public class MApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        YoukuPlayerConfig.setClientIdAndSecret(YoukuProfile.CLIENT_ID,YoukuProfile.CLIENT_SECRET);
        YoukuPlayerConfig.onInitial(this);
        YoukuPlayerConfig.setLog(false);
    }
}
