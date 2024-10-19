//
//  DataList.h
//  MiniProjectObjC
//
//  Created by west on 19/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModelList : NSObject
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *numberId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;
@end

NS_ASSUME_NONNULL_END
