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
