Purpose
--------------

To add new more robust file templates to xCode

Installation
---------------

Copy the "Custom iPhone" folder to "/Users/{User Folder}/Library/Developer/" folder. Replace the {User Folder} with your user folder. 

You can then add a new file and you will see a new sub header call Custom iPhone select a type and away you go.

Content
---------------

NSObject Template 
UIViewController Template

I have added an interface to the m file because I normally need a private properties. As well as a commented out @synthesize to get started that little bit quicker.

I have added the dealloc to the top of the file since you will probably want to release most properties. I always find it best to keep them all together.
 

Extras
---------------

There are 2 extra function that find really useful.

"- (NSString*) description" method available in both templates
This will automatically log all properties in the class just by logging the instance name or "po instanceName" in the console. 

 
"+ (ObjectType *)sharedInstance" method available in the NSObject template only
This function will create a singleton that will only ever get instantiated just once in the application lifecycle. 
Simply uncomment this function and its reference in the header.

