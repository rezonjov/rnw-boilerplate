package com.rezon.rnweb;

import android.net.Uri;
import android.widget.VideoView;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

import org.jetbrains.annotations.NotNull;

public class VideoViewManager extends SimpleViewManager<VideoView> {
    public static final String REACT_CLASS = "VideoView";

    @NotNull
    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @NotNull
    @Override
    protected VideoView createViewInstance(@NotNull ThemedReactContext reactContext) {
        return new VideoView(reactContext);
    }

    @ReactProp(name="url")
    public void setVideoPath(VideoView videoView, String urlPath) {
        Uri uri = Uri.parse(urlPath);
        videoView.setVideoURI(uri);
        videoView.start();
    }
}