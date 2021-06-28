package com.rezon.rnweb;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ReactImagePackage implements ReactPackage {

    @SuppressWarnings("rawtypes")
    @NotNull
    @Override
    public List<ViewManager> createViewManagers(@NotNull ReactApplicationContext reactContext) {
        return Arrays.<ViewManager>asList(
                new ReactImageManager(reactContext)
        );
    }

    @NotNull
    @Override
    public List<NativeModule> createNativeModules(
            @NotNull ReactApplicationContext reactContext) {
        List<NativeModule> modules = new ArrayList<>();

        modules.add(new ReactImageManager(reactContext));

        return modules;
    }
}