#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMockito/OCMockito.h>
#import "TrendsViewController.h"
#import "ColorConstants.h"
#import "GraphContainerView.h"
#import "TotalsView.h"


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
    
    it(@"should have a blue navigation bar", ^{
        expect(_tvc.navigationController.navigationBar).toNot.beNil();
        expect(_tvc.navigationController.navigationBar.barTintColor).to.equal(NAVIGATION_BAR_COLOR);
    });
    
    it(@"should have a graphcontainerview with a JBBarChartView as a subview", ^{
        expect(_tvc.graphView).toNot.beNil();
        expect([_tvc.graphView.subviews[0] class]).to.equal([JBBarChartView class]);
    });
//    it(@"should have a navigationitem titleview", ^{
//       expect(_tvc.navigationController.navig)
//    });
    
});

SpecEnd
    
