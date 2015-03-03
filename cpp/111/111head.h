#ifndef MY_111_HEAD_H
#define MY_111_HEAD_H

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
	void Show () const;

private:
	int hours;
	int minutes;
};

#endif
