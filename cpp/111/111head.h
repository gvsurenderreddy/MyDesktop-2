#ifndef MY_111_HEAD_H
#define MY_111_HEAD_H
#include "iostream"

class Time
{
public:
	Time ();
	~Time ();
	Time (int h, int m = 0);
	void AddMin (int m);
	void AddHr (int h);
	void Reset (int h = 0, int m = 0);
	/* Time Sum (const Time & t) const; */
	Time operator + (const Time & t) const;
	Time operator * (double n) const;
	void Show () const;

	friend Time operator * (double m, const Time & t) {return t * m;}
	friend std::ostream & operator << (std::ostream & os, const Time & t);

private:
	int hours;
	int minutes;
};

#endif
