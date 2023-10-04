//
//  ViewController.m
//  QoreIDObjectiveCTestApp
//
//  Created by Guru King on 04/10/2023.
//

//The view controller is embedded in a navigation view via the Main.storyboard
#import "ViewController.h"
#import "QoreIDObjectiveCTestApp-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    // Set the button's title and frame
    [myButton setTitle:@"Tap Me" forState:UIControlStateNormal];
    myButton.frame = CGRectMake(100, 100, 200, 50); // Adjust the frame as needed
    
    // Set the button's background color (optional)
    myButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
    
    // Add the button to the view
    [self.view addSubview:myButton];
    
    // Add an action to the button
    [myButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

    - (void)buttonTapped:(UIButton *)sender {
        TestQoreIDViewController *swiftViewController = [[TestQoreIDViewController alloc] init];
         [self.navigationController pushViewController:swiftViewController animated:YES];
    }


@end
