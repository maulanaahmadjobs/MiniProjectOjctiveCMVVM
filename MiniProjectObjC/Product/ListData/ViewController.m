//
//  ViewController.m
//  MiniProjectObjC
//
//  Created by west on 18/10/24.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "DataListViewModel.h"

@interface ViewController ()
@property (nonatomic, strong) DataListViewModel* dataListViewModel;
@end

@implementation ViewController {
    NSString* currentSearchText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataListViewModel = [[DataListViewModel alloc] init];
    self.tableViewData.delegate = self;
    self.tableViewData.dataSource = self;
    self.searchBar.delegate = self;
    
    [self fetchData];
    
}

- (void) fetchData {
    [self.dataListViewModel fetchDataListWithCompletion:^(NSError * _Nonnull error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableViewData reloadData];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_dataListViewModel showOfflineAlertInViewController:self handler:^(UIAlertAction * _Nonnull action) {
                    [self fetchData];
                }];
            });
            NSLog(@"Error fetching posts: %@", error.localizedDescription);
        }
    }];
}


/*
 "id": 1,
 "title"
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataListViewModel.filterDaraList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    // Mengambil post dari array
    ModelList *dataList = self.dataListViewModel.filterDaraList[indexPath.row];
        
        if (dataList) {
            NSString* idString = [dataList.numberId stringValue];
            NSString* title = dataList.title;
            
            cell.textLabel.attributedText = [self highlightText:currentSearchText inString:idString];
            cell.detailTextLabel.attributedText = [self highlightText:currentSearchText inString:title];
        } else {
            NSLog(@"Post not found for index: %ld", (long)indexPath.row);
        }
    return cell;
}

// Search
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    currentSearchText = searchText;
    
    CGPoint currentOffset = self.tableViewData.contentOffset;

    [self.dataListViewModel searchDataListsWithText:searchText];
    
    [self.tableViewData reloadData];
    
    [self.tableViewData setContentOffset:currentOffset animated:NO];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ModelList *lisData = self.dataListViewModel.filterDaraList[indexPath.row];
    
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.selectedData = lisData;
    [self.navigationController pushViewController:detailVC animated:YES];

    NSLog(@"INI APAAN ==> %@", lisData);
}

#pragma mark - Highlighting Text
- (NSAttributedString *)highlightText:(NSString *)searchText inString:(NSString *)originalString {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:originalString];
    
    if (searchText.length == 0) {
        return attributedString;
    }
    
    NSRange searchRange = NSMakeRange(0, originalString.length);
    NSRange foundRange;
    
    while (searchRange.location < originalString.length) {
        searchRange.length = originalString.length - searchRange.location;
        foundRange = [originalString rangeOfString:searchText options:NSCaseInsensitiveSearch range:searchRange];
        
        if (foundRange.location != NSNotFound) {
            [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:foundRange];
            searchRange.location = foundRange.location + foundRange.length;
        } else {
            break;
        }
    }
    
    return attributedString;
}

@end
