
#import <UIKit/UIKit.h>

@interface TeacherDetailViewController : UIViewController

@property (strong, nonatomic) NSArray *teacherDetailModel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIButton *emailLabel;
@property (strong, nonatomic) IBOutlet UIButton *extensionLabel;
@property (strong, nonatomic) IBOutlet UIButton *websiteLabel;
@property (strong, nonatomic) IBOutlet UIButton *subjectLabel;

@end