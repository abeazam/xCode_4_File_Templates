//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"
#import <objc/runtime.h>

#pragma mark - private methods
@interface ___FILEBASENAMEASIDENTIFIER___()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___
#pragma mark - properties

//@synthesize

- (void)dealloc 
{
	//add here
    [super dealloc];
}

#pragma mark - init
- (___FILEBASENAMEASIDENTIFIER___ *)init
{
    if ((self = [super init])) 
	{
        // init code here
    }
    
    return self;
}

/*
#pragma mark - singleton 
+ (___FILEBASENAMEASIDENTIFIER___ *)___VARIABLE_sharedInstanceName___ 
{
	static ___FILEBASENAMEASIDENTIFIER___ *___VARIABLE_sharedInstanceName___ = nil;
    if (nil != ___VARIABLE_sharedInstanceName___) 
	{
        return ___VARIABLE_sharedInstanceName___;
    }

 	// This code will never run more than once in an app life cycle
    static dispatch_once_t predicate;        
    dispatch_once(&predicate, ^{             
        ___VARIABLE_sharedInstanceName___ = [[___FILEBASENAMEASIDENTIFIER___ alloc] init];
    });
 
    return ___VARIABLE_sharedInstanceName___;
}
*/

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
