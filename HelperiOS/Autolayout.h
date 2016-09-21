//
//  Autolayout.h
//
//  Created by Umair Qureshi on 15/12/2014.
//  Copyright (c) 2014 Umair Qureshi. All rights reserved.
//

#ifndef Dubsfun_Autolayout_h
#define Dubsfun_Autolayout_h

#pragma mark - Base

#define SWCConstraint(firstItem,firstAttribute,relation,secondItem,secondAttribute,layoutMultiplier,layoutConstant) [NSLayoutConstraint constraintWithItem:firstItem attribute:firstAttribute relatedBy:relation toItem:secondItem attribute:secondAttribute multiplier:layoutMultiplier constant:layoutConstant]

#pragma mark - Left
/////////////////////////////// Left ///////////////////////////////

//Left is left

#define SWCLeftIsLeft(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,1.f,0)

#define SWCLeftIsLeftWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,1.f,layoutConstant)

#define SWCLeftIsLeftWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,layoutMultiplier,0)

#define SWCLeftIsLeftWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,layoutMultiplier,layoutConstant)

//Left is Right

#define SWCLeftIsRight(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,1.f,0)

#define SWCLeftIsRightWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,1.f,layoutConstant)

#define SWCLeftIsRightWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,layoutMultiplier,0)

#define SWCLeftIsRightWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,layoutMultiplier,layoutConstant)

//Left is CenterX

#define SWCLeftIsCenterX(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeLeft,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterX,1.f,0)

#pragma mark - Right
/////////////////////////////// Right ///////////////////////////////

//Right is Right

#define SWCRightIsRight(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,1.f,0)

#define SWCRightIsRightWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,1.f,layoutConstant)

#define SWCRightIsRightWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,layoutMultiplier,0)

#define SWCRightIsRightWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,layoutMultiplier,layoutConstant)

//Right is Left

#define SWCRightIsLeft(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,1.f,0)

#define SWCRightIsLeftWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,1.f,layoutConstant)

#define SWCRightIsLeftWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,layoutMultiplier,0)

#define SWCRightIsLeftWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,layoutMultiplier,layoutConstant)

//Right is CenterX

#define SWCRightIsCenterX(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeRight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterX,1.f,0)

#pragma mark - Top
/////////////////////////////// Top ///////////////////////////////

//Top is top

#define SWCTopIsTop(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,1.f,0)

#define SWCTopIsTopWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,1.f,layoutConstant)

#define SWCTopIsTopWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,layoutMultiplier,0)

#define SWCTopIsTopWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,layoutMultiplier,layoutConstant)

//Top is Bottom

#define SWCTopIsBottom(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,1.f,0)

#define SWCTopIsBottomWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,1.f,layoutConstant)

#define SWCTopIsBottomWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,layoutMultiplier,0)

#define SWCTopIsBottomWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,layoutMultiplier,layoutConstant)

//Top is center

#define SWCTopIsCenterY(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeTop,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterY,1.f,0)

#pragma mark - Bottom
/////////////////////////////// Bottom ///////////////////////////////

//Bottom is bottom

#define SWCBottomIsBottom(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,1.f,0)

#define SWCBottomIsBottomWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,1.f,layoutConstant)

#define SWCBottomIsBottomWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,layoutMultiplier,0)

#define SWCBottomIsBottomWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,layoutMultiplier,layoutConstant)

//Bottom is Top

#define SWCBottomIsTop(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,1.f,0)

#define SWCBottomIsTopWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,1.f,layoutConstant)

#define SWCBottomIsTopWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,layoutMultiplier,0)

#define SWCBottomIsTopWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeTop,layoutMultiplier,layoutConstant)

//Bottom is Center

#define SWCBottomIsCenterY(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeBottom,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterY,1.f,0)

#pragma mark - CenterX
/////////////////////////////// CenterX ///////////////////////////////

//CenterX is CenterX

#define SWCCenterXIsCenterX(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeCenterX,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterX,1.f,0)

#define SWCCenterXIsCenterXWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeCenterX,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterX,1.f,layoutConstant)

#define SWCCenterXIsCenterXWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeCenterX,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterX,layoutMultiplier,0)

#define SWCCenterXIsCenterXWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeCenterX,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterX,layoutMultiplier,layoutConstant)

#define SWCCenterXIsRight(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeCenterX,NSLayoutRelationEqual,secondItem,NSLayoutAttributeRight,1.f,0)

#define SWCCenterXIsLeft(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeCenterX,NSLayoutRelationEqual,secondItem,NSLayoutAttributeLeft,1.f,0)

#pragma mark - CenterY
/////////////////////////////// CenterY ///////////////////////////////

//CenterY is CenterY

#define SWCCenterYIsCenterY(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeCenterY,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterY,1.f,0)

#define SWCCenterYIsCenterYWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeCenterY,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterY,1.f,layoutConstant)

#define SWCCenterYIsCenterYWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeCenterY,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterY,layoutMultiplier,0)

#define SWCCenterYIsCenterYWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeCenterY,NSLayoutRelationEqual,secondItem,NSLayoutAttributeCenterY,layoutMultiplier,layoutConstant)

#define SWCCenterYIsBottom(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeCenterY,NSLayoutRelationEqual,secondItem,NSLayoutAttributeBottom,1.f,0)

#pragma mark - Width
/////////////////////////////// Width ///////////////////////////////

//Width is Width

#define SWCWidthIsWidth(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationEqual,secondItem,NSLayoutAttributeWidth,1.f,0)

#define SWCWidthIsWidthWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationEqual,secondItem,NSLayoutAttributeWidth,1.f,layoutConstant)

#define SWCWidthIsWidthWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationEqual,secondItem,NSLayoutAttributeWidth,layoutMultiplier,0)

#define SWCWidthIsWidthWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationEqual,secondItem,NSLayoutAttributeWidth,layoutMultiplier,layoutConstant)

//Width is Height

#define SWCWidthIsHeight(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationEqual,secondItem,NSLayoutAttributeHeight,1.f,0)

#define SWCWidthIsHeightWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationEqual,secondItem,NSLayoutAttributeHeight,layoutMultiplier,0)

//Width is Constant

#define SWCWidthIsConstant(firstItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationEqual,nil,NSLayoutAttributeNotAnAttribute,1,layoutConstant)

//Comparaison

#define SWCWidthIsLessThanOrEqual(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationLessThanOrEqual,secondItem,NSLayoutAttributeWidth,1,0)

#define SWCWidthIsLessThanOrEquSWConstant(firstItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationLessThanOrEqual,nil,NSLayoutAttributeNotAnAttribute,1,layoutConstant)

#define SWCWidthIsGreaterThanOrEqual(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationGreaterThanOrEqual,secondItem,NSLayoutAttributeWidth,1,0)

#define SWCWidthIsGreaterThanOrEquSWConstant(firstItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeWidth,NSLayoutRelationGreaterThanOrEqual,nil,NSLayoutAttributeNotAnAttribute,1,layoutConstant)

#pragma mark - Height
/////////////////////////////// Height ///////////////////////////////

//Height is Height

#define SWCHeightIsHeight(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeHeight,1.f,0)

#define SWCHeightIsHeightWithConstant(firstItem, secondItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeHeight,1.f,layoutConstant)

#define SWCHeightIsHeightWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeHeight,layoutMultiplier,0)

#define SWCHeightIsHeightWithMultiplierAndConstant(firstItem, secondItem, layoutMultiplier, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeHeight,layoutMultiplier,layoutConstant)

//Height is Width

#define SWCHeightIsWidth(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeWidth,1.f,0)

#define SWCHeightIsWidthWithMultiplier(firstItem, secondItem, layoutMultiplier) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationEqual,secondItem,NSLayoutAttributeWidth,layoutMultiplier,0)

//Height is Constant

#define SWCHeightIsConstant(firstItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationEqual,nil,NSLayoutAttributeNotAnAttribute,1,layoutConstant)

//Comparaison

#define SWCHeightIsLessThanOrEqual(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationLessThanOrEqual,secondItem,NSLayoutAttributeHeight,1,0)

#define SWCHeightIsLessThanOrEquSWConstant(firstItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationLessThanOrEqual,nil,NSLayoutAttributeNotAnAttribute,1,layoutConstant)

#define SWCHeightIsGreaterThanOrEqual(firstItem, secondItem) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationGreaterThanOrEqual,secondItem,NSLayoutAttributeHeight,1,0)

#define SWCHeightIsGreaterThanOrEquSWConstant(firstItem, layoutConstant) SWCConstraint(firstItem,NSLayoutAttributeHeight,NSLayoutRelationGreaterThanOrEqual,nil,NSLayoutAttributeNotAnAttribute,1,layoutConstant)
#endif
