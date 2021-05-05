//
//  ViewController.m
//  PIP-Demo
//
//  Created by 梁明哲 on 2021/5/4.
//


#import "ViewController.h"
#import "VideoViewController.h"

#define kDefaultCell    @"defaultCell"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSArray *itemArray;
}
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    itemArray = @[@"Apple视频（非直播）",@"央视一套直播"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDefaultCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDefaultCell];
    }
    cell.textLabel.text = itemArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSURL *url;
    if (indexPath.row == 0) {
        url = [NSURL URLWithString:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1920x1080h.mp4"];
    }else {
        url = [NSURL URLWithString:@"http://cctvalih5ca.v.myalicdn.com/live/cctv1_2/index.m3u8"];
    }
    VideoViewController *vc = [[VideoViewController alloc] init];
    vc.url = url;
    vc.title = itemArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
