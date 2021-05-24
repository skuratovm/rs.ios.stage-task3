#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray<NSNumber*>* rang = [NSMutableArray new];
        int currentLevel = 0;
        NSMutableArray<NSNumber*> *rotation = [NSMutableArray new];
        
    NSObject *obj = [NSObject new];
        for (obj in tree) {
            if (rotation.count == 0 || rotation.lastObject.boolValue) {
                
                if ([obj isKindOfClass:NSNull.class]){
                    [rotation removeLastObject];
                    [rotation addObject:@NO];
                }
                else
                {
                    [rang addObject:[NSNumber numberWithInt:currentLevel]];
                    currentLevel++;
                    [rotation addObject:@YES];
                }
            }
            else
            {
                if ([obj isKindOfClass:NSNull.class]){
                    while (!rotation.lastObject.boolValue) {
                        [rotation removeLastObject];
                        currentLevel--;
                    }
                    [rotation removeLastObject];
                    [rotation addObject:@NO];
                }
                else {
                    [rang addObject:[NSNumber numberWithInt:currentLevel]];
                    currentLevel++;
                    [rotation addObject:@YES];
                }
                
            }
        }
        if (rang.count == 0){
            return  @[];
        }
        
        int max = [[rang valueForKeyPath:@"@max.intValue"] intValue];
        NSMutableArray<NSMutableArray*>* result = [NSMutableArray new];
        for (int i = 0; i<= max; i++){
            [result addObject:[NSMutableArray new]];
        }
        int j = 0;
        for (int i = 0; i < tree.count; i++){
            if (![tree[i] isKindOfClass:NSNull.class]){
                [result[rang[j].intValue] addObject: tree[i]];
                j++;
            }
        }
        
        return result;
}
