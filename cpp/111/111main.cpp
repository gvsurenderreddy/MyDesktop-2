#include "111head.h"
#include "iostream"

int main()
{
	using std::cout;
	using std::endl;
	Time planning;
	Time coding(2, 40);
	Time fixing(5, 55);
	Time total;

	cout << "Planning time = ";
	planning.Show();
	cout << endl;
	/* cout << "Coding time = " << coding.Show() << endl; */
	/* cout << "Fixing time = " << fixing.Show() << endl; */

	cout << "Total time = ";
	total = planning + coding + fixing;
	total.Show();
	cout << endl;

	return 0;
}
