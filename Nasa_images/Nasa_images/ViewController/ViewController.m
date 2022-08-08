//
//  ViewController.m
//  Nasa_images
//
//  Created by CHRISTIAN BEYNIS on 8/6/22.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "NasaImg.h"
#import "NasaTableViewCell.h"
#import "DetailVc.h"
#import "Nasa_images-Swift.h"


@interface ViewController ()

@property (nonatomic, weak) UITableView* table;
//@property (nonatomic, strong) PageResult* currentPage;
//@property (nonatomic, strong) NSMutableArray* NasaInfos;
@property (nonatomic, strong) NasaViewModel* NasaVM;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    // Do any additional setup after loading the view.

    
    

//  [[NetworkManager sharedInstance] fetchNasaInfo: ^(NSMutableArray * _Nullable NasaInfo) {
//      [self.NasaInfos addObjectsFromArray: NasaInfo];
//
//      dispatch_async(dispatch_get_main_queue(), ^{
//          [self.table reloadData];
//      });
//  }] ;
    
    
    
    [self.NasaVM bindWithUpdateHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.table reloadData];
        });
    }];
    [self.NasaVM fetchNasa];
    
    
}


-(void)setUp {
    
    //self.NasaInfos = [[NSMutableArray alloc] init];
    
    self.NasaVM = [[NasaViewModel alloc] initWithNetworkManager:[NetworkManager sharedInstance]];
    
    UITableView* table = [[UITableView alloc] initWithFrame:CGRectZero];
    [table setTranslatesAutoresizingMaskIntoConstraints:NO];
//    table.translatesAutoresizingMaskIntoConstraints = NO;
    [table setDataSource:self];
    [table setDelegate:self];
    //[table setPrefetchDataSource:self];
    [table registerClass:[NasaTableViewCell self] forCellReuseIdentifier:@"CellId"];
    
    self.table = table;
    [self.view addSubview:table];
    
    // Constraints
    [[table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8] setActive:YES];
    [[table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:8] setActive:YES];
    [[table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-8] setActive:YES];
    [[table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-8] setActive:YES];
    
    [table setBackgroundColor:[UIColor systemTealColor]];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.NasaInfos.count;
    return self.NasaVM.count;
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NasaTableViewCell* cell = (NasaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    if (cell == nil) {
        return [[UITableViewCell alloc] init];
    }
    
//    NasaImg* Titles = (NasaImg*)[self.NasaInfos objectAtIndex:indexPath.row];
//    [cell.titleLabel setText:Titles.title];
//
//
//
//    [[NetworkManager sharedInstance] fetchImageWithString:Titles.url completion:^(UIImage * _Nullable poster) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [cell.posterView setImage:poster];
//        });
//    }];
    
    
    
    [cell.titleLabel setText:[self.NasaVM titleFor:indexPath.row]];
    
    [self.NasaVM imageFor:indexPath.row completion:^(UIImage * _Nullable poster) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.posterView setImage:poster];
        });
    }];
    
    return cell;
}


- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailVc* vc = [[DetailVc alloc]
                    init];
    
    //initWithNibName:@"DetailVc" bundle:nil ];
    
//    NSString *alertString = [NSString stringWithFormat:@"Clicked on row #%ld", (long)[indexPath row]];
    NSLog(@"Ok");
    UITableViewController *myTableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *tableViewNavigationController = [[UINavigationController alloc] initWithRootViewController:myTableViewController];
 //   [tableViewNavigationController pushViewController:vc animated:YES];

    
    
    
    
    }



//- (void)tableView:(nonnull UITableView *)tableView prefetchRowsAtIndexPaths:(nonnull NSArray<NSIndexPath *> *)indexPaths {
//    NSIndexPath* lastIndexPath = [NSIndexPath indexPathForRow:self.NasaInfos.count - 1 inSection:0];
//    if ([indexPaths containsObject:lastIndexPath]) {
//        [self requestNextPage];
//    }
//}





@end
