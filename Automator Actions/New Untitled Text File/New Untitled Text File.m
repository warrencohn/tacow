//
//  New Untitled Text File.m
//  New Untitled Text File
//
//  Created by Karl Moskowski on 09/04/07.
//  Copyright 2007 tacow. All rights reserved.
//

#import "New Untitled Text File.h"

@implementation New_Untitled_Text_File

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo {
	
	// First, set the contents of the file depending on the option chosen in Automator.	
	// The key initialContentsOption is in the Parameters NSObjectController instantiated in
	// the Nib and then bound (via Cocoa bindings) to the NSPopUpButton's selected index.
	// It's also an integer parameter in the Target's properties (Parameters collection)
	
	NSString *initialContents = @"";
	if ([[[self parameters] objectForKey:@"initialContentsOption"] intValue] == 1)
		initialContents = LOREM_IPSUM;
	
	// Use the action's input as the location to create the new file.
	//If it's not set, use ~/Desktop/.
	NSString *path = nil;
	if ([input isKindOfClass:[NSArray class]])
		path = [input objectAtIndex:0];
	else
		path = input;
	if (!path || [path isEqualToString:@""])
		path = [@"~/Desktop" stringByExpandingTildeInPath];
	
	// Set the file name to Untitled.txt. If it already exists at the path, 
	//append an index number.
	NSString *newFile = [path stringByAppendingPathComponent:@"Untitled.txt"];
	int index = 1;
	for (index; [[NSFileManager defaultManager] fileExistsAtPath:newFile]; index++)
		newFile = [path stringByAppendingPathComponent:
			[NSString stringWithFormat:@"Untitled %d.txt", index]];
	
	// Create the file.
	[initialContents writeToFile:newFile atomically:NO encoding:NSUTF8StringEncoding error:nil];
	
	// Pass the newly created file on to the next action.
	return newFile;
}

@end