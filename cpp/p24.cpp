#include <iostream>
#include <cmath>
#include <cstdlib>
using namespace std;
const double PRECISION = 1E-6;
const int COUNT = 4;
const int RESULT = 24;
double number[COUNT];
string expression[COUNT];
bool Test(int n)
{
    if (n == 1)
    {
        if (fabs(number[0] - RESULT) < PRECISION)
        {
            cout << expression[0] << endl;
            return true;
        }
        else
            return false;
    }
    for (int i = 0; i < n; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            double a, b;
            string expa, expb;
            a = number[i];
            b = number[j];
            number[j] = number[n - 1];
            expa = expression[i];
            expb = expression[j];
            expression[j] = expression[n - 1];
            expression[i] = '(' + expa + '+' + expb + ')';
            number[i] = a + b;
            if (Test(n - 1))
                return true;
            expression[i] = '(' + expa + '-' + expb + ')';
            number[i] = a - b;
            if (Test(n - 1))
                return true;
            expression[i] = '(' + expb + '-' + expa + ')';
            number[i] = b - a;
            if (Test(n - 1))
                return true;
            expression[i] = '(' + expa + '*' + expb + ')';
            number[i] = a * b;
            if (Test(n - 1))
                return true;
            if (b != 0)
            {
                expression[i] = '(' + expa + '/' + expb + ')';
                number[i] = a / b;
                if (Test(n - 1))
                    return true;
            }
            if (a != 0)
            {
                expression[i] = '(' + expb + '/' + expa + ')';
                number[i] = b / a;
                if (Test(n - 1))
                    return true;
            }
            number[i] = a;
            number[j] = b;
            expression[i] = expa;
            expression[j] = expb;
        }
    }
    return false;
}

int main(void)
{
    for (int i = 0; i < COUNT; i++)
    {
        char buffer[20];
        int x;
        cin >> x;
        number[i] = x;
        itoa(x, buffer, 10);
        expression[i] = buffer;
    }
    if (Test(COUNT))
        cout << "Success" << endl;
    else
        cout << "Fail" << endl;
    system("pause");
    return 0;
}
