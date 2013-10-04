
#import "TeacherDetailViewController.h"
#import "Teacher.h"
#import "OpenWebViewController.h"

@implementation TeacherDetailViewController
@synthesize teacherDetailModel;
@synthesize nameLabel;
@synthesize emailLabel;
@synthesize extensionLabel;
@synthesize websiteLabel;
@synthesize subjectLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
    Teacher *broski = [self.teacherDetailModel objectAtIndex:0];
    self.nameLabel.text = broski.name;
    [subjectLabel setTitle:broski.subject forState:UIControlStateNormal] ;
    [emailLabel setTitle:broski.email forState:UIControlStateNormal] ;
    [extensionLabel setTitle:broski.extension forState:UIControlStateNormal] ;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"teacherButton"]){
        OpenWebViewController *cvc = (OpenWebViewController *)[segue destinationViewController];
        
        Teacher *buster = [self.teacherDetailModel objectAtIndex:0];
        cvc.myLink = buster.website;
    }
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
