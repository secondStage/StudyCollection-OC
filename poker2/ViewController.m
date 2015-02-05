//
//  ViewController.m
//  poker2
//
//  Created by sakuda-ryo on 2015/02/05.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation ViewController{
    
    NSMutableArray *moviePhotos;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.myCollectionView setDataSource:self];
    [self.myCollectionView setDelegate:self];
    
    [self setData];
    
    
    
}- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setData{
    
    moviePhotos = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 3; i++) {
        NSString *filename = [NSString stringWithFormat:@"movie%d.jpg", i];
        [moviePhotos addObject:[UIImage imageNamed:filename]];

    }
}

#pragma mark -collection view delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //とりあえずセクションは2つ
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return moviePhotos.count;
}


//Method to create cell at index path
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:1];
    image.backgroundColor = [UIColor redColor];
    
    //画像入れてる
    [image setImage:moviePhotos[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //クリックされたらよばれる
    NSLog(@"Clicked %d-%d",indexPath.section,indexPath.row);
}


@end
