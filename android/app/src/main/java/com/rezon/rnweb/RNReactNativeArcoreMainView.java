package com.rezon.rnweb;

import android.app.Activity;
import android.graphics.Color;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.events.RCTEventEmitter;


public class RNReactNativeArcoreMainView extends LinearLayout implements RNReactNativeArCoreViewTwo.CoreViewCallback {

    RNReactNativeArCoreViewTwo arCoreView;
    Activity mActivity;

    public RNReactNativeArcoreMainView(ThemedReactContext context, Activity activity)
    {
        super(context);
        Log.d("React:", "RNReactNativeArcoreMainView(Constructor)");

        mActivity = activity;
        this.setOrientation(LinearLayout.VERTICAL);
        // add the buttons and signature views
        this.setBackgroundColor(Color.TRANSPARENT);
        this.arCoreView = new RNReactNativeArCoreViewTwo(context,this);
        this.addView(arCoreView);
        setLayoutParams(new android.view.ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
    }


    @Override
    public void touchEvent(WritableMap event) {
        Log.d("ARCore", "Touch event: " + event);

        ReactContext reactContext = (ReactContext)getContext();
        reactContext.getJSModule(RCTEventEmitter.class).receiveEvent(getId(), "ARCoreTouch", event);
    }

}
