import UIKit
import Foundation;

// A CalendarInterval structure
// Contains start and end times
struct CalendarInterval: CustomStringConvertible {
    // The starting time of the interval
    var startTime: Int = 0
    // The ending time of the interval
    var finishTime: Int = 0;
    
    // To comply with pretty printing
    var description: String {
        return "Start: " + startTime.description + " End: " + finishTime.description;
    }
}

// Create a set of intervals
func createRandomExample(size n: Int) -> (reference: [CalendarInterval], request: [CalendarInterval]) {
    var req: [CalendarInterval] = [];
    var ref: [CalendarInterval] = [];
    for _ in 0..<n {
        let startTime = Int.random(in: 0...23);
        let endTime = Int.random(in: startTime+1...24);
        var c = CalendarInterval();
        c.startTime = startTime;
        c.finishTime = endTime;
        ref.append(c);
        req.append(c);
    }
    return (reference: ref, request: req);
}

func sortInstance(c1: CalendarInterval, c2: CalendarInterval) -> Bool {
    return c1.finishTime < c2.finishTime;
}

func removeConflicting(_ i: CalendarInterval, _ requests: inout [CalendarInterval]) -> [CalendarInterval] {
    return requests.filter({ (c: CalendarInterval) -> Bool in
        return !(c.startTime < i.finishTime && i.startTime < c.finishTime);
    });
}


// Interval Scheduling
func scheduleIntervals(_ requests: inout [CalendarInterval]) -> [CalendarInterval] {
    var accepted: [CalendarInterval] = [];
    requests.sort(by: sortInstance);
    while requests.count > 0 {
        let i = requests[0];
        accepted.append(i);
        requests = removeConflicting(i, &requests);
    }
    return accepted;
}


var (reference, request) = createRandomExample(size: 7);
print ("All requests:\n");
print (reference);
print ("\n Scheduled: \n");
print(scheduleIntervals(&request));

var (reference1, request1) = createRandomExample(size: 7);
print ("All requests:\n");
print (reference1);
print ("\n Scheduled: \n");
print(scheduleIntervals(&request1));

//var c1 = CalendarInterval(); c1.startTime = 0; c1.finishTime = 5;
//var c2 = CalendarInterval(); c2.startTime = 0; c2.finishTime = 1;
//var c3 = CalendarInterval(); c3.startTime = 2; c3.finishTime = 4;
//var c4 = CalendarInterval(); c4.startTime = 0; c4.finishTime = 3;
//var c5 = CalendarInterval(); c5.startTime = 3; c5.finishTime = 4;
//var c6 = CalendarInterval(); c6.startTime = 5; c6.finishTime = 7;
//var c7 = CalendarInterval(); c7.startTime = 6; c7.finishTime = 9;
//var c8 = CalendarInterval(); c8.startTime = 10; c8.finishTime = 12;
//var test = [c1, c2, c3, c4, c5, c6, c7, c8];
//
//print ("\n All Requests: \n");
//print (test);
//print ("\n Scheduled: \n" );
//print(scheduleIntervals(&test));




