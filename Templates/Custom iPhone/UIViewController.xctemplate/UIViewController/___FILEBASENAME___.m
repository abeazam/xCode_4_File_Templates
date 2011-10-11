//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"
#import <objc/runtime.h>

#pragma mark - private methods and properties 
@interface ___FILEBASENAMEASIDENTIFIER___()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - properties and release

//@synthesize

- (void)dealloc 
{
	//add here
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - init

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - log and output support
//this will automatically create a description
//based on the properties
- (NSString*) description
{
    unsigned int propCount, i;
    //gets a list of all properties in the 
    //created in this class and the property count
    objc_property_t *properties = class_copyPropertyList([self class], &propCount);
    
    //used to hold all the properties
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:propCount];
    
    for(i = 0; i < propCount; i++) 
	{
        //extracts a single property
        objc_property_t property = properties[i];
        //gets the property name
        const char *propName = property_getName(property);
        
        //checks to make sure there is a name
        if(propName) 
		{
            //converts the name to a usable object
            NSString *propertyName = [NSString stringWithCString:propName encoding:NSNonLossyASCIIStringEncoding];
            //adds it to a list of keys
            [keys addObject:propertyName];
        }
    }
    //frees the properties
    free(properties);
    
    //attempt to simulate the dictionary log by using the %p to get the memory address
    //the last %@ is used for all the items added to the dictionary 
    return [NSString stringWithFormat:@"<%@: %p; %@>", NSStringFromClass([self class]), self, [self dictionaryWithValuesForKeys:keys]];
}
@end
