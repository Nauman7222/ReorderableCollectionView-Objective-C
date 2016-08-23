//
//  CollectionViewController.h
//  ReorderCollectionView
//
//  Created by Developer Desks on 2/25/16.
//  Copyright © 2016 Developer Desks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController


@property (strong,nonatomic)NSMutableArray *data;
@property(strong,nonatomic)NSMutableArray *imageArray;
- (IBAction)remove_Temps:(id)sender;

@end
