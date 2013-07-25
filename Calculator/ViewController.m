//
//  ViewController.m
//  Calculator
//
//  Created by Ruining Sun on 7/24/13.
//  Copyright (c) 2013 Ruining Sun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end
@implementation ViewController
@synthesize display;

- (void)viewDidLoad
{
    [super viewDidLoad];
    display.text=@"0";
    operator= @"=";
    //bBegin= YES;
    //UIButton *btn =(UIButton *)sender;
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(id)sender{
    UIButton *btn=(UIButton *)sender;
    int tag=btn.tag;
    NSString *currentStr = display.text;
    switch (tag) {
        case clearBtn:
            display.text=@"0";
            bBegin=YES;
            operand=0;
            operator=@"=";
            break;
        case dotBtn:
        {
                
BOOL notDot = ([display.text rangeOfString:@"."].location == NSNotFound);
if(notDot)
{
    currentStr= [currentStr stringByAppendingString:@"."];
    display.text= currentStr;
}
                }
        break;
        case signBtn:
            {
                if([display.text isEqualToString:@"0"] )
                {
                    return;
                }

                double number = [display.text doubleValue];
                number= number*(-1);
                display.text= [NSString stringWithFormat:@"%g",number];
                if(bBegin)
                operand= number;
                }
            break;
case plusBtn:
case subBtn:
case mulBtn:
case divBtn:
case equalBtn:
[self inputOperator:btn.titleLabel.text];
break;
default:
[self inputNumber:btn.titleLabel.text];
break;
    }
}


- (void)inputOperator: (NSString *)opt

{
    double currentNumber = [display.text doubleValue];
    if(bBegin)
        operator= opt;
    else
    {
        if([operator isEqualToString:@"="])
        {
            operand= currentNumber;
            
        }else if([operator isEqualToString:@"+"])
        {
            operand+= currentNumber;
        }else if([operator isEqualToString:@"-"])
        
        {
            operand-= currentNumber;
            
        }else if([operator isEqualToString:@"*"])
        
        {
            operand*= currentNumber;
            
        }else if([operator isEqualToString:@"/"])
        
        {
            if(currentNumber!= 0)
            {
                operand/=  currentNumber;
            }
            
            else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                                message:@"Divisor cannot be zero!"
                                                                delegate:nil
                                                                cancelButtonTitle:@"Close"
                                                                otherButtonTitles:nil];
                [alert show];
                operator= @"=";
                }
        }
        bBegin= YES;
        display.text= [NSString stringWithFormat:@"%g",operand];
        operator= opt;
        
    }    
    
}
- (void)inputNumber: (NSString *)str{
    if([display.text isEqualToString:@"0"] && [str isEqualToString:@"0"])
    {
        return;
    }
    if(bBegin)
    {
        display.text= str;
    }
    else if([display.text isEqualToString:@"0"]){
        display.text= [display.text stringByAppendingString:str];
        double currentNumber = [display.text doubleValue];
        currentNumber=currentNumber*1;
        display.text= [NSString stringWithFormat:@"%g",currentNumber];
    }
    else
    {
        display.text= [display.text stringByAppendingString:str];
    }
    bBegin= NO;
    
}




@end
