//
//  DetailViewController.m
//  MiniProjectObjC
//
//  Created by west on 18/10/24.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userId;
@property (weak, nonatomic) IBOutlet UILabel *idNumber;
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *body;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
            
    NSString *userIdNumber = [self.selectedData.userId stringValue];
    NSString *idNumber = [self.selectedData.numberId stringValue];
    
    if (self.selectedData != nil) {
        self.userId.text = userIdNumber;
        self.idNumber.text = idNumber;
        self.titleName.text = self.selectedData.title;
        self.body.text = self.selectedData.body;
    }
}

@end
