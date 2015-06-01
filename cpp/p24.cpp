#include <iostream>
#include <cmath>
#include <cstdlib>
using namespace std;
const double PRECISION=1E-6;
const int COUNT=4;
const int RESULT=24;
double number[COUNT]; //这里一定要用double
string expression[COUNT]; //保存表达式
bool Test(int n)
{
    //递归结束
    if(n==1)
    {
        if(fabs(number[0]-RESULT)<PRECISION)
        {
            cout<<expression[0]<<endl;
            return true;
        }
        else
            return false;
    }
    //递归过程
    for(int i=0;i<n;i++)
    {
        for(int j=i+1;j<n;j++)
        {
            double a,b;
            string expa,expb;
            a=number[i];
            b=number[j];
            number[j]=number[n-1];
            expa=expression[i];
            expb=expression[j];
            expression[j]=expression[n-1];
            expression[i]='('+expa+'+'+expb+')';
            number[i]=a+b;
            if(Test(n-1))
                return true;
            //减号有两种情况,a-b与b-a
            expression[i]='('+expa+'-'+expb+')';
            number[i]=a-b;
            if(Test(n-1))
                return true;
            expression[i]='('+expb+'-'+expa+')';
            number[i]=b-a;
            if(Test(n-1))
                return true;
            expression[i]='('+expa+'*'+expb+')';
            number[i]=a*b;
            if(Test(n-1))
                return true;
            //除法也有两种情况,a/b与b/a
            if(b!=0)
            {
                expression[i]='('+expa+'/'+expb+')';
                number[i]=a/b;
                if(Test(n-1))
                    return true;
            }
            if(a!=0)
            {
                expression[i]='('+expb+'/'+expa+')';
                number[i]=b/a;
                if(Test(n-1))
                    return true;
            }
            //恢复数组
            number[i]=a;
            number[j]=b;
            expression[i]=expa;
            expression[j]=expb;
        }
    }
    return false;
}

int main(void)
{
    for(int i=0;i<COUNT;i++)
    {
        char buffer[20];
        int x;
        cin>>x;
        number[i]=x;
        itoa(x,buffer,10);
        expression[i]=buffer;
    }
    if(Test(COUNT))
        cout<<"Success"<<endl;
    else
        cout<<"Fail"<<endl;
    system("pause");
    return 0;
}
