//
//  ViewController.m
//  mailcoretest
//
//  Created by Steven Yu on 14-12-21.
//  Copyright (c) 2014年 Steven Yu. All rights reserved.
//

#import "ViewController.h"
#import <MailCore/mailcore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    MCOIMAPSession *session = [[MCOIMAPSession alloc] init];
    session.hostname = @"imap.gmail.com";
    session.port = 993;
    session.username = @"XXX@gmail.com";
    session.password = @"password";
    session.connectionType = MCOConnectionTypeTLS;
    
    MCOIndexSet *uidSet = [MCOIndexSet indexSetWithRange:MCORangeMake(1,UINT64_MAX)];
    MCOIMAPFetchMessagesOperation *fetchOp =
    [session fetchMessagesByUIDOperationWithFolder:@"INBOX"
                                       requestKind:MCOIMAPMessagesRequestKindHeaders
                                              uids:uidSet];
    
    [fetchOp start:^(NSError *err, NSArray *msgs, MCOIndexSet *vanished) {
        NSLog(@"%@",msgs);
        NSLog(@"Fetched all the message headers!.");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
