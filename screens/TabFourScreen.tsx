import * as React from 'react';
import { StyleSheet } from 'react-native'; 
import EditScreenInfo from '../components/EditScreenInfo';
import { Text, View } from '../components/Themed';
import ARCoreView from '../foundation/ARCore';
import VideoView from '../foundation/VideoView';  

export default function TabFourScreen() {
  const onEvent = (event:any) => {
    console.log('Event passed from Native', event); 
    // process event here
  };

  return ( 
    // <VideoView style={{ flex: 1, width: '100%', height: '100%' }} url="https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4"  />
    <ARCoreView style={{ flex: 1, width: '100%', height: '100%' }} onTouchEvent={onEvent} onChange={onEvent}/>
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
