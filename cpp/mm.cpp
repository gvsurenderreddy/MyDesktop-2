#include "iostream"
#include "cstdlib"
#include "ctime"
#include "cmath"

void addint(int x, int y);
void subint(int x, int y);
void mulint(int x, int y);
void divint(int x, int y);
void calculate(int x, int y, void (*pf)(int x, int y));
int randint(int min, int max){return min + rand() % max;};
static int err = 0;
void counting(int err, int total);

int main()
{
    int m, n, l, x, y;
    void (*op[])(int, int) = {addint, subint, mulint, divint};
    srand((int) time(0));
    std::cout << "输入最大位数：";
    std::cin >> m;
    std::cout << "输入答题次数：";
    std::cin >> n;
    for (int i = 1; i <= n; ++i)
    {
        std::cout << "第" << i << "题：  ";
        x = randint(1, pow(10, m) - 1);
        y = randint(1, pow(10, m) - 1);
        l = randint(0, 3);
        calculate(x, y, op[l]);
    }
    counting(err, n);

    return 0;
}

void addint(int x, int y)
{
    std::cout << x << " + " << y << " = ";
    int z;
    std::cin >> z;
    if (z == x + y)
    {
        std::cout << "正确！" << std::endl;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        err++;
    }
}

void subint(int x, int y)
{
    if (x < y)
    {
        int t;
        t = x;
        x = y;
        y = t;
    }
    std::cout << x << " - " << y << " = ";
    int z;
    std::cin >> z;
    if (z == x - y)
    {
        std::cout << "正确！" << std::endl;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        err++;
    }
}

void mulint(int x, int y)
{
    std::cout << x << " * " << y << " = ";
    int z;
    std::cin >> z;
    if (z == x * y)
    {
        std::cout << "正确！" << std::endl;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        err++;
        /* TODO: error expression */
    }
}

void divint(int x, int y)
{
    std::cout << x << " / " << y << " = ";
    int z;
    std::cin >> z;
    if (z == x / y)
    {
        std::cout << "正确！" << std::endl;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        err++;
    }
}

void calculate(int x, int y, void (*pf)(int x, int y))
{
    (*pf)(x, y);
}

void counting(int err, int total)
{
    std::cout << std::endl << "答对" << total - err << "题" << std::endl;
    std::cout << "正确率" << (int) ((total - err) * 100 / total) << "%"<< std::endl;
}
