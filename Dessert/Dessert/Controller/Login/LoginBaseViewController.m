//
//  LoginBaseViewController.m
//  Dessert
//
//  Created by keith on 6/1/15.
//  Copyright (c) 2015 keith. All rights reserved.
//
#define kCircleDia 130
#define kNameLableWH 80
#define kCircleCenterY -100

#import "LoginBaseViewController.h"

@interface LoginBaseViewController ()
{
     BOOL isKeyBoardVisible;
}
@property (nonatomic,strong) UIImageView *circleImageView;
@property (nonatomic,strong) UILabel *nameLable;
@property (nonatomic,strong) UILabel *loadingLable;

@property (nonatomic,strong) NSLayoutConstraint *circleY;
@property (nonatomic,strong) NSLayoutConstraint *nameY;
@end

@implementation LoginBaseViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self= [super initWithCoder:aDecoder]) {
        self.circleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"circle"]];
        self.nameLable = [[UILabel alloc]init];
        self.nameLable.text = [self nameLableText];
        _isLoading = NO;
        
        _loadingLable = [[UILabel alloc]init];
        _loadingLable.textColor = [UIColor whiteColor];
        _loadingLable.text = @"loading....";
        _loadingLable.textAlignment = NSTextAlignmentCenter;
        _loadingLable.frame = CGRectMake(kScreen_Width/2-40, kScreen_Height/2+kCircleDia/2+10, 80, 20);

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillDissapear:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
    }
    return self;
}

- (NSString *)nameLableText{
    return @"D";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithHex:@"#373447" alpha:1.0]];
    [self layoutCircleImageView];
    [self layoutNameLable];
    [self setNamelableAttibute];
    [self.view addSubview:_loadingLable];
    _loadingLable.alpha = 0;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyBoardByTap:)];
    [self.view addGestureRecognizer:gesture];
   // self.isLoading = YES;
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   // self.isLoading = YES;
   // [self performSelector:@selector(test) withObject:nil afterDelay:5];
}

- (void)test{
    self.isLoading = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - roate

-(void)setIsLoading:(BOOL)isLoading{
    _isLoading = isLoading;

    if (_isLoading) {
        _circleY.constant = 0;

        [self.view setNeedsUpdateConstraints];
        [UIView animateWithDuration:1 animations:^{
            [self.view layoutIfNeeded];
            _loadingLable.alpha = 1.0;
        } completion:^(BOOL finished) {
            if (self.successLoginBlock) {
                self.successLoginBlock();
            }
        }];
        

        
        if (isLoading) {
            [self roate];
        }
    }else{
        _circleY.constant = -kScreen_Height/4;
        
        [self.view setNeedsUpdateConstraints];
        [UIView animateWithDuration:1 animations:^{
            [self.view layoutIfNeeded];
            _loadingLable.alpha = 0.0;
            _nameLable.transform = CGAffineTransformMakeRotation(0);
            _circleImageView.transform = CGAffineTransformMakeRotation(0);
        } completion:^(BOOL finished) {
            if (self.failedLoginBlock) {
                self.failedLoginBlock();
            }
        }];

    }
    
    
}

- (void)roate{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.circleImageView.transform = CGAffineTransformRotate(self.circleImageView.transform, 1);
        self.nameLable.transform = CGAffineTransformRotate(self.nameLable.transform, 1);
        
    } completion:^(BOOL finishied){
        if (_isLoading) {
             [self roate];
        }
       
    }];

}

#pragma mark - circle Lable
- (void)setNamelableAttibute{
    self.nameLable.textColor = [UIColor whiteColor];
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    self.nameLable.font = [UIFont fontWithName:@"Savoye LET" size:50];
}

- (void)layoutNameLable{
    self.nameLable.frame = CGRectMake(kScreen_Width, kScreen_Height/5+kCircleDia/4, kNameLableWH, kNameLableWH);
    [self.view addSubview:self.nameLable];
    
    self.nameLable.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.nameLable attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.circleImageView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    _nameY = [NSLayoutConstraint constraintWithItem:self.nameLable attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.circleImageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.nameLable attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:kNameLableWH];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.nameLable attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:kNameLableWH];
    [self.view addConstraints:[NSArray arrayWithObjects:centerX,_nameY,width,height, nil]];
}

#pragma mark - circle imageview
- (UIImageView *)circleImageview{
    return self.circleImageView;
}

- (void)layoutCircleImageView{
    //self.circleImageView.frame = CGRectMake(kScreen_Width/2, kCircleDia/2+kScreen_Height/5, kCircleDia, kCircleDia);
    [self.view addSubview:self.circleImageView];
    self.circleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.circleImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    _circleY = [NSLayoutConstraint constraintWithItem:self.circleImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:kCircleCenterY];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.circleImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:kCircleDia];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.circleImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:kCircleDia];
    [self.view addConstraints:[NSArray arrayWithObjects:centerX,_circleY,width,height, nil]];
    
}

#pragma mark - statusbar ControlStyle
- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationSlide;
}

#pragma mark - keyboard notification
- (void)keyBoardWillShow:(NSNotification *)notification{
    if (isKeyBoardVisible) {
        return;
    }
    isKeyBoardVisible = YES;
    NSDictionary *info = [notification userInfo];
    
    CGSize size = [self getKeyboardSizeFromDict:info];
    CGRect frame = self.view.frame;
    frame.origin.y = -1*size.height;
    self.view.frame = frame;
    
}

- (void)keyBoardWillDissapear:(NSNotification *)notification{
    if (!isKeyBoardVisible) {
        return;
    }
    isKeyBoardVisible = NO;
    
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    self.view.frame = frame;
    
}
- (void)keyBoardFrameChange:(NSNotification *)notification{
    NSDictionary *info = [notification userInfo];
    
    CGSize size = [self getKeyboardSizeFromDict:info];
    CGRect frame = self.view.frame;
    frame.origin.y = -1*size.height;
    NSTimeInterval boardAnimationDuration=[[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:boardAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.view.frame = frame;
    } completion:nil];
    
}
- (CGSize)getKeyboardSizeFromDict:(NSDictionary *)dict{
    NSValue *aValue = [dict objectForKey:UIKeyboardFrameEndUserInfoKey];
    return [aValue CGRectValue].size;
}

#pragma mark - dealloc

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
