//
//  loginpage.m
//  Task
//
//  Created by vaishnav on 09/01/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import "loginpage.h"
#import "AppDelegate.h"
#import "registerpage.h"
#import "Preview.h"

#define CHARACTERS @" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define CHARACTERS_NUMBERS  [CHARACTERS stringByAppendingString:@"1234567890"]

@interface loginpage ()

@end

@implementation loginpage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)login:(id)sender {
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=[appdelegate managedObjectContext];
    //NSManagedObject *objects;
    
    NSEntityDescription *entitydesc=[NSEntityDescription entityForName:@"Userdetails" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSPredicate *pred=[NSPredicate predicateWithFormat:@"(username==%@ AND password==%@)",self.userfield.text,self.passwordfield.text];
    [request setEntity:entitydesc];
    [request setPredicate:pred];
    
    NSError *error = nil;
    
    NSArray *array = [context executeFetchRequest:request error:&error];
    if ([array count]==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Error with login credentials please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        AppDelegate *delobj=[[UIApplication sharedApplication]delegate];
        delobj.userpicked=_userfield.text;
        UIStoryboard *loginboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Preview *wpage=[loginboard instantiateViewControllerWithIdentifier:@"Preview"];
        [self.navigationController pushViewController:wpage animated:YES];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;


}
@end
