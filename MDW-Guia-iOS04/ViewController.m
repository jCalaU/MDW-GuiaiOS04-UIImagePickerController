//
//  ViewController.m
//  MDW-Guia-iOS04
//
//  Created by Javier Cala Uribe on 19/10/11.
//  Copyright (c) 2011 *. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize imagenView, abrirGaleria, tomarFoto;

- (IBAction)abrirGaleria:(id)sender
{
	// Inicia el Controlador
	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	// Define el Delegate
	picker.delegate = self;
	// Establece el origen de la imagen
	picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	// Agrega la vista del controlador a la pantalla
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) 
    {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        [picker release];
        [popover presentPopoverFromRect:CGRectMake(200, 940.0, 0.0, 0.0) 
                                 inView:self.view
               permittedArrowDirections:UIPopoverArrowDirectionAny 
                               animated:YES];
    }
    else
        [self presentModalViewController:picker animated:YES];	
}

- (IBAction)tomarFoto:(id)sender
{
	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;	
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;	
	[self presentModalViewController:picker animated:YES];	
}

// Recibe el mensaje cuando el controlador a finalizado
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	// Quita la vista del controlador 
	[picker dismissModalViewControllerAnimated:YES];
	// Establece la imagen tomada en el objeto UIImageView
	imagenView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

- (void)dealloc 
{
	[imagenView release];
	[abrirGaleria release];
	[tomarFoto release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
