
#import "AJViewController.h"
#import "AJTextFieldSearchBarVC.h"

@interface AJViewController ()

@end

@implementation AJViewController

#pragma mark -- Init View Frame

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *functionListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStyleGrouped];
    functionListTableView.delegate = self;
    functionListTableView.dataSource = self;
    [self.view addSubview:functionListTableView];
}

#pragma mark -- UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    int type = indexPath.row;

    switch (type) {
        case SearchBar_Systematic:
        {
            cell.textLabel.text = @"SearchBar_Systematic";
        }
            break;
        case SearchBar_DIY:
        {
            cell.textLabel.text = @"SearchBar_DIY";
        }
            break;
        case TextField_SearchBar_Systematic:
        {
            cell.textLabel.text = @"TextField_SearchBar_Systematic";
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
            break;
        case TextField_SearchBar_DIY:
        {
            cell.textLabel.text = @"TextField_SearchBar_DIY";
        }
            break;
            
        default:
            break;
    }    
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    int type = indexPath.row;
    switch (type) {
        case SearchBar_Systematic:
        {
            
        }
            break;
        case SearchBar_DIY:
        {
            
        }
            break;
        case TextField_SearchBar_Systematic:
        {
            AJTextFieldSearchBarVC* vc = [[AJTextFieldSearchBarVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case TextField_SearchBar_DIY:
        {
            
        }
            break;
            
        default:
            break;
    }

}

#pragma mark -- Memory Manage

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
