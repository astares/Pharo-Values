Extension { #name : #Duration }

{ #category : #'*Values-Core' }
Duration class >> nanoseconds: aNumber [

	^self nanoSeconds: aNumber
]

{ #category : #'*Values-Core' }
Duration >> printValueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' nanoseconds: ';
		nextPutAll: self asNanoseconds printString;
		nextPut: $).
	^LiteralPrintValue string: wst contents
]
