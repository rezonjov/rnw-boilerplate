# Integration iOS ARKit with React Native

## High Level Arhictecture of React Native

![image](https://user-images.githubusercontent.com/129856/122944972-7077e380-d3a2-11eb-9c7b-ba47c3eb88e7.png)

## Pre-requisites

Please follow the steps detailed on the following page to enable ARCore:

https://developers.google.com/ar/develop/java/enable-arcore#ar-optional

## ARCore & Rendering Engine Concepts

- ARCore is just an AR engine that detects, compute and track anchor placement within an environment
- ARCore by itself is not enough to create an AR application, it needs a rendering engine to render the 3D objects.
- OpenGL ES 2.0 is one of the rendering engine for ARCore
- OpenGL ES or just GLES is the trimmed down mobile version of OpenGL. OpenGL is a low-level and powerful 2D and 3D drawing API.
- Since OpenGL ES is a low-level library, it does require significant knowledge of 2D/3D maths
- Google has provided sample renderer that we can use, for this project, we're using the renderer that Google has provided.
- Another alternative of OpenGL is to use Unity engine with ARFoundation - which is also officially supported by Google

## Implementing ARCore on React Native

To implement ARCore, you will need the following

```
├── android
|   ├── java / com / app
|   |   ├── common <-- helpers class eg. OpenGL renderer
|   |   ├── RNReactNativeArcoreCoreView.java
|   |   ├── RNReactNativeArcoreMainView.java
|   |   ├── RNReactNativeArcoreViewManager.java
|   |   ├── RNReactNativeArcoreModule.java
|   |   ├── RNReactNativeArcorePackage.java
|   ├── res
|   |   ├── layout
|   |   |   ├── activity_main.xml
├── foundation
|   ├── ARCore.tsx
```

### Breakdown\*\*

- **RNReactNativeArcorePackage.java** - to create a RN native module, we need to have a package class and add it to `MainApplication.java`.
  - Package overrides 2 functions: `createNativeModules` and `createViewManagers`.
  - Return `RNReactNativeArcoreModule` instance for `createNativeModules`
  - Return `RNReactNativeArcoreViewManager` instance for `createViewManagers`
- **RNReactNativeArcoreModule.java** - context module, provides some helper ARCore support
- **RNReactNativeArcoreViewManager.java** - view manager responsible for creating the view activity
- **RNReactNativeArcoreMainView.java** - a wrapper class responsible for communcation between RN & Android, it extends `RNReactNativeArcoreCoreView`
- **RNReactNativeArcoreCoreView.java** - core view class responsible for instantiating ARCore and Open GL rendering, contains logic for AR functionality.
- **activity_main.xml** - declaration for `GLSurfaceView` for AR view

**Note**: `RNReactNativeArcoreCoreViewTwo.java` is the version used for this integration, `RNReactNativeArcoreCoreView.java` is a working sample but uses an outdated libraries.

### Communication RN & Android

#### RN to Android

We have two options here:

1. Use properties to pass variable from RN to Android <- we use this approach for this integration
2. Create an external function in `RNReactNativeArcoreModule` that we can call on RN

#### Android to RN

We have two options here as well, both use `Events` but are different events.

1. [Signal Events](https://reactnative.dev/docs/native-modules-android#sending-events-to-javascript) - sends a signal event to the JS side, we then use listener on JS side to capture events emitted from Native. We use `DeviceEventManagerModule.RCTDeviceEventEmitter` to send event and implmement it on `RNReactNativeArcoreModule`

- [UI Events](https://reactnative.dev/docs/native-components-android#5-implement-the-javascript-module) - sends native ui events from native to JS. Each native view has a JS representation and we use getId() to link the Native and JS side. <-- we used this for this integration
  **IMPORTANT** Events can be native or custom, for native events such as `topChange`, we need to use `getExportedCustomBubblingEventTypeConstants` and for custom events, we need to use `getExportedCustomDirectEventTypeConstants`.
