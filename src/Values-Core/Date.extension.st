Extension { #name : #Date }

{ #category : #'*Values-Core' }
Date class >> d: dayInteger m: monthInteger y: yearInteger [

	^ self year: yearInteger month: monthInteger day: dayInteger
]

{ #category : #'*Values-Core' }
Date >> printValueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' d: ';
		nextPutAll: self dayOfMonth printString;
		nextPutAll: ' m: ';
		nextPutAll: self monthIndex printString;
		nextPutAll: ' y: ';
		nextPutAll: self year printString;
		nextPut: $).
	^LiteralPrintValue string: wst contents
]
