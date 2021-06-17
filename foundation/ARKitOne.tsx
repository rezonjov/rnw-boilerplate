import React from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent, StyleSheet} from 'react-native';

interface props  {
  style:any;
}

export default class ARKitOneView extends React.PureComponent<props> {
  render() {
    return <RNTARKitOneView  {...this.props} />;
  }
}

const RNTARKitOneView = requireNativeComponent('RNTARKitOneView');  
