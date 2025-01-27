
#import "MDCBottomNavigationBarItem.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MDCBadgeAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDCBottomNavigationBarItem ()
@end

@implementation MDCBottomNavigationBarItem

- (instancetype)initWithBarItem:(UITabBarItem *)item {
  self = [super init];
  if (self) {
    _item = item;
    _badgeAppearance = nil;
  }
  return self;
}

- (instancetype)initWithBarItem:(UITabBarItem *)item
                badgeAppearance:(nonnull MDCBadgeAppearance *)badgeAppearance {
  self = [super init];
  if (self) {
    _item = item;
    _badgeAppearance = [badgeAppearance copy];
  }
  return self;
}

@end

NS_ASSUME_NONNULL_END
