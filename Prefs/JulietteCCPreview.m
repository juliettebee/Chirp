#import "JulietteCCPreview.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation JulietteCCPreview

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {
        UIView *widget = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
         // Getting album art
         MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
         // Creating UIView with album art
         UIView *albumArt = [[UIImageView alloc] initWithImage:[art imageWithSize:CGSizeMake(100, 100)]];
         // Setting UIView's size
         [albumArt setFrame:CGRectMake(0, 0, 100, 100)];
         // Rounding corners
         [[widget layer] setCornerRadius:10];
         widget.layer.masksToBounds = TRUE;
                  // Adding view
         [widget addSubview:albumArt];
         [self addSubview:albumArt];
    }
    return self;
} 
@end
