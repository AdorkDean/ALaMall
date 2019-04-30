//
//  NetworkBrokenView.h
//  ALaMall
//
//  Created by dongW on 15/06/26.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <UIKit/UIKit.h>

@protocol NetworkBrokenViewDelegate <NSObject>

- (void)doClickNetworkBrokenView;

@end


@interface NetworkBrokenView : UIView

@property (nonatomic, weak) id<NetworkBrokenViewDelegate> delegate;

@end
