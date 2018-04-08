//
//  ViewController.m
//  TableView
//
//  Created by Tebin on 4/8/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()

@property (strong, atomic) NSMutableArray<Course *> *courses;

@end

@implementation ViewController

NSString *cellID = @"cellID";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
    
    self.navigationItem.title = @"Courses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;

    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellID];
}
- (void)setup {
    self.courses = NSMutableArray.new;
    
    Course *c1 = Course.new;
    c1.name = @"My course";

    Course *c2 = Course.new;
    c2.name = @"My course 2";

    [self.courses addObject:c1];
    [self.courses addObject:c2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    cell.backgroundColor = UIColor.blueColor;
    
    Course *course = self.courses[indexPath.row];
    
    cell.textLabel.text = course.name;
    return cell;
}

@end
