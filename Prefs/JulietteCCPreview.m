#import "JulietteCCPreview.h"

@implementation JulietteCCPreview
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
	if (self) {
        JulietteVolumeWidget *widget = [[JulietteVolumeWidget alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 100, 100)];
        [self addSubview:widget];
    }
    return self;
}
@end
