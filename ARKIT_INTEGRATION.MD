# Integration iOS ARKit with React Native

## High Level Arhictecture of React Native

![image](https://user-images.githubusercontent.com/129856/122944972-7077e380-d3a2-11eb-9c7b-ba47c3eb88e7.png)


## Embed Native view on React Native

<img src="https://user-images.githubusercontent.com/129856/122945023-78378800-d3a2-11eb-84a5-669914ab2f05.png" width="350">

RN is still the main view and Native is embeded inside RN View, it occupies a rectangle section inside RN. Native communicates to RN via `Events` and we use `props` from RN to initialize Native views.

- PROS: Both RN & Native are still `active` and can communicate between each other
- CONS: Events are async and gives no guarantee about execution time.

### Native Implementation

Native views are created and manipulated by subclasses of RCTViewManager. These subclasses are similar in function to view controllers, but are essentially singletons - only one instance of each is created by the bridge. They expose native views to the RCTUIManager, which delegates back to them to set and update the properties of the views as necessary. The RCTViewManagers are also typically the delegates for the views, sending events back to JavaScript via the bridge.

Do note that `RCT` is the prefix for `REACT`

To expose we need to:

- Subclass RCTViewManager to create a manager for the component.
- Add the RCT_EXPORT_MODULE() marker macro. <- used to indicate which module to be exported to React Native
- Implement the -(UIView \*)view method <- this is mandatory

![image](https://user-images.githubusercontent.com/129856/122945091-84bbe080-d3a2-11eb-9cc8-4ec151c74edc.png)


1. ARKitTwo.storyboard -> this will be our storyboard for ARKit, contains ARSCNView
2. ARKitTwoViewController.swift -> this is the view controller of the storyboard, contains the initialization, logic and enverything related to the ARKit
3. RNTARKitTwoViewManager.m -> contains the `RCT_EXPORT_MODULE()` marker macro.
4. RNTARKitTwo.swift -> contains the ARKitTwo class that subclass(inherit) `UIVIew` and the ARKitTwoViewManager that subclass(inherit) `RCTViewManager`

### React Native Implementation

To be able to use Native View, we need to

- Create custom component that wraps our Native View and defines the propTypes

```
import React, { Requireable} from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent, StyleSheet} from 'react-native';

interface ARKitTwoViewProps  {
  title: string;
  style: Object;
  onNativeEvent?: (event: any) => void;
}

export default class ARKitTwoView extends React.PureComponent<ARKitTwoViewProps> {
  static propTypes: {
    style: Requireable<any>;
    title: Requireable<string>;
    onNativeEvent?: Requireable<(event: any) => void>;
  }; 

  _onEvent = (event:any) => {  
    if (!this.props.onNativeEvent) { 
      return;
    }
 
    this.props.onNativeEvent(event.nativeEvent); 
  };

  componentDidMount() { 
    console.log('RN Log', this.props.title);
  }

  componentWillUnmount() { 
  }

 
  render() {
    return <RNTARKitTwoView  {...this.props} title={this.props.title} onNativeEvent={this._onEvent}/>;
  }
}


ARKitTwoView.propTypes = {
  style: PropTypes.object,
  title: PropTypes.string, 
  onNativeEvent: PropTypes.any,
};

const RNTARKitTwoView = requireNativeComponent<ARKitTwoViewProps>('RNTARKitTwoView');  

```

Usage:

```
  const onEvent = (event:any) => {
    console.log('Event passed from Native', event);
    // process event here
  };

  return (
    <ARKitTwoView style={styles.container} title="ARKit Title passed from React Native" onNativeEvent={onEvent} />
  );
```

## Alternative to integrate ARKit with React Native

![image](https://user-images.githubusercontent.com/129856/122945227-a026eb80-d3a2-11eb-9181-86ec3d033545.png)


The other alternative to integrating with RN is to create a Native Module that contains function to navigate to Native screen, this function is what will call from RN.

- Pros: Both Native & RN are fully isolated (only one can be active at the same time)
- Cons: Communication can only happen in the beginning, once we are in either screen (Native / RN) we won't be able to communicate via events to the other side.

See in details: https://github.com/pacific0009/RCTIntegration/blob/master/RCTIntegration/ViewController.swift

### Further Research

1. Storyboard layout embeded onto React Native - How to dynamically resize storyboard components to resize within RN view
2. Passing files from React Native to Native and vice verca - Can we move 3D object file from RN to Native
