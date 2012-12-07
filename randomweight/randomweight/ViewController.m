//
//  ViewController.m
//  randomweight
//
//  Created by podevor@gmail.com on 12-9-13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(IBAction)click:(id)sender{
  /*  short beforeWeight = 0;
    srand((unsigned)time(NULL));
    for (int randomIndex = 0; randomIndex < 4; randomIndex++) {
        int randomWeight = 0;
        while (randomWeight == 0) {
            randomWeight = (rand()%(380-320))+320;
            if (randomWeight == beforeWeight) {
                randomWeight = 0;
            }
        }
        beforeWeight = randomWeight;
        NSLog(@"weight = %d",randomWeight);
    }
    NSLog(@"_________________________");
    */
 /*   int n = 5;
   int Random[n];
    for(int i = 0 ; i < n ; i++)
    {
        srand((unsigned)time(NULL));
        while(true)
        {
            int ran = (rand()%(380-320))+320;
            for(int j = 0 ; j < i ; j++)
            {
                if(Random[j] == ran)
                {
                    ran = -1;
                    break;
                } 
            }
            if(ran != -1)
            {
                Random[i] = ran;
                break;
            }
            
        }
         NSLog(@"weight = %d",Random[i]);
    }
    */
    
 /*   int Random = 0;
    srand((unsigned)time(NULL));
    for(int i = 0 ; i < 5 ; i++)
    {
        // int ran=-1;
        while(true)
        {
            int ran = (rand()%(380-320))+320;
            if(Random == ran)
            {
                ran = -1;
                break;
            } 
            if(ran != -1)
            {
                Random = ran;
                break;
            }
            
        }
        NSLog(@"weight = %d",Random);
    }*/
  /*  for(int i = 0 ; i < 5 ; i ++)
    {        
        NSLog(@"weight = %d",Random[i]);
        
    }*/
  /*  int robotNameIndex = 0;
    srand((unsigned)time(NULL));
    for (int i = 1; i <= 5; i++) {
        int random = 0;
        while (random == 0) {
            random = rand()%50;
            if (random == robotNameIndex) {
                random = 0;
            }
        }
        robotNameIndex = random;
        
        NSLog(@"robotNameIndex = %d",robotNameIndex);
    }*/
   /* int count = 5;
    int a[count];
    for (int i = 0; i < count; i++) {
        a[i] = i+1; 
    }
    
	int rndnum = 0;
	int n;
	int i;
	srand((unsigned)time(0));
    
	for(i=0;i<count;i++)
	{		
		while(1)
		{
            int dex = rand()%count;
			n=a[dex];
			if (n != rndnum) {
                rndnum = n;
                a[dex] = 0;
                break;
            }
		}
	}
    printf("%d  \n",rndnum);*/
    int weightRange = 380 - 320;
    int everyRange = weightRange/5;
    NSMutableArray *randomArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 5; i++) {
        [randomArray addObject:[NSNumber numberWithInt:i+1]];
    }
    srand((unsigned)time(NULL));
    for (int totalScoreIndex = 0; totalScoreIndex < 5; totalScoreIndex++) {        
        //random
        int index = rand()%randomArray.count;
            short weight = 320+[[randomArray objectAtIndex:index] intValue]*everyRange-randomArray.count; 
            [randomArray removeObjectAtIndex:index];   
        NSLog(@"weight %d ",weight);
    }
    NSLog(@"\n_________________________");
}
@end
