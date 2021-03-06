#include <windows.h>
#include <iostream>
#include <cstdlib>
#include <string>


void SetDesktopView (int n);
bool isint (std::string s);

int main (int argc, char *argv[])
{
    if (argc == 2 && isint (argv[1]))
    {
        int m = atoi (argv[1]);

        if (m >= 0 && m <= 5)
        {
            SetDesktopView (m);
        }
        else
        {
            std::cout << "Format:\n DV [x] (x is from 0 to 5)\n" << std::endl;
        }
    }
    else if (argc == 1)
    {
        SetDesktopView (2);
    }
    else
    {
        std::cout << "Format:\n DV [x] (x is from 0 to 5)\n"
                  << "0 = default view\n"
                  << "1 = detail view\n"
                  << "2 = smallicon view\n"
                  << "3 = list view\n"
                  << "4 = tile view\n"
                  << std::endl;
    }

    return 0;
}

void SetDesktopView (int n)
{
    HWND h1, h2, h3;

    if ((h1 = FindWindow ("Progman", 0)) != 0)
        if ((h2 = FindWindowEx (h1, 0, "SHELLDLL_DefView", 0)) != 0)
            if ((h3 = FindWindowEx (h2, 0, "SysListView32", 0)) != 0)
            {
                SendMessage (h3, 0x1000 + 142, n, 0);
                /* 主要是SendMessage中的参数取值。 */
                /* 第二个参数“$1000+142”是常量“LVM_SETVIEW”的值； */
                /* 第三个参数“3”为文件查看方式，官方给出如下信息(对应的数值应为1-5，0为默认值)： */
                /* LV_VIEW_DETAILS */
                /* LV_VIEW_ICON */
                /* LV_VIEW_LIST */
                /* LV_VIEW_SMALLICON */
                /* LV_VIEW_TILE */
            }
}

bool isint (std::string s)
{
    for (int i = 0; i < s.length(); i++)
    {
        if (s[i] > 57 || s[i] < 48)
        {
            return false;
        }
    }

    return true;
}
