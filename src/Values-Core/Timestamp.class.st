"
A timestamp
"
Class {
	#name : #Timestamp,
	#superclass : #DateAndTime,
	#category : #'Values-Core-Chronology'
}

{ #category : #'instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger [

	^ self d: dayInteger m: monthInteger y: yearInteger h: 0 m: 0 s: 0
]

{ #category : #'instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger h: hoursInteger [

	^ self d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: 0 s: 0
]

{ #category : #'instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger [

	^ self d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger s: 0
]

{ #category : #'instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger s: secondsInteger [
	
	^ self
		year: yearInteger
		month: monthInteger
		day: dayInteger
		hour: hoursInteger
		minute: minutesInteger
		second: secondsInteger
]

{ #category : #'instance creation' }
Timestamp class >> fromDate: aDate andTime: aTime [

	^ self date: aDate time: aTime
]
