//
//  ViewController.h
//  ReorderCollectionView
//
//  Created by Developer Desks on 2/25/16.
//  Copyright © 2016 Developer Desks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollisionBehaviorDelegate,UIGestureRecognizerDelegate>



@property(strong,nonatomic)NSArray *identifier;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView_Custom;

//@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgr;

@end

