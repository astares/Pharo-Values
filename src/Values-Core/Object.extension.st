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
Object >> beImmutable [
	
	self beReadOnlyObject.	
	^ self
]

{ #category : #'*Values-Core' }
Object >> beMutable [

	self beWritableObject.	
	^ self
]

{ #category : #'*Values-Core' }
Object >> isEqualValue: anObject [

	^ self = anObject
]

{ #category : #'*Values-Core' }
Object class >> nameOrNilFor: aValue [
	"<Symbol | nil>"

	^ self namesByValues at: aValue ifAbsent: [nil]
]

{ #category : #'*Values-Core' }
Object class >> namedValueNames [
	"<Array of: Symbol>
	names to print for special known values"
	
	^#()
]

{ #category : #'*Values-Core' }
Object class >> namesByValues [
	"<Dictionary key: Value value: Symbol>"

	^ Value namedValuesAt: self ifAbsentPut: [ self newNamesByValues ]
]

{ #category : #'*Values-Core' }
Object class >> newNamesByValues [
	"<Dictionary key: Value value: Symbol>"

	| dict |
	dict := ValueMap new: self namedValueNames size.
	self namedValueNames do: [:symbol | dict at: (self perform: symbol) put: symbol].
	^dict
]

{ #category : #'*Values-Core' }
Object >> printValueWith: printer [

	^ LiteralPrintValue string: self storeString
]
