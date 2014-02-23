#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMockito/OCMockito.h>
#import "TrendsViewController.h"

SpecBegin(TrendsViewController)

describe(@"TrendsViewController", ^{
    __block TrendsViewController *_tvc;
    beforeEach(^{
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        UINavigationController *_navController = [sb instantiateViewControllerWithIdentifier:@"NavController"];
        _tvc = _navController.viewControllers[0];
        UIView *view = _tvc.view;
        expect(view).toNot.beNil();
    });
    
    it(@"should exist", ^{
        expect(_tvc).toNot.beNil();
    });
});

SpecEnd
    
