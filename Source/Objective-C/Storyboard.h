//  Copyright © 2015 Outware Mobile. All rights reserved.

@import UIKit;

/**
 * When instantiated with a block `inject`, calls that block with the
 * instantiated view controller whenever a view controller is instantiated from
 * the receiving storyboard.
 */
@interface Storyboard : UIStoryboard

/**
 * Initialises an instance of this class with a storyboard name.
 *
 * @param name Storyboard name
 *
 * @return instance of class
 */
- (nonnull instancetype)initWithName:(nonnull NSString *)name;

/**
 * Initialises an instance of this class with a storyboard name and a function to call upon the view controller
 * in order to inject dependencies.
 *
 * @param name    Storyboard name
 * @param inject  A function which is invoked on an initialised view controller to inject dependencies
 *
 * @return instance of class
 */
- (nonnull instancetype)initWithName:(nonnull NSString *)name inject:(nonnull void (^)(UIViewController * _Nonnull))inject;

/**
 * Initialises an instance of this class with a storyboard name and the bundle containing the storyboard.
 *
 * @param name    Storyboard name
 * @param bundle  Bundle containing the storyboard
 *
 * @return instance of class
 */
- (nonnull instancetype)initWithName:(nonnull NSString *)name bundle:(nonnull NSBundle *)bundle;

/**
 * Initialises an instance of this class with a storyboard name, a function to call upon the view controller
 * in order to inject dependencies and the bundle containing the storyboard.
 *
 * @param name    Storyboard name
 * @param bundle  Bundle containing the storyboard
 * @param inject  A function which is invoked on an initialised view controller to inject dependencies
 *
 * @return instance of class
 */
- (nonnull instancetype)initWithName:(nonnull NSString *)name bundle:(nonnull NSBundle *)bundle inject:(nonnull void (^)(UIViewController * _Nonnull))inject;

@end
