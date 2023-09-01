#include<iostream>
 using namespace std;
 int main(){
       int n,i,j;
       cin>>n;
       for(i=1;i<=2*n;i++){
        for(j=1;j<=n;j++){
          if(i<=n){
            int star=i;
            for(j=1;j<=star;j++){
            cout<<"*";
            }
          }
          else if(i>=n){
            int space=i-n;
            for(j=1;j<=n-space;j++){
              cout<<"*";
            }
            
          }

          }
          cout<<endl;
        }
        return 0;
       }