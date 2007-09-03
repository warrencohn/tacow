//
//  UpdateCheckController.m
//  UpdateCheckTest
//
//  Created by Karl Moskowski on 08/01/07.
//  Copyright 2007 tacow. All rights reserved.
//

#import "UpdateCheckController.h"

@implementation UpdateCheckController

// The Roll Your Own method

- (IBAction) checkForUpdate:(id) sender {
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:@"127.0.0.1" path:@"/tacow/myAppCurrentVersion.xml"];	
	NSData *xmlData = [url resourceDataUsingCache:NO];
	NSXMLDocument *xml = [[NSXMLDocument alloc] initWithData:xmlData options:(NSXMLNodePreserveWhitespace|NSXMLNodePreserveCDATA) error:nil];
	if (!xml)
		NSRunAlertPanel(@"Error", @"Is Apache running and is the tacow/ directory in the docroot?", @"OK", nil, nil);
	else {
		int availableVersion = [[[[xml nodesForXPath:@"./data/availableVersion" error:nil] objectAtIndex:0] stringValue] intValue];
		int currentVersion = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] intValue];
		if ((availableVersion > currentVersion) &&		
			(NSAlertDefaultReturn == NSRunInformationalAlertPanel(@"Update Available",
																  [NSString stringWithFormat:@"Version %d is available (you have %d). "
																	  "Do you want to visit the download web page?",
																	  availableVersion, currentVersion], @"Yes", @"No", nil))) {
			NSString *downloadURL = [[[xml nodesForXPath:@"./data/downloadURL" error:nil]  objectAtIndex:0] stringValue];
			[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:downloadURL]];
		}
	}
	[xml release], xml == nil;
	[url release], url == nil;
}

- (IBAction) showPrefs:(id) sender {
	[prefs makeKeyAndOrderFront:sender];
}

@end