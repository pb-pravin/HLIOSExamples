//
//  CollapsableTableView.m
//  CollapsableTableView
//
//  Created by Bernhard Häussermann on 2011/03/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "CollapsableTableView.h"
#import "CollapsableTableViewHeaderViewController.h"
#import "CollapsableTableViewFooterViewController.h"

#define BUSY_INDICATOR_DELAY 0.5


@implementation CollapsableTableView

@synthesize collapsableTableViewDelegate,collapsedIndicator,expandedIndicator,showBusyIndicator,sectionsInitiallyCollapsed;

#pragma mark -
#pragma mark Properties

- (void) setDelegate:(id <UITableViewDelegate>) newDelegate
{
    [super setDelegate:self];
    realDelegate = newDelegate;
}

- (void) setDataSource:(id <UITableViewDataSource>) newDataSource
{
    [super setDataSource:self];
    realDataSource = newDataSource;
}


#pragma mark -
#pragma mark Initialization

- (void) postInit
{
    toggledSection = -1;
    headerTitleToIsCollapsedMap = [[NSMutableDictionary alloc] init];
    headerTitleToSectionIdxMap = [[NSMutableDictionary alloc] init];
    sectionIdxToHeaderTitleMap = [[NSMutableDictionary alloc] init];
    heightOfShortestCellSeen = 35;
    temporaryRowCountOverrideSectionIdx = -1;
    collapsedIndicator = [[NSString alloc] initWithString:@"+"];
    expandedIndicator = [[NSString alloc] initWithString:@"–"];
    showBusyIndicator = YES;
    sectionsInitiallyCollapsed = NO;
}

- (id) init
{
    if ((self = [super init]))
        [self postInit];
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
        [self postInit];
    return self;
}

- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if ((self = [super initWithFrame:frame style:style]))
        [self postInit];
    return self;
}

- (id) initWithFrame:(CGRect)frame
{
    return self = [super initWithFrame:frame];
}


#pragma mark -
#pragma mark Deallocation

- (void) dealloc
{
    self.collapsedIndicator = self.expandedIndicator = nil;
    [headerTitleToIsCollapsedMap release];
    [headerTitleToSectionIdxMap release];
    [sectionIdxToHeaderTitleMap release];
    [headerHeightArray release];
    [footerHeightArray release];
    
    [super dealloc];
}


#pragma mark -
#pragma mark Miscellaneous methods

- (void)reinitializeSectionIndexReferences
{
    [headerHeightArray removeAllObjects];
    [footerHeightArray removeAllObjects];
    [sectionIdxToHeaderTitleMap removeAllObjects];
    [headerTitleToSectionIdxMap removeAllObjects];
    for (NSInteger sectionIdx=0; sectionIdx<[self numberOfSectionsInTableView:self]; sectionIdx++)
    {
        NSString* headerTitle = [realDataSource respondsToSelector:@selector(tableView:titleForHeaderInSection:)] ? [realDataSource tableView:self titleForHeaderInSection:sectionIdx] : nil;
        if (! headerTitle)
        {
            if (! [realDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)])
                continue;
            int tag =  [realDelegate tableView:self viewForHeaderInSection:sectionIdx].tag;
            if ((! tag) && (sectionIdx))
                tag = sectionIdx;
            headerTitle = [NSString stringWithFormat:@"Tag %i",tag];
        }
        NSNumber* sectionIdxNumber = [[NSNumber alloc] initWithInt:sectionIdx];
        [sectionIdxToHeaderTitleMap setObject:headerTitle forKey:sectionIdxNumber];
        [headerTitleToSectionIdxMap setObject:sectionIdxNumber forKey:headerTitle];
        [sectionIdxNumber release];
    }
}

- (void) setCollapsedIndicatorOnView:(UIView*) view ofSection:(int) sectionIdx isCollapsed:(BOOL) isCollapsed
{
    UIView* subview = [view viewWithTag:COLLAPSED_INDICATOR_LABEL_TAG];
    if ((subview) && ([subview.class isSubclassOfClass:[UILabel class]]))
    {
        UILabel* collapsedIndicatorLabel = (UILabel*) subview;
        if ([realDataSource tableView:self numberOfRowsInSection:sectionIdx])
            collapsedIndicatorLabel.text = isCollapsed ? collapsedIndicator : expandedIndicator;
        else
            collapsedIndicatorLabel.text = @"";
    }
}


- (void) toggleSectionCollapsedForTitle:(NSString*) headerTitle headerView:(UIView*) view
{
    [self toggleSectionCollapsedForTitle:headerTitle headerView:view withRowAnimation:UITableViewRowAnimationFade];
}

- (void) toggleSectionCollapsedForTitle:(NSString*) headerTitle headerView:(UIView*) view withRowAnimation:(UITableViewRowAnimation) rowAnimation
{
    int sectionIdx = [[headerTitleToSectionIdxMap objectForKey:headerTitle] intValue];
    if (view)
    {
        if ([realDataSource tableView:self numberOfRowsInSection:sectionIdx])
        {
            toggledSectionHeaderView = view;
            if (showBusyIndicator)
                [self performSelector:@selector(showBusyIndicatorForView:) withObject:view afterDelay:BUSY_INDICATOR_DELAY];
        }
        else
            return;
    }
    else
    {
        toggledSection = sectionIdx;
        [self reloadSections:[NSIndexSet indexSetWithIndex:sectionIdx] withRowAnimation:UITableViewRowAnimationNone];
        toggledSection = -1;
    }
    
    BOOL isCollapsed = ! [[headerTitleToIsCollapsedMap objectForKey:headerTitle] boolValue];
    [headerTitleToIsCollapsedMap setObject:[NSNumber numberWithBool:isCollapsed] forKey:headerTitle];
    
    if (collapsableTableViewDelegate)
    {
        if (isCollapsed)
        {
            if ([collapsableTableViewDelegate respondsToSelector:@selector(collapsableTableView:willCollapseSection:title:headerView:)])
                [collapsableTableViewDelegate collapsableTableView:self willCollapseSection:sectionIdx title:headerTitle headerView:view];
        }
        else
        {
            if ([collapsableTableViewDelegate respondsToSelector:@selector(collapsableTableView:willExpandSection:title:headerView:)])
                [collapsableTableViewDelegate collapsableTableView:self willExpandSection:sectionIdx title:headerTitle headerView:view];
        }
    }
    
    // Insert/delete rows in background thread so that the busy-indicator can start spinning.
    [self performSelectorInBackground:@selector(insertDeleteRows:) withObject:[NSDictionary dictionaryWithObjectsAndKeys:headerTitle,@"headerTitle",[NSNumber numberWithInt:sectionIdx],@"sectionIdx",[NSNumber numberWithBool:isCollapsed],@"isCollapsed",[NSNumber numberWithInt:rowAnimation],@"rowAnimation",view,@"headerView",nil]];
}

- (void) showBusyIndicatorForView:(UIView*) view
{
    if (view==toggledSectionHeaderView)
    {
        UIView* subview = [view viewWithTag:BUSY_INDICATOR_TAG];
        if ((subview) && ([subview.class isSubclassOfClass:[UIActivityIndicatorView class]]))
            [(UIActivityIndicatorView*) subview startAnimating];
    }
}

- (void) insertDeleteRows:(NSDictionary*) params
{
    int sectionIdx = [[params objectForKey:@"sectionIdx"] intValue];
    int rowCount = [realDataSource tableView:self numberOfRowsInSection:sectionIdx];
    BOOL isCollapsed = [[params objectForKey:@"isCollapsed"] boolValue];
    // For insert-rows optimization.
    int rowsLeftOut = 0;
    if (! isCollapsed)
    {
        int maximumVisibleRowEstimate = (int) ceil(self.frame.size.height / heightOfShortestCellSeen);
        if (rowCount>maximumVisibleRowEstimate)
        {
            rowsLeftOut = rowCount - maximumVisibleRowEstimate;
            temporaryRowCountOverride = rowCount = maximumVisibleRowEstimate;
            temporaryRowCountOverrideSectionIdx = sectionIdx;
        }
    }
    
    UITableViewRowAnimation rowAnimation = [[params objectForKey:@"rowAnimation"] intValue];
    NSMutableArray* indexPaths = [[NSMutableArray alloc] initWithCapacity:rowCount];
    for (int i=0; i<rowCount; i++)
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:sectionIdx]];
    if (isCollapsed)
        [super deleteRowsAtIndexPaths:indexPaths withRowAnimation:rowAnimation];
    else
    {
        [super insertRowsAtIndexPaths:indexPaths withRowAnimation:rowAnimation];
        if ((sectionIdx==[realDataSource numberOfSectionsInTableView:self] - 1) && (rowCount!=0))
            [self performSelectorOnMainThread:@selector(scrollToRowAtIndexPath:) withObject:[NSIndexPath indexPathForRow:MIN(rowCount - 1,4) inSection:sectionIdx] waitUntilDone:NO];
    }
    [indexPaths release];
    if (rowAnimation==UITableViewRowAnimationNone)
        [self performSelectorOnMainThread:@selector(finalizeSectionToggle:) withObject:params waitUntilDone:NO];
    else
    {
        // Run in a different thread so that this thread can finish the row animation in the meantime.
        [self performSelectorInBackground:@selector(waitForAnimationToFinishAndFinalizeSectionToggle:) withObject:params];
    }
}

- (void) scrollToRowAtIndexPath:(NSIndexPath*) indexPath
{
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) waitForAnimationToFinishAndFinalizeSectionToggle:(NSDictionary*) params
{
    usleep(300000);
    [self performSelectorOnMainThread:@selector(finalizeSectionToggle:) withObject:params waitUntilDone:NO];
}

- (void) finalizeSectionToggle:(NSDictionary*) params
{
    if (temporaryRowCountOverrideSectionIdx!=-1)
    {
        // Insert-rows optimization (see http://stackoverflow.com/questions/6077885/insertrowsatindexpaths-calling-cellforrowatindexpath-for-every-row
        // for more info; specifically, the topmost answer to the question).
        int rowCount = [realDataSource tableView:self numberOfRowsInSection:temporaryRowCountOverrideSectionIdx];
        NSMutableArray* indexPaths = [[NSMutableArray alloc] initWithCapacity:rowCount - temporaryRowCountOverride];
        for (int i=temporaryRowCountOverride; i<rowCount; i++)
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:temporaryRowCountOverrideSectionIdx]];
        temporaryRowCountOverrideSectionIdx = -1;
        [super insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
        [indexPaths release];
    }
    
    toggledSectionHeaderView = nil;
    UIView* headerView = [params objectForKey:@"headerView"];
    BOOL isCollapsed = [[params objectForKey:@"isCollapsed"] boolValue];
    int sectionIdx = [[params objectForKey:@"sectionIdx"] intValue];
    if (collapsableTableViewDelegate)
    {
        NSString* headerTitle = [params objectForKey:@"headerTitle"];
        if (isCollapsed)
        {
            if ([collapsableTableViewDelegate respondsToSelector:@selector(collapsableTableView:didCollapseSection:title:headerView:)])
                [collapsableTableViewDelegate collapsableTableView:self didCollapseSection:sectionIdx title:headerTitle headerView:headerView];
        }
        else
        {
            if ([collapsableTableViewDelegate respondsToSelector:@selector(collapsableTableView:didExpandSection:title:headerView:)])
                [collapsableTableViewDelegate collapsableTableView:self didExpandSection:sectionIdx title:headerTitle headerView:headerView];
        }
    }
    if (showBusyIndicator)
    {
        UIView* subview = [headerView viewWithTag:BUSY_INDICATOR_TAG];
        if ((subview) && ([subview.class isSubclassOfClass:[UIActivityIndicatorView class]]))
            [(UIActivityIndicatorView*) subview stopAnimating];
    }
    [self setCollapsedIndicatorOnView:headerView ofSection:sectionIdx isCollapsed:isCollapsed];
}


- (NSDictionary*) headerTitleToIsCollapsedMap
{
    return [NSDictionary dictionaryWithDictionary:headerTitleToIsCollapsedMap];
}

+ (void) setTextOnCollapsableTableViewHeaderViewController:(CollapsableTableViewHeaderViewController*) headerViewController forHeaderTitle:(NSString*) headerTitle
{
    headerViewController.fullTitle = headerTitle;
    NSRange barRange = [headerTitle rangeOfString:@"|"];
    if (barRange.location==NSNotFound)
        headerViewController.titleText = headerTitle;
    else
    {
        headerViewController.titleText = [headerTitle substringToIndex:barRange.location];
        headerViewController.detailText = [headerTitle substringFromIndex:barRange.location + barRange.length];
    }
}

- (NSString*) getHeaderViewNibName
{
    return self.style==UITableViewStylePlain ? @"CollapsableTableViewHeaderViewPlain" : @"CollapsableTableViewHeaderViewGrouped";
}

- (NSString*) getFooterViewNibName
{
    return self.style==UITableViewStylePlain ? @"CollapsableTableViewFooterViewPlain" : @"CollapsableTableViewFooterViewGrouped";
}

- (void) setIsCollapsed:(BOOL) isCollapsed forHeaderWithTitle:(NSString*) headerTitle andView:(UIView*) headerView withRowAnimation:(UITableViewRowAnimation) rowAnimation;
{
    NSNumber* isCollapsedNumber = [headerTitleToIsCollapsedMap objectForKey:headerTitle];
    if (isCollapsedNumber)
    {
        if (isCollapsed!=[isCollapsedNumber boolValue])
            [self toggleSectionCollapsedForTitle:headerTitle headerView:headerView withRowAnimation:rowAnimation];
    }
    else
    {
        [headerTitleToIsCollapsedMap setObject:[NSNumber numberWithBool:isCollapsed] forKey:headerTitle];
        if ([headerTitleToSectionIdxMap objectForKey:headerTitle])
        {
            [self reinitializeSectionIndexReferences];
            [self reloadSections:[NSIndexSet indexSetWithIndex:[[headerTitleToSectionIdxMap objectForKey:headerTitle] intValue]] withRowAnimation:rowAnimation];
        }
    }
}

- (void) setIsCollapsed:(BOOL) isCollapsed forHeaderWithTitle:(NSString*) headerTitle withRowAnimation:(UITableViewRowAnimation) rowAnimation
{
    [self setIsCollapsed:isCollapsed forHeaderWithTitle:headerTitle andView:nil withRowAnimation:rowAnimation];
}

- (void) setIsCollapsed:(BOOL) isCollapsed forHeaderWithTitle:(NSString*) headerTitle andView:(UIView*) headerView
{
    [self setIsCollapsed:isCollapsed forHeaderWithTitle:headerTitle andView:headerView withRowAnimation:UITableViewRowAnimationFade];
}

- (void) setIsCollapsed:(BOOL) isCollapsed forHeaderWithTitle:(NSString*) headerTitle
{
    [self setIsCollapsed:isCollapsed forHeaderWithTitle:headerTitle andView:nil];
}


- (void)endUpdates
{
    [self reinitializeSectionIndexReferences];
    [super endUpdates];
}


- (void)reloadData
{
    [self reinitializeSectionIndexReferences];
    [super reloadData];
}


- (NSMutableArray*) extractValidIndexPaths:(NSArray*) indexPaths
{
    NSMutableArray* newIndexPaths = [NSMutableArray arrayWithCapacity:indexPaths.count];
    for (NSIndexPath* nextIndexPath in indexPaths)
        if (! [[headerTitleToIsCollapsedMap objectForKey:[sectionIdxToHeaderTitleMap objectForKey:[NSNumber numberWithInt:nextIndexPath.section]]] boolValue])
            [newIndexPaths addObject:nextIndexPath];
    return newIndexPaths;
}

- (void) deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray* newIndexPaths = [self extractValidIndexPaths:indexPaths];
    if (newIndexPaths.count)
        [super deleteRowsAtIndexPaths:newIndexPaths withRowAnimation:animation];
}

- (void) insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray* newIndexPaths = [self extractValidIndexPaths:indexPaths];
    if (newIndexPaths.count)
        [super insertRowsAtIndexPaths:newIndexPaths withRowAnimation:animation];
}

- (void) reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray* newIndexPaths = [self extractValidIndexPaths:indexPaths];
    if (newIndexPaths.count)
        [super reloadRowsAtIndexPaths:newIndexPaths withRowAnimation:animation];
}


- (void) scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    NSString* headerTitle = [sectionIdxToHeaderTitleMap objectForKey:[NSNumber numberWithInt:indexPath.section]];
    if ([[headerTitleToIsCollapsedMap objectForKey:headerTitle] boolValue])
        [self toggleSectionCollapsedForTitle:headerTitle headerView:nil];
    [super scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void) selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition
{
    NSString* headerTitle = [sectionIdxToHeaderTitleMap objectForKey:[NSNumber numberWithInt:indexPath.section]];
    if ([[headerTitleToIsCollapsedMap objectForKey:headerTitle] boolValue])
        [self toggleSectionCollapsedForTitle:headerTitle headerView:nil];
    [super selectRowAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}

- (void) deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated
{
    NSString* headerTitle = [sectionIdxToHeaderTitleMap objectForKey:[NSNumber numberWithInt:indexPath.section]];
    if ([[headerTitleToIsCollapsedMap objectForKey:headerTitle] boolValue])
        [self toggleSectionCollapsedForTitle:headerTitle headerView:nil];
    [super deselectRowAtIndexPath:indexPath animated:animated];
}

#pragma mark -
#pragma mark TapDelegate methods

- (void) view:(UIView*) view tappedWithIdentifier:(NSString*) identifier;
{
    [self toggleSectionCollapsedForTitle:identifier headerView:view];
}


#pragma mark -
#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)])
        [realDelegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([realDelegate respondsToSelector:@selector(tableView:willDisplayHeaderView:forSection:)])
        [realDelegate tableView:tableView willDisplayHeaderView:view forSection:section];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    if ([realDelegate respondsToSelector:@selector(tableView:willDisplayFooterView:forSection:)])
        [realDelegate tableView:tableView willDisplayHeaderView:view forSection:section];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:)])
        [realDelegate tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([realDelegate respondsToSelector:@selector(tableView:didEndDisplayingHeaderView:forSection:)])
        [realDelegate tableView:tableView didEndDisplayingHeaderView:view forSection:section];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{
    if ([realDelegate respondsToSelector:@selector(tableView:didEndDisplayingFooterView:forSection:)])
        [realDelegate tableView:tableView didEndDisplayingFooterView:view forSection:section];
}

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
        return [realDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    return tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([realDelegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)])
        return [realDelegate tableView:tableView heightForHeaderInSection:section];
    if (! headerHeightArray)
        headerHeightArray = [[NSMutableArray alloc] initWithCapacity:[self numberOfSectionsInTableView:tableView] + 5];
    while (headerHeightArray.count<=section)
        [self tableView:tableView viewForHeaderInSection:headerHeightArray.count];
    return [[headerHeightArray objectAtIndex:section] intValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([realDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)])
        return [realDelegate tableView:tableView heightForFooterInSection:section];
    if (! footerHeightArray)
        footerHeightArray = [[NSMutableArray alloc] initWithCapacity:[self numberOfSectionsInTableView:tableView] + 5];
    while (footerHeightArray.count<=section)
        [self tableView:tableView viewForFooterInSection:footerHeightArray.count];
    return [[footerHeightArray objectAtIndex:section] intValue];
}

- (void) cacheIntValue:(int) intValue forSection:(int) section inCacheArray:(NSMutableArray*) cacheArray
{
    NSNumber* valueNumber = [[NSNumber alloc] initWithInt:intValue];
    while (cacheArray.count<section)
        [cacheArray addObject:valueNumber];
    if (cacheArray.count==section)
        [cacheArray addObject:valueNumber];
    else
        [cacheArray replaceObjectAtIndex:section withObject:valueNumber];
    [valueNumber release];
}

- (void) cacheHeaderHeight:(int) headerHeight forHeaderOfSection:(int) section
{
    [self cacheIntValue:headerHeight forSection:section inCacheArray:headerHeightArray];
}

- (void) cacheFooterHeight:(int) footerHeight forFooterOfSection:(int) section
{
    [self cacheIntValue:footerHeight forSection:section inCacheArray:footerHeightArray];
}

// Section header & footer information. Views are preferred over title should you decide to provide both

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString* headerTitle = nil;
    CollapsableTableViewHeaderViewController* headerViewController = [[[CollapsableTableViewHeaderViewController alloc] initWithNibName:[self getHeaderViewNibName] bundle:nil] autorelease];
    headerViewController.tapDelegate = self;
    if ([realDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)])
    {
        UIView* theView = [realDelegate tableView:tableView viewForHeaderInSection:section];
        if (theView)
        {
            if ((! theView.tag) && (section))
                theView.tag = section;
            headerViewController.fullTitle = headerTitle = [NSString stringWithFormat:@"Tag %i",theView.tag];
            headerViewController.view = theView;
        }
    }
    if (! headerTitle)
    {
        if ([realDataSource respondsToSelector:@selector(tableView:titleForHeaderInSection:)])
            headerTitle = [realDataSource tableView:tableView titleForHeaderInSection:section];
        if (! headerTitle)
        {
            [self cacheHeaderHeight:0 forHeaderOfSection:section];
            return nil;
        }
        [headerViewController loadView];
        CGRect frame = headerViewController.view.frame;
        frame.size.width = tableView.frame.size.width;
        headerViewController.view.frame = frame;
        [CollapsableTableView setTextOnCollapsableTableViewHeaderViewController:headerViewController forHeaderTitle:headerTitle];
    }
    
    NSNumber* isCollapsedNumber = [headerTitleToIsCollapsedMap objectForKey:headerTitle];
    BOOL isCollapsed;
    if (isCollapsedNumber)
    {
        isCollapsed = toggledSection==section ? ! [isCollapsedNumber boolValue] : [isCollapsedNumber boolValue];
        headerViewController.isCollapsed = isCollapsed;
    }
    else
    {
        isCollapsed = sectionsInitiallyCollapsed;
        [headerTitleToIsCollapsedMap setObject:[NSNumber numberWithBool:isCollapsed] forKey:headerTitle];
    }
    [self setCollapsedIndicatorOnView:headerViewController.view ofSection:section isCollapsed:isCollapsed];
    
    NSNumber* sectionNumber = [[NSNumber alloc] initWithInt:section];
    [sectionIdxToHeaderTitleMap setObject:headerTitle forKey:sectionNumber];
    [headerTitleToSectionIdxMap setObject:sectionNumber forKey:headerTitle];
    [sectionNumber release];
    
    [self cacheHeaderHeight:(int) headerViewController.view.frame.size.height forHeaderOfSection:section];
    
    return headerViewController.view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height
{
    UIView* theView = [realDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)] ? [realDelegate tableView:tableView viewForFooterInSection:section] : nil;
    if (! theView)
    {
        NSString* footerTitle = [realDataSource respondsToSelector:@selector(tableView:titleForFooterInSection:)] ? [realDataSource tableView:tableView titleForFooterInSection:section] : nil;
        if (! footerTitle)
        {
            [self cacheFooterHeight:0 forFooterOfSection:section];
            return nil;
        }
        CollapsableTableViewFooterViewController* footerViewController = [[[CollapsableTableViewFooterViewController alloc] initWithNibName:[self getFooterViewNibName] bundle:nil] autorelease];
        [footerViewController loadView];
        CGRect frame = footerViewController.view.frame;
        frame.size.width = tableView.frame.size.width;
        footerViewController.view.frame = frame;
        footerViewController.titleText = footerTitle;
        theView = footerViewController.view;
    }
    
    NSNumber* heightNumber = [[NSNumber alloc] initWithInt:(int) theView.frame.size.height];
    while (footerHeightArray.count<section)
        [footerHeightArray addObject:heightNumber];
    if (footerHeightArray.count==section)
        [footerHeightArray addObject:heightNumber];
    else
        [footerHeightArray replaceObjectAtIndex:section withObject:heightNumber];
    [heightNumber release];
    
    [self cacheFooterHeight:(int) theView.frame.size.height forFooterOfSection:section];
    
    return theView;
}

// Accessories (disclosures).

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:accessoryButtonTappedForRowWithIndexPath:)])
        [realDelegate tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}

// Selection

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)])
        return [realDelegate tableView:tableView willSelectRowAtIndexPath:indexPath];
    return indexPath;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
        [realDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
}

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:editingStyleForRowAtIndexPath:)])
        return [realDelegate tableView:tableView editingStyleForRowAtIndexPath:indexPath];
    return UITableViewCellEditingStyleDelete;
}

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:shouldIndentWhileEditingRowAtIndexPath:)])
        return [realDelegate tableView:tableView shouldIndentWhileEditingRowAtIndexPath:indexPath];
    return YES;
}

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:willBeginEditingRowAtIndexPath:)])
        [realDelegate tableView:tableView willBeginEditingRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:didEndEditingRowAtIndexPath:)])
        [realDelegate tableView:tableView didEndEditingRowAtIndexPath:indexPath];
}

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:)])
        return [realDelegate tableView:tableView targetIndexPathForMoveFromRowAtIndexPath:sourceIndexPath toProposedIndexPath:proposedDestinationIndexPath];
    return proposedDestinationIndexPath;
}

// Indentation

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDelegate respondsToSelector:@selector(tableView:indentationLevelForRowAtIndexPath:)])
        return [realDelegate tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    return 0;
}


#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (temporaryRowCountOverrideSectionIdx==section)
        return temporaryRowCountOverride;
    return [[headerTitleToIsCollapsedMap objectForKey:[sectionIdxToHeaderTitleMap objectForKey:[NSNumber numberWithInt:section]]] boolValue] ? 0 : [realDataSource tableView:tableView numberOfRowsInSection:section];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [realDataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    if (cell.frame.size.height<heightOfShortestCellSeen)
        heightOfShortestCellSeen = (int) cell.frame.size.height;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int sectionCount = [realDataSource respondsToSelector:@selector(numberOfSectionsInTableView:)] ? [realDataSource numberOfSectionsInTableView:tableView] : 1;
    if (headerHeightArray)
    {
        while (headerHeightArray.count>sectionCount)
            [headerHeightArray removeLastObject];
    }
    return sectionCount;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)])
        return [realDataSource tableView:tableView canEditRowAtIndexPath:indexPath];
    return YES;
}

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDataSource respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:)])
        return [realDataSource tableView:tableView canMoveRowAtIndexPath:indexPath];
    return [realDataSource respondsToSelector:@selector(tableView:moveRowAtIndexPath:)];
}

// Index

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if ([realDataSource respondsToSelector:@selector(sectionIndexTitlesForTableView:)])
        return [realDataSource sectionIndexTitlesForTableView:tableView];
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [realDataSource tableView:tableView sectionForSectionIndexTitle:title atIndex:index];
}

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([realDataSource respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)])
        [realDataSource tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}

// Data manipulation - reorder / moving support

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if ([realDataSource respondsToSelector:@selector(tableView:moveRowAtIndexPath:toIndexPath:)])
        [realDataSource tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

@end
