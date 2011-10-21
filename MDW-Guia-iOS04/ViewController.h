//
//  ViewController.h
//  MDW-Guia-iOS04
//
//  Created by Javier Cala Uribe on 19/10/11.
//  Copyright (c) 2011 *. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> 
{
    UIImageView *imagenView;
    UIButton    *abrirGaleria;
    UIButton    *tomarFoto;
}

@property (nonatomic, retain) IBOutlet UIImageView *imagenView;
@property (nonatomic, retain) IBOutlet UIButton *abrirGaleria;
@property (nonatomic, retain) IBOutlet UIButton *tomarFoto;

- (IBAction)abrirGaleria:(id)sender;
- (IBAction)tomarFoto:(id)sender;

@end