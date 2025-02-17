//
//  iTunesLookupBaseClass.h
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface iTunesLookupBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, assign) double resultCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
