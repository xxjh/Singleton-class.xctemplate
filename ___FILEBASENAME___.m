/*
 *	___FILENAME___
 *	___PROJECTNAME___
 *
 *	Created by ___FULLUSERNAME___ on ___DATE___.
 *	Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
 */

#import "___FILEBASENAME___.h"

#pragma mark -
#pragma mark Constants
#pragma mark -
//**********************************************************************************************************
//
//	Constants
//
//**********************************************************************************************************

#pragma mark -
#pragma mark Private Interface
#pragma mark -
//**********************************************************************************************************
//
//	Private Interface
//
//**********************************************************************************************************

#pragma mark -
#pragma mark Private Category
//**************************************************
//	Private Category
//**************************************************

@interface ___FILEBASENAMEASIDENTIFIER___()

// Make any initialization of your class.
- (id) initSingleton;

@end

#pragma mark -
#pragma mark Public Interface
#pragma mark -
//**********************************************************************************************************
//
//	Public Interface
//
//**********************************************************************************************************

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark -
#pragma mark Properties
//**************************************************
//	Properties
//**************************************************


#pragma mark -
#pragma mark Constructors
//**************************************************
//	Constructors
//**************************************************

- (id) initSingleton
{
	if ((self = [super init]))
	{
		// Initialization code here.
	}
	
	return self;
}

#pragma mark -
#pragma mark Private Methods
//**************************************************
//	Private Methods
//**************************************************

#pragma mark -
#pragma mark Self Public Methods
//**************************************************
//	Self Public Methods
//**************************************************

// Persistent instance.
static ___FILEBASENAMEASIDENTIFIER___ *_default = nil;

+ (___FILEBASENAMEASIDENTIFIER___ *) instance
{
	// Small optimization to avoid wasting time after the
	// singleton being initialized.
	if (_default != nil)
	{
		return _default;
	}
	
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
	// Allocates once with Grand Central Dispatch (GCD) routine.
	// It's thread safe.
	static dispatch_once_t safer;
	dispatch_once(&safer, ^(void)
				  {
					  _default = [[___FILEBASENAMEASIDENTIFIER___ alloc] initSingleton];
				  });
#else
	// Allocates once using the old approach, it's slower.
	// It's thread safe.
	@synchronized([___FILEBASENAMEASIDENTIFIER___ class])
	{
		// The synchronized instruction will make sure,
		// that only one thread will access this point at a time.
		if (_default == nil)
		{
			_default = [[___FILEBASENAMEASIDENTIFIER___ alloc] initSingleton];
		}
	}
#endif
	return _default;
}

- (oneway void)superRelease
{
    //release custom instance here
    
    [super release];
}

+ (void)releaseInstance
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
	// Allocates once with Grand Central Dispatch (GCD) routine.
	// It's thread safe.
	static dispatch_once_t safer;
	dispatch_once(&safer, ^(void)
				  {
                      [_default superRelease];
                      _default = nil;
				  });
#else
	// Allocates once using the old approach, it's slower.
	// It's thread safe.
	@synchronized([___FILEBASENAMEASIDENTIFIER___ class])
	{
		// The synchronized instruction will make sure,
		// that only one thread will access this point at a time.
		[_default superRelease];
        _default = nil;
	}
#endif
}

+ (id)allWithZone:(NSZone*)zone
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
	// Allocates once with Grand Central Dispatch (GCD) routine.
	// It's thread safe.
	static dispatch_once_t safer;
	dispatch_once(&safer, ^(void)
				  {
                      if (_default == nil) {
                          _default = [super allocWithZone:zone];
                          return _default;
                      }
				  });
#else
	// Allocates once using the old approach, it's slower.
	// It's thread safe.
	@synchronized([___FILEBASENAMEASIDENTIFIER___ class])
	{
		// The synchronized instruction will make sure,
		// that only one thread will access this point at a time.
		if (_default == nil) {
            _default = [super allocWithZone:zone];
            return _default;
        }
	}
#endif
    
    return nil; //on subsequent allocation attempts return nil
}

#pragma mark -
#pragma mark Override Public Methods
//**************************************************
//	Override Public Methods
//**************************************************

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}

- (id) retain
{
	return self;
}

- (oneway void) release
{
	// Does nothing here.
}

- (id) autorelease
{
	return self;
}

- (NSUInteger) retainCount
{
    return INT32_MAX;
}

@end
