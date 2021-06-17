import React from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent, StyleSheet} from 'react-native';

interface props  {
  style:any;
}

export default class ARKitTwoView extends React.PureComponent<props> {
  render() {
    return <RNTARKitTwoView  {...this.props} />;
  }
}

const RNTARKitTwoView = requireNativeComponent('RNTARKitTwoView');  
