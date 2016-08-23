//
//  CollectionViewController.m
//  ReorderCollectionView
//
//  Created by Developer Desks on 2/25/16.
//  Copyright © 2016 Developer Desks. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomeCell.h"
@interface CollectionViewController ()

{
    
}
@end

@implementation CollectionViewController
{
    
}
@synthesize data;
@synthesize imageArray;

static NSString * const reuseIdentifier = @"Cell";



- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return [data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   CustomeCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
  
    cell.layer.cornerRadius=5.0f;
    cell.layer.masksToBounds=YES;
    
    cell.text_Lbl.text=[data objectAtIndex:indexPath.row];
    
    cell.imageView_Cell.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    
    
    if(indexPath.row==2 ||indexPath.row==3||indexPath.row==6)
    {
        [cell setBackgroundColor:[UIColor redColor]];
        
    }
    else if(indexPath.row==0 ||indexPath.row==4||indexPath.row==7||indexPath.row==8)
    {
        [cell setBackgroundColor:[UIColor greenColor]];
        
    }
    else if (indexPath.row==1 || indexPath.row==5||indexPath.row==9)
    {
        [cell setBackgroundColor:[UIColor orangeColor]];
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

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{


    NSMutableArray *tempArray=[[NSMutableArray alloc]init];
    
    NSMutableArray *tempImages=[[NSMutableArray alloc]init];
    
    
    for (int i=0; i<[data count]; i++)
    {
        
        
        NSIndexPath *indexing = [NSIndexPath indexPathForRow:i inSection:0];
        
        CustomeCell *cell=(CustomeCell *)[self.collectionView cellForItemAtIndexPath:indexing];
        
        
        NSString *cellTitle=cell.text_Lbl.text;

        [tempArray addObject:cellTitle];
        
        [tempImages addObject:cellTitle];
        
        
        NSLog(@"%@",cellTitle);
        
    }
  
 
  
    [[NSUserDefaults standardUserDefaults]setValue:tempArray forKey:@"cell_title"];

    [[NSUserDefaults standardUserDefaults]setValue:tempImages forKey:@"image_title"];
    
    data=tempArray;
    imageArray=tempImages;
    
   
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@" CEll Clicked %@",[data objectAtIndex:indexPath.row]);
    
    // perform segue with identifer "Cell Title";
    
    
}




-(void)viewDidDisappear:(BOOL)animated
{

}
- (IBAction)remove_Temps:(id)sender
{
   // to reset at default sequence remove NSUserDefault values in any action where u want..
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = self.collectionView.bounds.size;
    
    
    NSInteger width = size.width-20;
    NSInteger height = size.height-100;

    
    CGFloat cellWidth=width/3;
    CGFloat cellHight=height/4;
    if(indexPath.row==1 || indexPath.row==5)
    {
        
        cellWidth=cellWidth*2;
        
        
    }
    
    return CGSizeMake(cellWidth  ,cellHight);
    
}
@end
