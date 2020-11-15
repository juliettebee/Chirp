#line 1 "Tweak/Tweak.x"
#import "Tweak/Tweak.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBElasticVolumeViewController; @class MRPlatterViewController; 
static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MRPlatterViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL MRPlatterViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MRPlatterViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MRPlatterViewController* _LOGOS_SELF_CONST, SEL); 

#line 3 "Tweak/Tweak.x"
 
    static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        _logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad(self, _cmd);
        [[self view] addSubview:ccMusic];
    }



    static void _logos_method$_ungrouped$MRPlatterViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MRPlatterViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        _logos_orig$_ungrouped$MRPlatterViewController$viewDidLoad(self, _cmd);
        ccMusic = [self view];
    }

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBElasticVolumeViewController = objc_getClass("SBElasticVolumeViewController"); { MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad);}Class _logos_class$_ungrouped$MRPlatterViewController = objc_getClass("MRPlatterViewController"); { MSHookMessageEx(_logos_class$_ungrouped$MRPlatterViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$MRPlatterViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$MRPlatterViewController$viewDidLoad);}} }
#line 16 "Tweak/Tweak.x"
