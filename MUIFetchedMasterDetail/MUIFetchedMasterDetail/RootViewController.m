//
//  RootViewController.m
//  MUIFetchedMasterDetail
//
//  Created by Malcolm Hall on 13/09/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import "RootViewController.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController
//@dynamic fetchedResultsController;

//- (NSManagedObjectContext *)managedObjectContext{
//    NSPersistentContainer *pc = [self mcd_persistentContainerWithSender:self];
//    return pc.viewContext;
//}

- (IBAction)pauseTapped:(id)sender{
    self.fetchedResultsController.delegate = nil;
}

- (IBAction)playTapped:(id)sender{
//    self.fetchedResultsController.delegate = self;
//    [self.fetchedResultsController performFetch:nil];
//    [self.tableView reloadData];
    //id i = self.fetchedResultsController;
   // [self.persistentContainer.viewContext save:nil];
}

- (IBAction)refreshTapped:(id)sender{
//    NSManagedObjectContext *moc = self.persistentContainer.viewContext;//self.persistentContainer.newBackgroundContext;
//    NSManagedObject *object =  nil;//[moc objectWithID:self.fetchedResultsController.fetchedObjects.firstObject.objectID];
//    [moc deleteObject:object];
//    [moc save:nil];
}

- (IBAction)deleteVenue:(MUICompletionStoryboardSegue *)unwindSegue {
//    Venue *venue;
//    if([unwindSegue.sourceViewController isKindOfClass:DetailViewController.class]){
//        DetailViewController *detailViewController = unwindSegue.sourceViewController;
//        venue = detailViewController.detailItem.venue;
//    }
//    else if([unwindSegue.sourceViewController isKindOfClass:MasterViewController.class]){
//        MasterViewController *masterViewController = unwindSegue.sourceViewController;
//        venue = masterViewController.masterItem;
//    }
//    
//    // Use data from the view controller which initiated the unwind segue
//    [unwindSegue setCompletion:^{
//        [self.managedObjectContext deleteObject:venue];
//        [self.managedObjectContext save:nil];
//    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSAssert(self.persistentContainer, @"This view needs a persistent container.");
    // Do any additional setup after loading the view.
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(navigationControllerDidShowViewController:) name:MUINavigationControllerDidShowViewControllerNotification object:self.navigationController];
 //   [self createFetchedResultsController];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated{
    //self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
    
}

- (void)configureView{
 //   self.title = [NSString stringWithFormat:@"%ld Venues", self.fetchedResultsController.fetchedObjects.count];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
  //  [self updateMasterViewController];
}

//- (void)updateMaster{
//    if(![self.fetchedResultsController indexPathForObject:self.masterViewController.masterItem]){
//        [self.navigationController popToViewController:self animated:YES];
//    }
//}


- (IBAction)insertNewObject:(id)sender {
    NSManagedObjectContext *context =   self.managedObjectContext; // self.persistentContainer.newBackgroundContext;
    Venue *newObject = [Venue.alloc initWithContext:context]; // self.fetchedResultsController.fetchedObjects.lastObject ;//
        
    // If appropriate, configure the new managed object.
    newObject.timestamp = [NSDate date];
        
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
//    if(self.detailViewController){
//        self.objectToShow = newEvent;
//        [self performSegueWithIdentifier:@"showDetail" sender:self];
//        [self configureView];
//    }
}

#pragma mark - Table View

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    if([self.tableDataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]){
    //        return [self.tableDataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    //    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.opaque = NO;
    cell.textLabel.backgroundColor = UIColor.clearColor;
    //if(!cell.selectedBackgroundView){
//        UIView *v = [UIView.alloc init];
//        v.backgroundColor = v.tintColor;
//        cell.selectedBackgroundView = v;
//    }
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(NSManagedObject *)object{
    Venue *venue = (Venue *)object;
    id i = venue.timestamp;
    id a = venue.managedObjectContext;
    cell.textLabel.text = venue.timestamp.description;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld Events", venue.events.count];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"show"]){
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        Venue *venue = [self.fetchedResultsController objectAtIndexPath:self.tableView.indexPathForSelectedRow];
        MasterViewController *mvc = segue.destinationViewController;
        //mvc.persistentContainer = self.persistentContainer;
        mvc.masterItem = venue;
      //  mvc.selectedObject = [self mui_currentVisibleDetailItemWithSender:self];
        //mvc.detailViewController = self.masterViewController.detailViewController;
        //mvc.selectedObject = self.masterViewController.detailViewController.detailItem;
        
        //mvc.detailViewControllerDetailItem = self.masterViewController.detailViewControllerDetailItem;
        //mvc.restorationClass = self.class;
        
    //    if(self.splitViewController.viewControllers.count == 2){
    //        mvc.selectedObject = ((DetailViewController *)self.splitViewController.viewControllers.lastObject.childViewControllers.firstObject).detailItem;
    // }
  //      self.masterViewController = mvc;
    }
}

//- (void)setMasterViewController:(MasterViewController *)masterViewController{
//    if(masterViewController == _masterViewController){
//        return;
//    }
//    else if(_masterViewController.parentViewController == self){
//        [_masterViewController removeFromParentViewController];
//    }
//    _masterViewController = masterViewController;
//    id i = masterViewController.parentViewController;
//    [self updateMasterViewController];
//}

//- (void)updateMasterViewController{
//    if(!self.masterViewController){
//        return;
//    }
//    else if(self.masterViewController.parentViewController){
//        return;
//    }
//    [self addChildViewController:self.masterViewController];
//}

//- (void)navigationControllerDidShowViewController:(NSNotification *)notification{
//    NSDictionary *userInfo = notification.userInfo;
//    if(userInfo[MUINavigationControllerNextVisibleViewController] != self){
//        return;
//    }
//    else if(!self.masterViewController){
//        return;
//    }
//    if(userInfo[MUINavigationControllerLastVisibleViewController] != self.masterViewController){
//        return;
//    }
//}


- (NSFetchedResultsController<Venue *> *)fetchedResultsController {
    NSAssert(self.managedObjectContext, @"fetchedResultsController called without managedObjectContext set");
    //return nil;
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
//- (void)createFetchedResultsController{
    NSFetchRequest<Venue *> *fetchRequest = Venue.fetchRequest;
  //  fetchRequest.predicate = [NSPredicate predicateWithFormat:@"timestamp = nil"];
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:NO];

    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    //fetchedResultsController.delegate = self;
    
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
     //   self.fetchedResultsController = aFetchedResultsController;
   
_fetchedResultsController = fetchedResultsController;
    return _fetchedResultsController;
//    self.fetchedResultsController = fetchedResultsController;
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [super controllerDidChangeContent:controller];
    [self configureView];
 //   [self updateMaster];
}

#pragma mark - UIStateRestoration

#define kMasterViewControllerKey @"MasterViewController"
//#define kManagedObjectContextKey @"ManagedObjectContext"


//#define kModelIdentifierForSelectedElementKey @"ModelIdentifierForSelectedElement"
//#define kSelectedMasterObjectKey @"kSelectedMasterObjectKey"

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
 //   [coder encodeObject:self.masterViewController forKey:kMasterViewControllerKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
//    self.masterViewController = [coder decodeObjectForKey:kMasterViewControllerKey]; // it doesnt have the detail item
}

- (void)applicationFinishedRestoringState{
   // [self.tableView layoutIfNeeded]; // fix going back unlight bu
   // [self reselectTableRowIfNecessary];
    
    // we need the master item to have been decoded
    // pop back if the master is no longer in the list.
    //[self updateMaster];
}

@end