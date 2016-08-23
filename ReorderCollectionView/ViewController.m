//
//  ViewController.m
//  ReorderCollectionView
//
//  Created by Developer Desks on 2/25/16.
//  Copyright © 2016 Developer Desks. All rights reserved.
//

#import "ViewController.h"
#import "CustomeCell.h"
@interface ViewController ()
{
    NSMutableArray * data;
    NSMutableArray *imageArray;
    
    
    
    int largeBox;
    int smallBox;
    
    NSString *incremtinSmall;
    NSString *incremtnInLarge;
    
}


@property(nonatomic) BOOL installsStandardGestureForInteractiveMovement;

@end

@implementation ViewController

@synthesize collectionView_Custom;

static NSString * const reuseIdentifier = @"a";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
     largeBox=3;
     smallBox=2;
    
    _installsStandardGestureForInteractiveMovement =YES;
    

    _identifier=[[NSArray alloc]initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g", nil];
    
    
    collectionView_Custom.delegate=self;
    collectionView_Custom.dataSource=self;
    
    
    
  //   attach long press gesture to collectionView
    UILongPressGestureRecognizer *lpgr
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.delegate = self;
    lpgr .minimumPressDuration=0.5;
    
    lpgr.delaysTouchesBegan = YES;
    [self.collectionView_Custom addGestureRecognizer:lpgr];
    

   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated
{
    
    NSMutableArray *data_UserDefaults=[[NSUserDefaults standardUserDefaults]valueForKey:@"cell_title"];
    
    
    if([data_UserDefaults count]>0)
    {
        data=data_UserDefaults;
        
    }
    else
    {
        data=[[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J", nil];
        
        
    }
    
    NSMutableArray *imageDAta=[[NSUserDefaults standardUserDefaults]valueForKey:@"image_title"];
    
    if([imageDAta count]>0)
    {
        imageArray=imageDAta;
        
    }
    
    else
    {
        imageArray=[[NSMutableArray alloc]initWithObjects:@"A.png",@"B.png",@"C.png",@"D.png",@"E.png",@"F.png",@"G.png",@"H.png",@"I.png",@"J.png", nil];
    }
    

}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
        largeBox=3;
        smallBox=2;

    
        incremtinSmall=@"";
        incremtnInLarge=@"";
    
        NSIndexPath *selectedindexPath;
    
    
        if(gestureRecognizer.state==UIGestureRecognizerStateBegan){
            selectedindexPath=[self.collectionView_Custom indexPathForItemAtPoint:[gestureRecognizer locationInView:self.collectionView_Custom]];
            
            if(selectedindexPath!=nil){
            
            [collectionView_Custom beginInteractiveMovementForItemAtIndexPath:selectedindexPath];
            }
            }
    
    else if (gestureRecognizer.state==UIGestureRecognizerStateChanged)
    {
        [self.collectionView_Custom updateInteractiveMovementTargetPosition:[gestureRecognizer locationInView:(gestureRecognizer.view)]];
    }
    else if (gestureRecognizer.state==UIGestureRecognizerStateEnded){
        [collectionView_Custom endInteractiveMovement];
        
    }
    else
        [collectionView_Custom cancelInteractiveMovement];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of items
   
    
   // return 7;
    
    return [data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomeCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    cell.text_Lbl.text=[data objectAtIndex:indexPath.row];
    
    cell.imageView_Cell.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    
    
    cell.layer.cornerRadius=5.0f;
    cell.layer.masksToBounds=YES;
    
    cell.layer.borderWidth=1.0f;
    cell.layer.borderColor=[UIColor blackColor].CGColor;
    

    if(indexPath.row==2 ||indexPath.row==4){
        [cell setBackgroundColor:[UIColor redColor]];
        
    }
   else if(indexPath.row==3||indexPath.row==6){
        [cell setBackgroundColor:[UIColor brownColor]];
        
    }
    
    else if(indexPath.row==0 ||indexPath.row==7){
        [cell setBackgroundColor:[UIColor greenColor]];
        
    }
    else if (indexPath.row==1 || indexPath.row==5){
        [cell setBackgroundColor:[UIColor yellowColor]];
    }

    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */


 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 



-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

    NSMutableArray *tempArray=[[NSMutableArray alloc]init];
    
    NSMutableArray *tempImages=[[NSMutableArray alloc]init];
    
    
    for (int i=0; i<[data count]; i++){
        NSIndexPath *indexing = [NSIndexPath indexPathForRow:i inSection:0];
        
        CustomeCell *cell=(CustomeCell *)[self.collectionView_Custom cellForItemAtIndexPath:indexing];
        
        NSString *cellTitle=cell.text_Lbl.text;
        [tempArray addObject:cellTitle];
        
        [tempImages addObject:cellTitle];
        
        NSLog(@"%@",cellTitle);
        
    }
    
    
        [[NSUserDefaults standardUserDefaults]setValue:tempArray forKey:@"cell_title"];
    
        [[NSUserDefaults standardUserDefaults]setValue:tempImages forKey:@"image_title"];
 
        data=tempArray;
        imageArray=tempImages;
    
        NSLog(@"MOve item at index called \n\n");
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@" CEll Clicked %@",[data objectAtIndex:indexPath.row]);
    
    // perform segue with identifer "Cell Title";

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIDevice *current=[UIDevice currentDevice];
    

    CGSize size = collectionView_Custom.bounds.size;
    NSInteger width = size.width;
    NSInteger height = size.height;

    
  //  NSString *device=[[UIDevice currentDevice] name];
    NSLog( @"device is running %@",current.model);

    CGFloat cellWith=width/2;
    CGFloat cellHight=height/4;
    
    if (indexPath.row==smallBox){
        
        if(smallBox==2){
            smallBox=smallBox+5;
            incremtinSmall=@"5";
            
        }
     else if ([incremtnInLarge integerValue]==3){
         
            smallBox=smallBox+5;
            incremtinSmall=@"5";
     }
        else if ([incremtnInLarge integerValue]==5){
            smallBox=smallBox+3;
            incremtinSmall=@"3";
        }
        
        return CGSizeMake(cellWith*0.75,cellHight);
       
    }
    
    if(indexPath.row==largeBox)
    {
        if(largeBox==3){
            largeBox=largeBox+3;
            incremtnInLarge=@"3";
            
        }
        else if ([incremtinSmall integerValue]==3){
            largeBox=largeBox+5;
            incremtnInLarge=@"5";
            
        }
        else if ([incremtinSmall integerValue]==5){
             largeBox=largeBox+3;
             incremtnInLarge=@"3";
        
        }
    
         return CGSizeMake(cellWith*1.25,cellHight);

    }

    return CGSizeMake(cellWith,cellHight);

    

}

@end
