#include "iostream"
#include "cstdlib"
#include "ctime"
#include "cmath"

bool addint(int x, int y);
bool subint(int x, int y);
bool mulint(int x, int y);
bool divint(int x, int y);
bool calculate(int x, int y, bool (*pf)(int x, int y));
int randint(int min, int max){return min + rand() % max;};
void counting(int ok, int total);

int main()
{
    int m, n, o, x, y, ok;
    bool (*op[])(int, int) = {addint, subint, mulint, divint};
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
        o = rand() % 4;
        if (calculate(x, y, op[o]))
            ok++;
    }
    counting(ok, n);

    return 0;
}

bool addint(int x, int y)
{
    std::cout << x << " + " << y << " = ";
    int z;
    std::cin >> z;
    if (z == x + y)
    {
        std::cout << "正确！" << std::endl;
        return true;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        /* TODO: error expression */
        return false;
    }
}

bool subint(int x, int y)
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
        return true;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        /* TODO: error expression */
        return false;
    }
}

bool mulint(int x, int y)
{
    std::cout << x << " * " << y << " = ";
    int z;
    std::cin >> z;
    if (z == x * y)
    {
        std::cout << "正确！" << std::endl;
        return true;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        /* TODO: error expression */
        return false;
    }
}

bool divint(int x, int y)
{
    std::cout << x << " / " << y << " = ";
    int z;
    std::cin >> z;
    if (z == x / y)
    {
        std::cout << "正确！" << std::endl;
        return true;
    }
    else
    {
        std::cout << "错误！" << std::endl;
        /* TODO: error expression */
        /* TODO: deal with redudence */
        return false;
    }
}

bool calculate(int x, int y, bool (*pf)(int x, int y))
{
    return (*pf)(x, y);
}

void counting(int ok, int total)
{
    std::cout << std::endl << "答对" << ok << "题" << std::endl;
    std::cout << "正确率" << (int) (ok / total * 100) << "%"<< std::endl;
}
