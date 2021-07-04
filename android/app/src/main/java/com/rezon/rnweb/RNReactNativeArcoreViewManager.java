package com.rezon.rnweb;

import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;

import java.util.Map;

public class RNReactNativeArcoreViewManager extends ViewGroupManager<RNReactNativeArcoreMainView> {

    public static final String PROPS_VIEW_MODE = "viewMode";
    private RNReactNativeArcoreModule mContextModule;

    public RNReactNativeArcoreViewManager(ReactApplicationContext reactContext) {
        mContextModule = new RNReactNativeArcoreModule(reactContext);
    }

    @Override
    public String getName() {
        return "RNReactNativeArcoreModule";
    }

    @Override
    protected RNReactNativeArcoreMainView createViewInstance(ThemedReactContext reactContext) {
        return new RNReactNativeArcoreMainView(reactContext, mContextModule.getActivity());
    }


    // !!! Need to use Direct event and not Bubbling for Custom Event
    @Override
    public Map getExportedCustomDirectEventTypeConstants() {
        Log.d("ARCore", "View Manager");

        return MapBuilder.of(
                "ARCoreTouch",
                MapBuilder.of("registrationName", "onTouchEvent")
        );

    }
}