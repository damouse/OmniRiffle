// Objective-C API for talking to github.com/exis-io/riffle Go package.
//   gobind -lang=objc github.com/exis-io/riffle
//
// File is generated by gobind. Do not edit.

#ifndef __GoRiffle_H__
#define __GoRiffle_H__

#include <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString* const GoRiffleACTION_SEPARATOR;
FOUNDATION_EXPORT NSString* const GoRiffleDOMAIN_SEPARATOR;
FOUNDATION_EXPORT NSString* const GoRiffleErrAuthorizationFailed;
FOUNDATION_EXPORT NSString* const GoRiffleErrCloseRealm;
FOUNDATION_EXPORT NSString* const GoRiffleErrDomainAlreadyExists;
FOUNDATION_EXPORT NSString* const GoRiffleErrGoodbyeAndOut;
FOUNDATION_EXPORT NSString* const GoRiffleErrInvalidArgument;
FOUNDATION_EXPORT NSString* const GoRiffleErrInvalidUri;
FOUNDATION_EXPORT NSString* const GoRiffleErrNoSuchDomain;
FOUNDATION_EXPORT NSString* const GoRiffleErrNoSuchRealm;
FOUNDATION_EXPORT NSString* const GoRiffleErrNoSuchRegistration;
FOUNDATION_EXPORT NSString* const GoRiffleErrNoSuchRole;
FOUNDATION_EXPORT NSString* const GoRiffleErrNoSuchSubscription;
FOUNDATION_EXPORT NSString* const GoRiffleErrNotAuthorized;
FOUNDATION_EXPORT NSString* const GoRiffleErrSystemShutdown;

FOUNDATION_EXPORT void GoRiffleLog();

FOUNDATION_EXPORT NSString* GoRiffleTester(NSString* name);

#endif
