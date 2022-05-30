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
Time >> printValueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 25).
	(self hours isZero and: [
	self minutes isZero and: [
	self seconds isZero]]) ifTrue: [
			wst
				nextPutAll: (printer classNameOf: self);
				nextPutAll: ' zero'.
			^LiteralPrintValue string: wst contents].
	wst
		nextPut: $(;
		nextPutAll: (printer classNameOf: self);
		nextPutAll: ' h: ';
		nextPutAll: self hours printString.
	(self minutes isZero and: [
	self seconds isZero]) ifTrue: [
			wst nextPut: $).
			^LiteralPrintValue string: wst contents].
	wst
		nextPutAll: ' m: ';
		nextPutAll: self minutes printString.
	self seconds isZero ifTrue: [
		wst nextPut: $).
		^LiteralPrintValue string: wst contents].
	wst
		nextPutAll: ' s: ';
		nextPutAll: self seconds printString;
		nextPut: $).
	^LiteralPrintValue string: wst contents
]

{ #category : #'*Values-Core' }
Time class >> zero [

	^ self h: 0
]
