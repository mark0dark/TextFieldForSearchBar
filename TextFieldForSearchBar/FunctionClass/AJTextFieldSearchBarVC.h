//
//  AJTextFieldSearchBarVC.h
//  TextFieldForSearchBar
//
//  Created by Jianwen on 13-7-17.
//  Copyright (c) 2013年 Dark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJTextFieldSearchBarVC : UIViewController
<   UITextFieldDelegate,
    UITableViewDataSource,
    UITableViewDelegate
>
{
    //view
    UITextField *_searchTextField;
    UITableView *_suggestTableView;
    
    //data
    NSMutableArray *_suggestArray;

}
@end
