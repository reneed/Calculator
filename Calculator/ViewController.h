//
//  ViewController.h
//  Calculator
//
//  Created by Ruining Sun on 7/24/13.
//  Copyright (c) 2013 Ruining Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define clearBtn 1
#define plusBtn 2
#define subBtn 3
#define mulBtn 4
#define divBtn 5
#define equalBtn 6
#define dotBtn 7
#define signBtn 8

@interface ViewController : UIViewController{
    IBOutlet UITextField *display;
    double operand;
    NSString *operator;
    BOOL bBegin;
}
-(IBAction)btnClicked:(id)sender;
@property(nonatomic, strong)IBOutlet UITextField *display;
@end
