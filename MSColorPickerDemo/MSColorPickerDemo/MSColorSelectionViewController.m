//
// MSViewController.m
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Maksym Shcheglov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MSColorSelectionViewController.h"
#import "MSColorSelectionView.h"

#import <MSColorPicker/MSColorPicker.h>

@interface MSColorSelectionViewController ()

@property (nonatomic, strong) MSColorSelectionView* colorSelectionView;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation MSColorSelectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colorSelectionView = [[MSColorSelectionView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.colorSelectionView];
    self.colorSelectionView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(_colorSelectionView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_colorSelectionView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_colorSelectionView]|" options:0 metrics:nil views:views]];


    [self.colorSelectionView setSelectedIndex:self.segmentedControl.selectedSegmentIndex animated:NO];
}

- (IBAction)segmentControlDidChangeValue:(UISegmentedControl *)sender
{
    [self.colorSelectionView setSelectedIndex:self.segmentedControl.selectedSegmentIndex animated:YES];
}

@end