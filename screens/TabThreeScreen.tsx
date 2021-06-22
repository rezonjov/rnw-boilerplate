import * as React from 'react';
import { StyleSheet } from 'react-native';
import ARKitTwoView from '../foundation/ARKitTwo';
import ARKitOneView from '../foundation/ARKitOne'; '../foundation/ARKitOne';
import EditScreenInfo from '../components/EditScreenInfo';
import { Text, View } from '../components/Themed';

export default function TabThreeScreen() {
  
  const onEvent = (event:any) => {
    console.log('Event passed from Native', event); 
    // process event here
  };

  return ( 
    <ARKitTwoView style={styles.container} title="ARKit Title passed from React Native" onNativeEvent={onEvent} /> 
  ); 
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
  },
  separator: {
    marginVertical: 30,
    height: 1,
    width: '80%',
  },
});
