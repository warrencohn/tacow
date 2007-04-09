//
//  Open Terminal Here.h
//  Open Terminal Here
//
//  Created by Kol. Panic on 01/01/07.
//  Copyright © 2007 Voodoo Ergonomics, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>

@interface Open_Terminal_Here : AMBundleAction  {
}

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end