// Copyright 2022-present the Material Components for iOS authors. All Rights Reserved.
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

#import "MDCBottomNavigationBar.h"
#import "MDCBottomNavigationItemView.h"

NS_ASSUME_NONNULL_BEGIN

/**
 This category extracts logic for item view configuration out of the primary MDCBottomNavigationBar
 implementation.
 */
@interface MDCBottomNavigationBar (ItemViewConfiguration)

/**
 Configures the badge, colors, margin, pointer interaction, and title of the itemView.
 Also configures the itemView based on the properties of an instance of UITabBarItem.

 @param itemView The MDCBottomNavigationItemView instance to be configured.
 @param item The item used to configure the itemView.
 */
- (void)configureItemView:(MDCBottomNavigationItemView *)itemView
                 withItem:(UITabBarItem *)item
               appearance:(nullable MDCBadgeAppearance *)appearance;

@end

NS_ASSUME_NONNULL_END
