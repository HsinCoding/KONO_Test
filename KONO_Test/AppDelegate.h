//
//  AppDelegate.h
//  KONO_Test
//
//  Created by CI-Starly.Chen on 2019/9/24.
//  Copyright © 2019 CI-Starly.Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

