import React, { Requireable} from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent, StyleSheet} from 'react-native';

interface ARCoreViewProps  {
    style?: object; 
    onChange?: (event: any) => void;
    onTouchEvent?: (event: any) => void; 
}

export default class ARCoreView extends React.PureComponent<ARCoreViewProps> {
  static propTypes: {
    style: Requireable<any>; 
    onChange?: Requireable<(event: any) => void>;
    onTouchEvent?: Requireable<(event: any) => void>;
  }; 

  _onEvent = (event:any) => {  
    console.log("Event triggered", event.nativeEvent);
 
    if (!this.props.onTouchEvent) { 
      return;
    }
    this.props.onTouchEvent(event.nativeEvent); 

  
  };

  componentDidMount() { 
    console.log('RN Log ARCore');
  }

  componentWillUnmount() { 
  }

 
  render() {
    return <RNReactNativeArcoreModule  {...this.props} onTouchEvent={this._onEvent} onChange={this._onEvent}/>;
  }
}


ARCoreView.propTypes = {
  style: PropTypes.object,  
  onTouchEvent: PropTypes.any,
};

const RNReactNativeArcoreModule = requireNativeComponent<ARCoreViewProps>('RNReactNativeArcoreModule');  
