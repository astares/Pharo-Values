Extension { #name : #SequenceableCollection }

{ #category : #'*Values-Core' }
SequenceableCollection >> printValueWith: printer [

	self isLiteral ifTrue: [
		^LiteralPrintValue string: self printString].
	^ArrayPrintValue arguments: (self collect: [:item | item printValueWith: printer])
]
