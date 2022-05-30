Extension { #name : #Point }

{ #category : #'*Values-Core' }
Point >> printValueWith: printer [

	| string |
	string := (self x asSourceFor: printer target) , ' @ ' , (self y asSourceFor: printer target).
	^ LiteralPrintValue string: string
]
