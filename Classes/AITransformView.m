//
//  AITransformView.m
//  Layers
//
//  Created by test on 3/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AITransformView.h"

@implementation AITransformView

@synthesize trackball;

#pragma mark -
#pragma mark Definitions

#define Border_Width 3.0;
#define Corner_Radius 75.0;
#define Layer_Size 150.0


#pragma mark -
#pragma mark Functions

CGFloat DegreesToRadians(CGFloat degrees) 
	{return degrees * M_PI / 180;}


#pragma mark -
#pragma mark Setup

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//		self.multipleTouchEnabled = YES;
        [self setupLayers];		
		self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)setupLayers {
	
	//Root Layer
	rootLayer = [CALayer layer];
	rootLayer.frame = self.bounds;
	[self.layer addSublayer:rootLayer];
	
	CGFloat layerSize = Layer_Size;
	CGRect layerRect = CGRectMake(0.0, 0.0, layerSize, layerSize);
	
	
	//Side One_Front_Blue
	CALayer *sideOne = [CALayer layer];
	sideOne.borderColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
	sideOne.backgroundColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:0.4].CGColor;
	sideOne.borderWidth = Border_Width;
	sideOne.cornerRadius = Corner_Radius;
	sideOne.frame = layerRect;
	sideOne.position = self.center;
	
	
	//Side Two_Right_Green
	CALayer *sideTwo = [CALayer layer];
	sideTwo.borderColor = [UIColor colorWithHue:0.25 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
	sideTwo.backgroundColor = [UIColor colorWithHue:0.25 saturation:1.0 brightness:1.0 alpha:0.4].CGColor;
	sideTwo.borderWidth = Border_Width;
	sideTwo.cornerRadius = Corner_Radius;

	sideTwo.frame = layerRect;
	sideTwo.position = self.center;
	
	CGFloat degrees = 90.0;
	CGFloat radians = DegreesToRadians(degrees);
	CATransform3D rotation = CATransform3DMakeRotation(radians, 0.0, 1.0, 0.0);
	CATransform3D translation = CATransform3DMakeTranslation(Layer_Size/2, 0.0, Layer_Size/-2);
	CATransform3D position = CATransform3DConcat(rotation, translation);	 
	sideTwo.transform = position;


	//Side Three_Back_Red
	CALayer *sideThree = [CALayer layer];
	sideThree.borderColor = [UIColor colorWithHue:0.0 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
	sideThree.backgroundColor = [UIColor colorWithHue:0.0 saturation:1.0 brightness:1.0 alpha:0.4].CGColor;
	sideThree.borderWidth = Border_Width;
	sideThree.cornerRadius = Corner_Radius;
	sideThree.frame = layerRect;
	sideThree.position = self.center;
		
	translation = CATransform3DMakeTranslation(0.0, 0.0, -Layer_Size);
	sideThree.transform = translation;
	
	
	//Side Four_Left_Yellow
	CALayer *sideFour = [CALayer layer];
	sideFour.borderColor = [UIColor colorWithHue:0.2 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
	sideFour.backgroundColor = [UIColor colorWithHue:0.2 saturation:1.0 brightness:1.0 alpha:0.4].CGColor;
	sideFour.borderWidth = Border_Width;
	sideFour.cornerRadius = Corner_Radius;
	sideFour.frame = layerRect;
	sideFour.position = self.center;
	
	rotation = CATransform3DMakeRotation(radians, 0.0, 1.0, 0.0);
	translation = CATransform3DMakeTranslation(Layer_Size/-2, 0.0, Layer_Size/-2);
	sideFour.transform = CATransform3DConcat(rotation, translation);
				

	//Side Five_Top_Purple
	CALayer *sideFive = [CALayer layer];
	sideFive.borderColor = [UIColor colorWithHue:0.8 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
	sideFive.backgroundColor = [UIColor colorWithHue:0.8 saturation:1.0 brightness:1.0 alpha:0.4].CGColor;
	sideFive.borderWidth = Border_Width;
	sideFive.cornerRadius = Corner_Radius;
	sideFive.frame = layerRect;
	sideFive.position = self.center;
	
	rotation = CATransform3DMakeRotation(radians, 1.0, .0, 0.0);
	translation = CATransform3DMakeTranslation(0.0, Layer_Size/-2, Layer_Size/-2);
	sideFive.transform = CATransform3DConcat(rotation, translation);
	
	
	//Side Six_Bottom_Orange
	CALayer *sideSix = [CALayer layer];
	sideSix.borderColor = [UIColor colorWithHue:0.0845 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
	sideSix.backgroundColor = [UIColor colorWithHue:0.0845 saturation:1.0 brightness:1.0 alpha:0.4].CGColor;
	sideSix.borderWidth = Border_Width;
	sideSix.cornerRadius = Corner_Radius;
	sideSix.frame = layerRect;
	sideSix.position = self.center;
	
	rotation = CATransform3DMakeRotation(radians, 1.0, .0, 0.0);
	translation = CATransform3DMakeTranslation(0.0, Layer_Size/2, Layer_Size/-2);
	sideSix.transform = CATransform3DConcat(rotation, translation);	
	
	
	//Transform Layer
	transformLayer = [CATransformLayer layer];
	
	[transformLayer addSublayer:sideOne];
	[transformLayer addSublayer:sideTwo];
	[transformLayer addSublayer:sideThree];
	[transformLayer addSublayer:sideFour];
	[transformLayer addSublayer:sideFive];
	[transformLayer addSublayer:sideSix];

	transformLayer.anchorPointZ = Layer_Size/-2;
		
	[rootLayer addSublayer:transformLayer];
}


#pragma mark -
#pragma mark Touch Handling


//Trackball Version by Bill Dudney
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint location = [[touches anyObject] locationInView:self];
	if(nil == self.trackball) {
		self.trackball = [Trackball trackBallWithLocation:location inRect:self.bounds];
	} else {
		[self.trackball setStartPointFromLocation:location];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint location = [[touches anyObject] locationInView:self];
	CATransform3D transform = [trackball rotationTransformForLocation:location];
	rootLayer.sublayerTransform = transform;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint location = [[touches anyObject] locationInView:self];
	[self.trackball finalizeTrackBallForLocation:location];
}


#pragma mark -


- (void)dealloc {
	[rootLayer release];
    [super dealloc];
}


@end
