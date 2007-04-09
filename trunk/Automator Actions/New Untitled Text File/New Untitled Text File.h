//
//  New Untitled Text File.h
//  New Untitled Text File
//
//  Created by Karl Moskowski on 09/04/07.
//  Copyright 2007 tacow. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>

#define LOREM_IPSUM @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse turpis quam, suscipit et, varius ac, fermentum sed, neque. In hac habitasse platea dictumst. Aliquam pulvinar est id justo. Duis libero justo, viverra ac, tristique vitae, aliquam eget, neque. Aenean aliquam sodales quam. Nullam consequat lectus sed arcu. Suspendisse condimentum. Suspendisse commodo. In hac habitasse platea dictumst. Vivamus ipsum. Ut laoreet quam non ante. Mauris ac elit. Vivamus non justo. Curabitur dignissim, ante nec ullamcorper convallis, eros libero faucibus risus, nec malesuada augue massa vel urna. Pellentesque nec purus in lacus consectetuer auctor. Praesent euismod posuere lorem. Quisque pharetra pretium lectus. Duis venenatis consequat lectus."

@interface New_Untitled_Text_File : AMBundleAction  {
}

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end