#import <Preferences/PSTableCell.h>
#import <Preferences/PSHeaderFooterView.h>

@interface JulietteCustom :  PSTableCell <PSHeaderFooterView> 
@end

@implementation JulietteCustom
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.frame];
        [label setText:@"Hi"];
        [self addSubview:label];
    }
        return self;
        }
@end
