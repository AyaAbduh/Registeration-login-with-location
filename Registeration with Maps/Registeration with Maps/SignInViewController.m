//
//  SignInViewController.m
//  Registeration with Maps
//
//  Created by Esraa Hassan on 4/26/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

#import "SignInViewController.h"
#import "ViewController.h"
#import "ProfileViewController.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phone;
- (IBAction)signIn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *alert;

- (IBAction)signUP:(UIButton *)sender;

@end

@implementation SignInViewController

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

- (IBAction)signIn:(UIButton *)sender {
    if( [[_phone text]isEqualToString:[_userData objectForKey:@"phone"]]){
        _alert.text=@"signIN Successfully";
        
        ProfileViewController *profileController=[self.storyboard instantiateViewControllerWithIdentifier:@"profile"];
        [profileController setUserData:_userData];
        [profileController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        
        [self presentViewController:profileController animated:YES completion:nil
         ];
        
    }else{
        _alert.text=@"signIN Failed";
    }
    
}
- (IBAction)signUP:(UIButton *)sender {
    ViewController *signUPController=[self.storyboard instantiateViewControllerWithIdentifier:@"signUP"];
    
    [signUPController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:signUPController animated:YES completion:nil
     ];
    
}
@end
