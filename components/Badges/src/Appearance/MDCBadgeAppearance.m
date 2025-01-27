#import "MDCBadgeAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@implementation MDCBadgeAppearance

- (nonnull instancetype)init {
  return [super init];
}

#pragma mark - NSCopying

- (nonnull id)copyWithZone:(nullable __unused NSZone *)zone {
  MDCBadgeAppearance *config = [[MDCBadgeAppearance alloc] init];
  config.dotBadgeEnabled = self.dotBadgeEnabled;
  config.dotBadgeInnerRadius = self.dotBadgeInnerRadius;
  config.backgroundColor = self.backgroundColor;
  config.textColor = self.textColor;
  config.font = self.font;
  config.borderColor = self.borderColor;
  config.borderWidth = self.borderWidth;
  return config;
}

@end

NS_ASSUME_NONNULL_END
