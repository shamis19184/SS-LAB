#include<stdio.h>
#include<stdlib.h>
int frame[10],page[20],recent[10],f,n,i,j,k,choice;
int pageHit=0;

void FIFO(){
    int isPageHit, curPtr=0;
    for(i=0;i<n;i++){
        isPageHit = 0;
        
        for(j=0;j<f;j++){
            if(page[i] == frame[j]){
                pageHit++;
                isPageHit = 1;
            }
        }
        if(isPageHit == 0){
            curPtr = curPtr %f;
            frame[curPtr] = page[i];
            curPtr++;
        }
          printf("\nFrame:\t");
        for(k=0;k<f;k++){
            printf("%d  ",frame[k]);
        } 
    }
   // pageHit = 0;
    printf("\nNumber of Page Hit : %d\n",pageHit);
    printf("Number of page fault : %d \n",n-pageHit);
}
int findLeastRecentlyUsedPage(int recent[],int frameSize){
    int leastPageVal = recent[0];
    int leastPage = 0;
    int l;
    for(l = 1;l<frameSize;l++){
        if(recent[l] < leastPageVal){
            leastPageVal = recent[l];
            leastPage = l;
        }
    }
    return leastPage;
}

void LRU(){
    int isPageHit = 0,isFirstFramePages = 0,counter=0;
    pageHit=0;
    for(i=0;i<f;i++){
        frame[i] = -1;
    } 
    for(i=0; i<n;i++){
        isFirstFramePages=0;
        isPageHit=0;

        for(j=0;j<f;j++){
            if(page[i] == frame[j]){
                isPageHit = 1;
                pageHit++;
                counter++;
                recent[j] = counter;
                break;
            }
        }
        if(isPageHit == 0){
            for(j=0;j<f;j++){
                if(frame[j] == -1){
                    isFirstFramePages = 1;
                    frame[j]=page[i];
                    counter++;
                    recent[j] = counter;
                    break;
                }
            }
        }
        if(isPageHit==0 && isFirstFramePages == 0){
            int pos = findLeastRecentlyUsedPage(recent,f);
            counter++;
            recent[pos]  = counter;
            frame[pos] = page[i];
        }
        for(k=0;k<f;k++)
            printf("%d ",frame[k]);
        printf("\n");
    }
    printf("Number of page hit : %d\n",pageHit );
    printf("Number of page fault : %d",n-pageHit);
}
void main(){
    printf("Enter page size:\n");
    scanf("%d",&n);
    printf("Enter %d page numbers/resources \n",n);
    for(i=0;i<n;i++){
        scanf("%d",&page[i]);
    }
    printf("Enter the frame Buffer size:\n");
    scanf("%d",&f);

    for(i=0;i<f;i++){
        frame[i] = -1;
    }
    
    int true=1;
    while(true==1)
    {
    printf("\n1:FIFO\n2:LRU\n3:exit\nEnter your choice:");
    scanf("%d",&choice);

    switch(choice){
        case 1: FIFO();
                break;

        case 2: LRU();
                break;
        case 3:exit(0);
    }
  }
}
