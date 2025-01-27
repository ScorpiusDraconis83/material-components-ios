// Copyright 2024-present the Material Components for iOS authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <UIKit/UIKit.h>

#import "MDCBadgeAppearance.h"

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface MDCBottomNavigationBarItem : NSObject

/**
 Initializes a new MDCBottomNavigationBarItem with the given UITabBarItem.
 */
- (instancetype)initWithBarItem:(UITabBarItem *)item;

/**
 Initializes a new MDCBottomNavigationBarItem with the given UITabBarItem and MDCBadgeAppearance.
 */
- (instancetype)initWithBarItem:(UITabBarItem *)item
                badgeAppearance:(nonnull MDCBadgeAppearance *)badgeAppearance;

/**
 The appearance to be used for this item's badge. Defaults to nil.

 If this property is set to a nil value, the badge will use the default appearance provided to the
 MDCBottomNavigationBar.itemBadgeAppearance.
 */
@property(nonatomic, copy, nullable) MDCBadgeAppearance *badgeAppearance;

/**
 A UITabBarItem that is used to populate bottom navigation bar content.
 */
@property(nonatomic, nonnull) UITabBarItem *item;

@end

NS_ASSUME_NONNULL_END
