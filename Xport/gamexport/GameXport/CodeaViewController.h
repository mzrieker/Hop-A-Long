//
//  CodeaViewController.h
//  GameXport
//
//  Created by Marcus Rieker on Sunday, March 2, 2014
//  Copyright (c) Marcus Rieker. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CodeaAddon;

typedef enum CodeaViewMode
{
    CodeaViewModeStandard,
    CodeaViewModeFullscreen,
    CodeaViewModeFullscreenNoButtons,
} CodeaViewMode;

@interface CodeaViewController : UIViewController

@property (nonatomic, assign) CodeaViewMode viewMode;
@property (nonatomic, assign) BOOL paused;

- (void) setViewMode:(CodeaViewMode)viewMode animated:(BOOL)animated;

- (void) loadProjectAtPath:(NSString*)path;

- (void) registerAddon:(id<CodeaAddon>)addon;

@end
