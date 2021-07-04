package com.rezon.rnweb; // replace com.your-app-name with your app’s name

import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import org.jetbrains.annotations.NotNull;

public class CalendarModule extends ReactContextBaseJavaModule {
    CalendarModule(ReactApplicationContext context) {
        super(context);
    }


    @NotNull
    @Override
    public String getName() {
        return "CalendarModule";
    }

    @ReactMethod
    public void createCalendarEvent(String name, String location) {
        Log.d("CalendarModule", "Create event: " + name
                + " and location: " + location);
    }
}
