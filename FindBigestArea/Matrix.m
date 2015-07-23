#import "Matrix.h"

@implementation Node

@synthesize _value=value;
@synthesize _isConnect=isConnect;
@end

@implementation Matrix

//initialize from input array
-(id)initFromArray:(NSArray *)array
{
    if(self == [super init])
    {
        // Get row & col from raw data
        _totalRow = (int)[array count];
        _totalCol = (int)[[array objectAtIndex:0] count];
        NSLog(@"rows : %ld  cols : %ld",(long)_totalRow,(long)_totalCol);
        
        // Set raw into array of node
        _nodes = [[NSMutableArray alloc] init];
        for (int row = 0 ;row < _totalRow ;row++) {
            NSMutableArray *rowData = [[NSMutableArray alloc] init];

            for (int col = 0 ;col < _totalCol ;col++) {
                
                Node *node = [[Node alloc] init];
                node._value = (int)[(NSNumber*)[[array objectAtIndex:row] objectAtIndex:col] integerValue];
                node._isConnect = NO;
                
                [rowData addObject:node];
            }
            
            [_nodes addObject:rowData];
        }
    }
    
    //print test
    for (int row = 0 ;row < _totalRow ;row++) {
        
        NSString *line = @"";
        
        for (int col = 0 ;col < _totalCol ;col++) {
            
            Node *node = _nodes[row][col];
            
            line = [NSString stringWithFormat:@"%@ %d",line,node._value];
            
        }
        NSLog(@"%@ \r",line);
    }
    
    return self;
}

//To find a biggest area and return restult
-(int)findCountElementOfBiggestArea
{
    int biggestArea = 0;
    for (int row = 0 ;row < _totalRow ;row++) {
        for (int col = 0 ;col < _totalCol ;col++) {
            
            Node *temp = _nodes[row][col];
            
            //if this node never be connected do this algorithm
            if(temp._isConnect == NO)
            {
                //set flag isConnect -> true
                temp._isConnect = YES;
                
                int sumConnected = 1 + [self countAroundMe:row :col];
                
                if(sumConnected > biggestArea)
                    biggestArea = sumConnected;
                
                NSLog(@"Area of Number %d = %d",temp._value,sumConnected);
            }
        }
    }
    
    return biggestArea;
}

//Recursive function for finding conencted node
-(int)countConnectNode:(int)row :(int)col :(int)val
{
//    //Case 1 : index out of bound
    if(row < 0 || row >= _totalRow || col < 0 || col >= _totalCol)
        return 0;
    
    Node *temp = _nodes[row][col];
    //Case 2 : Values are not the same
    if(temp._value != val)
        return 0;
       
    //Case 3 : This node never be connected do this algorithm
    if(temp._isConnect == YES)
        return 0;
    
    //Do recursive
    //set flag isConnect -> true
    temp._isConnect = YES;
    
    return 1 + [self countAroundMe:row :col];
}

//Count connected node around corrent node
-(int)countAroundMe:(int)row :(int)col
{
    Node *temp = _nodes[row][col];
    
    //left node + right node + above node + below node
    
    int leftNodeNum = [self countConnectNode:row :col-1 :temp._value];
    int righttNodeNum = [self countConnectNode:row :col+1 :temp._value];
    int aboveNodeNum = [self countConnectNode:row-1 :col :temp._value];
    int belowNodeNum = [self countConnectNode:row+1 :col :temp._value];
    
    return leftNodeNum+ righttNodeNum+ aboveNodeNum+ belowNodeNum;
}

@end
