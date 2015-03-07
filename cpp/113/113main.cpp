#include "113head.h"

int main()
{
	using namespace COMPLEX;
	using namespace std;
	Complex a (3, 4);
	Complex b;
	/* Complex b (10,12); */
	cin >> b;

	cout << a << endl;
	cout << b << endl;
	cout << a + b << endl;
	cout << a - b << endl;
	cout << a * b << endl;
	cout << 2 * b << endl;
	cout << b * 2 << endl;
	cout << ~a << endl;
	cout << ~b << endl;

	return 0;
}
