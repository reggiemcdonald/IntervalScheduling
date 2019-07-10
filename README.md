## The Interval Scheduling Problem

The problem is as follows:
> Consider an arbitrary set of intervals that represent appointments requests. Appointments may or may not conflict with one another. How can one select appointment requests so as to schedule the maximum number of appointments. Thus, an optimal solution is a set of intervals (appointment requests) that is of maximal size.

Solution:
1. Sort the requests by end-time of the interval
2. Choose the interval with the earliest end time and add to a set of selected requests
3. Remove all requests that conflict with the selected request
4. Repeat steps 2 and 3 until the set is empty

This is my swift implementation of the above algorithm. Run the Swift Playground in XCode 10. `createRandomExample(size: int)` can be used to create an example set of intervals to be passed to the algorithm.
