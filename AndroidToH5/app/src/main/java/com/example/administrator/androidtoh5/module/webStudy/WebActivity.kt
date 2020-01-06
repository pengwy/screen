
package com.example.administrator.androidtoh5.module.webStudy

//import android.content.Intent
//import android.net.Uri
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
//import android.view.View
import com.example.administrator.androidtoh5.R
//import com.example.administrator.androidtoh5.util.L
//import com.example.administrator.androidtoh5.util.WebUtil
import kotlinx.android.synthetic.main.activity_web.*




/**
 * Created by 舍长
 * describe:介绍了webView加载网页的几个方法
 */
class WebActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_web)
        //设置js权限
        val mwebViewSetting = mWebView.settings
        mwebViewSetting.setJavaScriptEnabled(true)
        mwebViewSetting.setJavaScriptCanOpenWindowsAutomatically(true);
        mwebViewSetting.setDomStorageEnabled(true);
        //加载网页url地址
        mWebView.loadUrl("https://screen.cw100.com/login")
    }

}
