//
//  registerpage.m
//  Task
//
//  Created by vaishnav on 09/01/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import "registerpage.h"
#import "loginpage.h"
#import "AppDelegate.h"

@interface registerpage ()

@end

@implementation registerpage

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

- (IBAction)savebtn:(id)sender {
    AppDelegate *appdelobj=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=[appdelobj managedObjectContext];
    NSManagedObject *object;
    object=[NSEntityDescription insertNewObjectForEntityForName:@"Userdetails" inManagedObjectContext:context];
    [object setValue: _user.text forKey:@"username"];
    [object setValue:_password.text forKey:@"password"];
    [object setValue:_confirmpassword.text forKey:@"confirmpassword"];
    NSError *error;
    
    BOOL s=[_password.text isEqualToString:_confirmpassword.text];
    if (s==0) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Both passwords should be same" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [context save:&error];
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Successfully Created" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert1 show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        
        UIStoryboard *board1=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        loginpage *load=[board1 instantiateViewControllerWithIdentifier:@"home"];
        [self.navigationController pushViewController:load animated:YES];
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



@end
