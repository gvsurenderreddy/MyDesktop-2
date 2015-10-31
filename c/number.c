#include <stdio.h>

void main()
{
    while (1)
    {
        static char *a[][20] = {"", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN",
                                "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN ", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN",
                                "", "", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY", "HUNDRED", "HUNDRED AND "
                               };                              //建立对照表
        int n, i, j;
        printf ("Please enter number:");
        scanf ("%d", &n);               //输入整数
        printf ("%d = ", n);

        if (n == 0)
        {
            printf ("ZERO");    //输入是0
        }
        else
        {
            i = n / 100;
            j = n % 100;

            if (i != 0 && j == 0)
            {
                printf ("%s %s", a[0][i], a[1][10]);    //如果是100的整数倍
            }

            if (i != 0 && j != 0)
            {
                printf ("%s %s", a[0][i], a[1][11]);    //如果不是100的整数倍
            }

            if (j >= 20)
            {
                j = j / 10;
                printf ("%s", a[1][j]);                             //大于20的数的十位
                j = n % 10;
                printf (" %s", a[0][j]);                            //大于20的数的个位
            }
            else
            {
                printf ("%s", a[0][j]);                             //小于20的数的十位和个位
            }
        }

        printf ("\n");
    }
}
