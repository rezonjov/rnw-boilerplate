# Buns Castle Boilerplate

## Technology

### Platform
- App Center  
- Expo  for the developer environment 
- FCM  for push notification

### Libraries
- React Native for Web  as the main component library.  
- React Query  as the state management library.  
- react-navigation/react-navigation  as navigation library.  
- expo-font  to help us with font management for iOS, Android & Web 


## Getting started
### Prerequisites
#### Install Node 12 using NVM
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 12
nvm use 12
```

#### Install Expo CLI
```bash
npm install -g expo-cli
```

#### Install watchman, cocoapods & XCode (MacOS only)  
```bash
# watchman
brew install watchman

# cocoapods
sudo gem install cocoapods

# xcode
// Go to Mac App Store to install XCode

# Java SDK
brew install --cask adoptopenjdk/openjdk/adoptopenjdk8
```
 
#### Install Android Studio 
https://developer.android.com/studio/index.html


Add the following lines to your $HOME/.bash_profile or $HOME/.bashrc (if you are using zsh then ~/.zprofile or ~/.zshrc) config file:
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```


## Development & Build

### Web
```bash
# run Next.js development server
yarn next dev

# build
yarn next build
```

### Expo Go
To use Expo Go, you need to install Expo companion app, [🤖 Android](https://play.google.com/store/apps/details?id=host.exp.exponent), [🍎 iOS](https://itunes.com/apps/exponent)

Then run the following command
```bash
expo start
```

Use your Expo Go to scan the QR code (iOS use camera app), make sure your devices are in the same LAN as your computer and you don't have VPN running on your machine.

To run your development in production mode, use the following
```bash
expo start --no-dev --minify
```
Besides running in production mode (which tells the Metro bundler to set the __DEV__ environment variable to false, among a few other things) the --minify flag will minify your app, meaning it will get rid of any unnecessary data (comments, formatting, unused code). If you're getting an error or crash in your standalone app, running your project with this command can save you a lot of time in finding the root cause.

### Native iOS
To run the app on simulator or your device (make sure you connect your device to your machine, unlock and click `Trust this computer` on your iOS device and) run the following:
```bash
react-native run-ios

# to run in simulator 
npx react-native run-ios --simulator="iPhone 12"

# to run in production mode
npx react-native run-ios --configuration Release
```

### Native Android
To run the app on simulator or your device. One can use [Genymotion](https://www.genymotion.com/) for Android simulator.

```bash
npx react-native run-android

# to run in production mode 
npx react-native run-android --variant=release
```


## Debugging

The React Native Debugger includes a lot of tools to debug.
You can install it via the [release page](https://github.com/jhen0409/react-native-debugger/releases), or if you're on macOS you can run:
```bash
brew install --cask react-native-debugger
```

## Publishing to App Store & Play Store

### App Store
https://reactnative.dev/docs/publishing-to-app-store

### Play Store
https://reactnative.dev/docs/signed-apk-android

## What's Next
 
- Change bundle name (iOS & Android) to match your app bundle com.xxx.xxxx
- Add App Center key
