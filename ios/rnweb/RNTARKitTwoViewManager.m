//
//  RNTARKitTwo.m
//  rnweb
//
//  Created by Rezon Jovian on 6/17/21.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
 

@interface RCT_EXTERN_MODULE(RNTARKitTwoViewManager, RCTViewManager) 
RCT_EXPORT_VIEW_PROPERTY(title, NSString)
RCT_EXPORT_VIEW_PROPERTY(onNativeEvent, RCTBubblingEventBlock)

@end

