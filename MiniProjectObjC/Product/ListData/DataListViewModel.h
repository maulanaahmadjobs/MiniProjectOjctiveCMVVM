//
//  DataListViewModel.h
//  MiniProjectObjC
//
//  Created by west on 19/10/24.
//

#import <Foundation/Foundation.h>
#import "ModelList.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataListViewModel : NSObject
@property (nonatomic, strong) NSArray<ModelList *> *dataList;
@property (nonatomic, strong) NSArray<ModelList *> *filterDaraList;

- (void) fetchDataListWithCompletion: (void (^)(NSError* error)) completion;
- (void) searchDataListsWithText:(NSString* ) searchText;
- (void) showOfflineAlertInViewController:(UIViewController *)viewController handler :(void (^)(UIAlertAction *action))handler;
@end

NS_ASSUME_NONNULL_END
