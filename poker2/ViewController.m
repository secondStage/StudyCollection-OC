//
//  ViewController.m
//  poker2
//
//  Created by sakuda-ryo on 2015/02/05.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "TestModel.h"

#import <ASIHTTPRequest.h>

@interface ViewController () 
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;


@end

@implementation ViewController{
    
    NSMutableArray *moviePhotos;
    UIImage *sendImage;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.myCollectionView setDataSource:self];
    [self.myCollectionView setDelegate:self];
    
    [self setData];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setData{
    
    moviePhotos = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= [TestModel sharedManager].imageArray.count; i++) {
        
        
        NSURL *myURL = [NSURL URLWithString:
                        @"http://www.study.com/image/23.jpg"];
        NSData *myData = [NSData dataWithContentsOfURL:myURL];
        UIImage *myImage = [UIImage imageWithData:myData];
                
//        NSString *filename = [NSString stringWithFormat:@"movie%d.jpg", i];
//        [moviePhotos addObject:[UIImage imageNamed:filename]];
        [moviePhotos addObject:myImage];

    }
}

-(void)callApi{
    
    NSURL *url = [NSURL URLWithString:@"http://www.YOURWEBSERVER.com/api/adAPI.php?AdID=1"];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestCompleted:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSLog(@"API Response: %@", responseString);
    
    [self setData];
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
    NSArray *paths = [collectionView indexPathsForSelectedItems];
    NSIndexPath *path = [paths objectAtIndex: 0];
    NSLog(@"Selected. Item number = %d", path.item);
    
    sendImage = moviePhotos[indexPath.row];
    [self performSegueWithIdentifier:@"toDetailView" sender:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"toDetailView"]) {
        DetailViewController *secondViewController = segue.destinationViewController;
        secondViewController.image = sendImage;
        
        secondViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        NSLog(@"%@",sendImage);
    }
    
}

- (IBAction)unwindToTop:(UIStoryboardSegue *)segue
{
    
}



@end
