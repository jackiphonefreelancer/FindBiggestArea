
/*
Class Name : Matrix
Description : Collection of input array and Find the biggest area

*/

#import <Foundation/Foundation.h>

// Node
@interface Node : NSObject{
    
    int _value; // Node value
    bool _isConnect; // Tell you current node is connected or not
}

@property (nonatomic, assign) int _value;
@property (nonatomic, assign) bool _isConnect;

@end

@interface Matrix : NSObject
{
    int _totalRow,_totalCol;
    NSMutableArray *_nodes;
}

-(id)initFromArray:(NSArray *)array;
-(int)findCountElementOfBiggestArea;

@end
