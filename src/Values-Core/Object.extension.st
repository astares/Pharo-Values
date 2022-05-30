Extension { #name : #Object }

{ #category : #'*Values-Core' }
Object >> asDescription [
	"<Text>
	produces a text equivalent to the soure with bold leaf values"

	^self asDescriptionFor: self class
]

{ #category : #'*Values-Core' }
Object >> asDescriptionFor: targetClass [
	"<Text>
	Produces a text equivalent to the source"

	| printer printvalue |
	printer := ValuePrinter newFor: targetClass.
	printvalue := self printValueWith: printer.
	^ printvalue description
]

{ #category : #'*Values-Core' }
Object >> asSource [
	"<String>
	Produces a string which can be evaluated in the context of the receiver class to an object equivalent to the receiver"

	^self asSourceFor: self class
]

{ #category : #'*Values-Core' }
Object >> asSourceFor: targetClass [
	"<String>
	produces a string which can be evaluated in the context of targetClass to an object equivalent to the receiver"

	| printer printvalue |
	printer := ValuePrinter newFor: targetClass.
	printvalue := self printValueWith: printer.
	^ printvalue sourceWithPrinter: printer
]

{ #category : #'*Values-Core' }
Object >> printValueWith: printer [

	^ LiteralPrintValue string: self storeString
]
