#include "iostream"
#include "cstdlib"
#include "ctime"
#include "cmath"
#include "string"

bool isint(std::string s);
bool addint(int x, int y);
bool subint(int x, int y);
bool mulint(int x, int y);
bool divint(int x, int y);
bool calculate(int x, int y, bool (*pf)(int x, int y));
int randint(int min, int max){return min + rand() % max;};

int main(int argc, char *argv[])
{
    int m, n, o, x, y, ok = 0;
    bool (*op[])(int, int) = {addint, subint, mulint, divint};
    srand((int) time(0));

    switch (argc)
    {
        case 3:
            if(isint(argv[1]) && isint(argv[2]))
            {
                m = atoi(argv[1]);
                n = atoi(argv[2]);
                std::cout << "最大位数为" << m << "位" << std::endl;
                std::cout << "答题次数为" << n << "次" << std::endl;
            }
            else
            {
                std::cout << "Err" << std::endl;
                return 1;
            }
            break;
        case 1:
            std::cout << "输入最大位数：";
            std::cin >> m;
            std::cout << "输入答题次数：";
            std::cin >> n;
            break;
        default:
            std::cout << "参数错误！请输入：" << std::endl;
            std::cout << "\t命令 最大位数 答题次数<回车>" << std::endl;
            std::cout << "或直接输入：" << std::endl;
            std::cout << "\t命令<回车>" << std::endl;
            return 1;
    }

    for (int i = 1; i <= n; ++i)
    {
        std::cout << "第" << i << "题：  ";
        x = randint(1, pow(10, m) - 1);
        y = randint(1, pow(10, m) - 1);
        o = rand() % 4;
        if (calculate(x, y, op[o]))
        {
            std::cout << "正确！" << std::endl;
            ok++;
        }
        else
        {
            std::cout << "错误！" << std::endl;
            /* todo: error expression */
        }
    }
    std::cout << std::endl << "答对" << ok << "题。" << std::endl;
    std::cout << "正确率" << 100 * ok / n << "%。"<< std::endl;

    return 0;
}

bool addint(int x, int y)
{
    std::cout << x << " + " << y << " = ";
    int z;
    std::cin >> z;
    return x + y == z;
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
    return x - y == z;
}

bool mulint(int x, int y)
{
    std::cout << x << " * " << y << " = ";
    int z;
    std::cin >> z;
    return x * y == z;
}

bool divint(int x, int y)
{
    std::cout << x << " / " << y << " = ";
    int z;
    std::cin >> z;
    return x / y == z;
}

bool calculate(int x, int y, bool (*pf)(int x, int y))
{
    return (*pf)(x, y);
}

bool isint(std::string s)
{
    for(int i=0; i<s.length(); i++)
    {
        if(s[i]>=57 || s[i]<=48)
            return false;
    }
    return true;
}
