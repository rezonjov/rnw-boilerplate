import React, { Requireable} from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent, StyleSheet} from 'react-native';

interface VideoViewProps  {
  style: object;
  url: string; 
}

export default class VideoView extends React.PureComponent<VideoViewProps> {
  static propTypes: {
    style: Requireable<any>;
    url: Requireable<string>; 
  }; 

  _onEvent = (event:any) => {  
    // if (!this.props.onNativeEvent) { 
    //   return;
    // }
 
    // this.props.onNativeEvent(event.nativeEvent); 
  };

  componentDidMount() { 
    console.log('RN Log', this.props.url);
  }

  componentWillUnmount() { 
  }

 
  render() {
    return <NativeVideView  {...this.props} url={this.props.url}  />;
  }
}


VideoView.propTypes = {
    style: PropTypes.object,
    url: PropTypes.string
}; 

const NativeVideView = requireNativeComponent<VideoViewProps>('VideoView');  
