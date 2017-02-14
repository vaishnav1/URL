//
//  Webview.m
//  Task
//
//  Created by vaishnav on 14/02/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import "Webview.h"

@interface Webview ()

@end

@implementation Webview

- (void)viewDidLoad {
    [super viewDidLoad];
 // Do any additional setup after loading the view.
[_Web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.canvasflip.com/protected/app/playback.php?project=14097#136523"]]];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

 - (BOOL)prefersStatusBarHidden {
     return YES;
 }
@end
