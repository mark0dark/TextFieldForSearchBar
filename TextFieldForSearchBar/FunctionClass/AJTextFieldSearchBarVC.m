
#import "AJTextFieldSearchBarVC.h"

@interface AJTextFieldSearchBarVC ()

@end

@implementation AJTextFieldSearchBarVC

#pragma mark -- Button Clicked Even

//voice search will be come soon
-(void)voiceBtnClicked
{
    //TODO:
    [_searchTextField resignFirstResponder];
    
}

#pragma mark -- Init View Frame
-(void)resetDataAndView
{
    _searchTextField.text = @"";
    //close the keyboard
    [_searchTextField resignFirstResponder];
    
    [_suggestTableView setHidden:YES];

}

-(void)initSearchBarView
{
    UIImageView* searchBackImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 63/2)];
    [searchBackImageV setImage:[UIImage imageNamed:@"search_home.png"]];
    [searchBackImageV setUserInteractionEnabled:YES];
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 7, 240, 63/2-10)];
    _searchTextField.returnKeyType = UIReturnKeySearch;
    _searchTextField.delegate = self;
    _searchTextField.font = [UIFont systemFontOfSize:13.0];
    _searchTextField.keyboardType = UIKeyboardTypeDefault;
    _searchTextField.clearButtonMode = UITextFieldViewModeAlways;
    //    _searchTextField.clearsOnBeginEditing=YES;
    [_searchTextField setPlaceholder:@"please input the keyword"];
    
    UIButton *voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [voiceBtn setFrame:CGRectMake(300-56/2-1, (63/2-56/2)/2, 56/2, 56/2)];
    [voiceBtn setBackgroundImage:[UIImage imageNamed:@"voice_button_common.png"] forState:UIControlStateNormal];
    [voiceBtn setBackgroundImage:[UIImage imageNamed:@"voice_button_pressed.png"] forState:UIControlStateHighlighted];
    [voiceBtn addTarget:self action:@selector(voiceBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [searchBackImageV addSubview:voiceBtn];
    
    [searchBackImageV addSubview:_searchTextField];
    [self.view addSubview:searchBackImageV];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initSearchBarView];
}


#pragma mark -
#pragma mark - UITextField delegate

- (BOOL)hasSeggustData
{
    return !([_suggestArray count] > 0);
}

- (void)initSearchSets
{
    //congig data
    if (!_suggestArray) {
        _suggestArray = [[NSMutableArray alloc] initWithCapacity:3];
    }
    
    //init suggest View
    if (!_suggestTableView) {
        _suggestTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, 320, 240)];
        [_suggestTableView setBackgroundColor:[UIColor whiteColor]];
        [_suggestTableView setAlpha:0.7];
        _suggestTableView.delegate = self;
        _suggestTableView.dataSource = self;
        _suggestTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_suggestTableView];
    }
    //default hidden
    [_suggestTableView setHidden:YES];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //add suggest data
    [self initSearchSets];
}

/*
 *if you return yes, you will not hidden the keyboard;
 */
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self resetDataAndView];

    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString* searchWord = _searchTextField.text;
    
    if ( searchWord != nil && ![searchWord isEqualToString:@""])
    {
        //push next view
    }else{
        [self resetDataAndView];
    }
    
    return YES;
}

//associating inputing
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([_suggestArray count]<1) {
        NSArray *ary = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6",nil];
        [_suggestArray addObjectsFromArray:ary];
        [_suggestTableView reloadData];
    }
    [_suggestTableView setHidden:NO];

    return YES;
}

#pragma mark -- UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_suggestArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    int index = indexPath.row;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[_suggestArray objectAtIndex:index]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    _searchTextField.text = [NSString stringWithFormat:@"%@",[_suggestArray objectAtIndex:indexPath.row]];
    [self resetDataAndView];

}


#pragma mark -- Init View Frame

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
