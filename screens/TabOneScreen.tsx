import * as React from 'react';
import { StyleSheet, Button } from 'react-native';

import EditScreenInfo from '../components/EditScreenInfo';
import { Text, View } from '../components/Themed';
import CalendarModule from '../foundation/CalendarModule';

export default function TabOneScreen() { 
  
  const onPress = () => {
    console.log('We will invoke the native module here!');
    if(CalendarModule) {
      console.log("Native Module found!!! ")
      CalendarModule.createCalendarEvent('testName', 'testLocation');
    }
  };

  return (
    <View style={styles.container}> 
      <Text style={styles.title}>Native Module test</Text>
      <Button
        title="Click to invoke your native module!"
        color="#841584"
        onPress={onPress}
      />
      <View style={styles.separator} lightColor="#eee" darkColor="rgba(255,255,255,0.1)" />
      <Text 
          lightColor="rgba(0,0,0,0.8)"
          darkColor="rgba(255,255,255,0.8)">
          Clicking the above text will trigger a native module call (it will do a console.log). Clicking this inside expo won't output anything since we can't run native module inside expo
        </Text>

    </View>
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
