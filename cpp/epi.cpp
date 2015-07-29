#include <iostream>
#include <cstdlib>
#include <cmath>
#include <ctime>

using namespace std;

int main(int argc, char *argv[])
{
    srand((unsigned)time(NULL));
    const int count = 300000;
    long double in = 0;
    long double out = 0;

    for (int i = 1; i <= count; ++i)
    {
        long double x = ((long double)rand())/RAND_MAX;
        long double y = ((long double)rand())/RAND_MAX;

        cout << i << ": (" << x << ", " << y << ")       \r";
        if (sqrt(x * x + y * y ) < 1.0)
        {
            in++;
        }
        else
        {
            out++;
        }
    }

    cout << endl << in / out  << endl;

    return 0;
}
