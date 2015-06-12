//
//  DSTestVC.m
//  Dessert
//
//  Created by keith on 15/3/22.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSTestVC.h"
#import <MMMarkdown/MMMarkdown.h>
#import <hpple/TFHpple.h>
#import "HtmlMedia.h"
#import "DSContent.h"
#import "DSNetAPIManager.h"
#import  <FontAwesome+iOS/NSString+FontAwesome.h>
#import "DSPosterDAO.h"
#import <AVOSCloud/AVOSCloud.h>
#import "DSAVUser.h"
@interface DSTestVC()
@property (weak, nonatomic) IBOutlet UILabel *LableTS;
@property (weak, nonatomic) IBOutlet UILabel *LableForAVO;
@property (nonatomic,copy) NSAttributedString *Attrstring;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (nonatomic,strong) AVObject *avObject;
@property (nonatomic,strong) NSArray *conment;

@property (nonatomic,strong) AVUser *user;
@end
@implementation DSTestVC
-(void)viewDidLoad{
    [super viewDidLoad];
    NSError *error;
  //  NSString *blogs=[MMMarkdown HTMLStringWithMarkdown:@"![mvdashboard.jpg][1]\n\n  [1]: http://doc.keithmorning.com/usr/uploads/2015/03/4047483196.jpg\n\n## this is H2 \n **bold name**" error:&error];
    NSString *blog=[MMMarkdown HTMLStringWithMarkdown:@"![mvdashboard.jpg][1]\n\n   [1]: http://doc.keithmorning.com/usr/uploads/2015/03/4047483196.jpg\n## this is H2 \n **bold name** [good][2]\n\n  [2]:http://www.baidu.com" extensions:MMMarkdownExtensionsGitHubFlavored error:&error];
    //NSData *data=[blogs dataUsingEncoding:NSUTF8StringEncoding];
    HtmlMedia *media=[[HtmlMedia alloc]initWithString:blog showType:MediaShowTypeNone];
    
    self.Attrstring = [[NSAttributedString alloc]initWithString:[NSString fontAwesomeIconStringForEnum:FASlideShare] attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Noteworthy-Bold" size:15],NSUnderlineStyleAttributeName:@(NSUnderlineStyleThick),NSBackgroundColorAttributeName:[UIColor blackColor]}];
    //self.LableTS.attributedText = self.Attrstring;
    self.LableTS.text= [NSString fontAwesomeIconStringForEnum:FASlideShare];
    
    self.avObject = [[AVObject alloc]initWithClassName:@"Acticle"];
    self.user = [AVUser user];
    
}
- (IBAction)logNetApi:(id)sender {
//    [[DSNetAPIManager shareManager]getContetnsFromApi:@2 andBlock:^(id data, NSError *error) {
//        DSContent *c=data[2];
//        DebugLog(@"title:%@,content:%@ name:%@",c.title,c.text,c.user.name);
//    }];

}
- (IBAction)exit:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)testformodel:(id)sender {
    [[DSPosterDAO shareManager] read];
}
- (IBAction)saveAvo:(id)sender {
    
    [self.avObject setObject:@"this is a good night" forKey:@"Content"];
    [self.avObject setObject:[DSAVUser currentUser] forKey:@"BlogOwner"];
    AVObject *comment0 = [[AVObject alloc]initWithClassName:@"conment"];
    [comment0 setObject:@"keith1" forKey:@"user"];
    AVObject *comment1 = [[AVObject alloc]initWithClassName:@"conment"];
    [comment1 setObject:@"keith2" forKey:@"user"];
    //NSArray *comments = [[NSArray alloc]initWithObjects:comment0,comment1, nil];
    //[self.avObject addObjectsFromArray:comments forKey:@"comment"];
    [comment0 setObject:self.avObject forKey:@"parent"];
    [comment1 setObject:self.avObject forKey:@"parent"];
    [comment0 saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [comment1 saveEventually];
        
    }];
    
    NSNumber *number = [NSNumber numberWithInt:42];
    NSString *string = [NSString stringWithFormat:@"the number is %@", number];
    NSDate *date = [NSDate date];
    NSData *data = [@"foo" dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *array = [NSArray arrayWithObjects:string, number, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:number, @"number",
                                string, @"string",
                                nil];
    
    AVObject *bigObject = [AVObject objectWithClassName:@"BigObject"];
    [bigObject setObject:number     forKey:@"myNumber"];
    [bigObject setObject:string     forKey:@"myString"];
    [bigObject setObject:date       forKey:@"myDate"];
    [bigObject setObject:data       forKey:@"myData"];
    [bigObject setObject:array      forKey:@"myArray"];
    [bigObject setObject:dictionary forKey:@"myDictionary"];
    [bigObject saveInBackground];
    
    /*
    [self.avObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"success" message:@"save success" preferredStyle:UIAlertControllerStyleAlert];
                [alter addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil]];
                [self presentViewController:alter animated:YES completion:nil];
            });

        }
    }];*/
    
    
    
}
- (IBAction)DeleteAVO:(id)sender {
    [self.avObject deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        NSLog(@"delete success");
    }];
}
- (IBAction)UpdateAVO:(id)sender {
}
- (IBAction)QueryAVO:(id)sender {
}
- (IBAction)loginTest:(id)sender {
    [AVUser logInWithMobilePhoneNumberInBackground:self.nameText.text password:self.passwordText.text block:^(AVUser *user, NSError *error) {
        NSLog(@"login in success!");
        if (error) {
            NSLog(@"%@ %@",error.localizedFailureReason,error.localizedDescription);
        }
    }];
}
- (IBAction)register:(id)sender {
    [AVUser verifyMobilePhone:self.code.text withBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"register success");
        }
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}
- (IBAction)GetCode:(id)sender {
    AVUser *user = self.user;
    user.username = self.nameText.text;
    user.password = self.passwordText.text;
    user.mobilePhoneNumber = self.nameText.text;
    NSError *error;
    [user signUp:&error];
}
@end
