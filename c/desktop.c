#include <windows.h>

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
{
    HWND h1, h2, h3;

    if ((h1 = FindWindow ("Progman", 0)) != 0)
        if ((h2 = FindWindowEx (h1, 0, "SHELLDLL_DefView", 0)) != 0)
            if ((h3 = FindWindowEx (h2, 0, "SysListView32", 0)) != 0)
            {
                SendMessage (h3, 0x1000 + 142, 3, 0);
                /* 主要是SendMessage中的参数取值。 */
                /* 第二个参数“$1000+142”是常量“LVM_SETVIEW”的值； */
                /* 第三个参数“3”为文件查看方式，官方给出如下信息(对应的数值应为1-5，0为默认值)： */
                /* LV_VIEW_DETAILS */
                /* LV_VIEW_ICON */
                /* LV_VIEW_LIST */
                /* LV_VIEW_SMALLICON */
                /* LV_VIEW_TILE */
            }

    return 0;
}
