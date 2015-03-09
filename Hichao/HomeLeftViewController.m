//
//  HomeLeftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeLeftViewController.h"
#import "MainLeftRoundCell.h"
#import "MainLeftRectCell.h"

@interface HomeLeftViewController ()
{
    UICollectionView *_collectionView;
    NSIndexPath *_selectedIndexPath;
}
@end

@implementation HomeLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _selectedIndexPath = [[NSIndexPath indexPathForItem:0 inSection:0] retain];
    
    self.view.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    
    layOut.minimumLineSpacing = 0.0;
    
    layOut.minimumInteritemSpacing = 0.0;
    
    layOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    layOut.itemSize = CGSizeMake(60, 60);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 240, M_SCREEN_HEIGHT) collectionViewLayout:layOut];
    
    [_collectionView registerClass:[MainLeftRoundCell class] forCellWithReuseIdentifier:@"RoundCell"];
    
    [_collectionView registerClass:[MainLeftRectCell class] forCellWithReuseIdentifier:@"RectCell"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    [self.view addSubview:_collectionView];
    
    [_collectionView release];
}


#pragma mark- collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        MainLeftRoundCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RoundCell" forIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
        
        if (indexPath == _selectedIndexPath)
        {
            cell.backgroundImage.image = [UIImage imageNamed:@"home_left_btn_type@2x.png"];
        }
        
        return cell;
    }
    else
    {
        MainLeftRectCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RectCell" forIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
        
        cell.titleImageView.image = [UIImage imageNamed:@"home_left_btn_type@2x.png"];
        
        if (indexPath == _selectedIndexPath)
        {
            cell.backgroundColor = M_PINK_COLOR;
        }
        
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind==UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        NSArray *subViews = [view subviews];
        
        for (UIView *view in subViews)
        {
            [view removeFromSuperview];
        }
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 240, 80)];
        label.backgroundColor = [UIColor orangeColor];
        
        [view addSubview:label];
        
        [label release];
        
        return view;
    }
    else
    {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        
        NSArray *subViews = [view subviews];
        
        for (UIView *view in subViews)
        {
            [view removeFromSuperview];
        }

        UISearchBar *seachBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 0, 240-20, 30)];
        
        [view addSubview:seachBar];
        
        return view;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  indexPath.section==0?CGSizeMake(53, 53):CGSizeMake(240, 60);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(240, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return section==0?CGSizeMake(240, 80):CGSizeMake(0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
}

@end
