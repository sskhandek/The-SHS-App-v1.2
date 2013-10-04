

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface TeacherTableViewController : UITableViewController{
    NSMutableArray *theteachers;
    sqlite3 * db;
    
}
@property(nonatomic,retain) NSMutableArray *theteachers;

-(NSMutableArray *) teacherList;
@end