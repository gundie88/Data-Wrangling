* %/% is integer division while 5 %/% 2 = 2  
* %% is a modulus or returns the remainder 5 %% 2 = 1
* 1 means 1 second, so a binwidth of 86400 means one day. 
* For dates, 1 means 1 day.



You can pull out individual parts of the date
* year()
* month() label = TRUE abbreviated name of month, abbr = FALSE to return the full name
* mday() (day of the month)
* yday() (day of the year)
* wday() (day of the week) label = TRUE abbreviated name of week, abbr = FALSE to return the full name
* hour() 
* second()()
* second()
* update() create a new date-time with
* Sys.timezone() what R thinks your current time zone is
* OlsonNames() complete list of all time zone names
* x4a <- with_tz(x4, tzone = "Australia/Lord_Howe") Keep the instant in time the same, and change how it’s displayed
* x4b <- force_tz(x4, tzone = "Australia/Lord_Howe") Change the underlying instant in time
* ymd(), mdy(), dmy(), ydm()
* make_date(), make_datetime()



Time spans
* durations, which represent an exact number of seconds. You can add and multiply durations. You can add and subtract durations. 

   * dseconds()
   * dminutes(10)
   * dhours(c(12, 24))
   * ddays(0:5)
   * dweeks(3)
   * dyears(1)

* periods, which represent human units like weeks and months.You can add and multiply periods

   * seconds(15)
   * minutes(10)
   * hours(c(12, 24))
   * days(7)
   * months(1:6)
   * weeks(3)
   * years(1)

* intervals, which represent a starting and ending point.

   * next_year <- today() + years(1) <n> (today() %--% next_year) / ddays(1)
   * To find out how many periods fall into an interval, you need to use integer division. (today() %--% next_year) %/% days(1)


