Extension { #name : #Time }

{ #category : #'*Values-Core' }
Time class >> h: hoursInteger [

	^ self h: hoursInteger m: 0 s: 0
]

{ #category : #'*Values-Core' }
Time class >> h: hoursInteger m: minutesInteger [

	^ self h: hoursInteger m: minutesInteger s: 0
]

{ #category : #'*Values-Core' }
Time class >> h: hoursInteger m: minutesInteger s: secondsInteger [

	^ self hour: hoursInteger minute: minutesInteger second: secondsInteger
]

{ #category : #'*Values-Core' }
Time class >> zero [

	^ self h: 0
]
