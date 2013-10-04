

#import "TeacherTableViewController.h"
#import "Teacher.h"
#import <sqlite3.h>
#import "TeacherDetailViewController.h"

@implementation TeacherTableViewController
@synthesize theteachers;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self teacherList];
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.theteachers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TeacherCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    int rowCount = indexPath.row;
    
    Teacher *teacher = [self.theteachers objectAtIndex:rowCount];
    cell.textLabel.text = teacher.name;
    
    
    return cell;
}


-(NSMutableArray *) teacherList{
    theteachers = [[NSMutableArray alloc] initWithCapacity:10];
    @try {
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"authorsDb.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success)
        {
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
        {
            NSLog(@"An error has occured: %@", sqlite3_errmsg(db));
            
        }
        
        
        const char *sql = "SELECT * FROM  books";
        sqlite3_stmt *sqlStatement;
        if(sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement:  %@", sqlite3_errmsg(db));
        }else{
            
            while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
                Teacher * teacher = [[Teacher alloc] init];
                teacher.name = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
                teacher.subject = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,2)];
                teacher.extension = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
                teacher.website = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)];
                teacher.email = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 5)];
                [theteachers addObject:teacher];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Problem with prepare statement:  %@", sqlite3_errmsg(db));
    }
    @finally {
        
        sqlite3_close(db);
        
        return theteachers;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowTeacherDetails"])
    {
        TeacherDetailViewController *detailViewController = 
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView 
                                    indexPathForSelectedRow];
        
        detailViewController.teacherDetailModel = [[NSArray alloc]
                                                   initWithObjects: [self.theteachers 
                                                                     objectAtIndex:[myIndexPath row]],nil];
    }
}

@end