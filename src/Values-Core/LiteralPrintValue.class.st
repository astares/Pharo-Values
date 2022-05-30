"
LiteralPrintValue is a `PrintValue` for literal

Instance Variables:
	string	<`String`>	the representation as a string
"
Class {
	#name : #LiteralPrintValue,
	#superclass : #PrintValue,
	#instVars : [
		'string'
	],
	#category : #'Values-Core-Base'
}

{ #category : #specification }
LiteralPrintValue class >> localSpecification [

	<constant: #string class: #String>
]

{ #category : #'instance creation' }
LiteralPrintValue class >> string: aString [

	| inst |
	inst := self new.
	inst initializeString: aString.
	^inst
]

{ #category : #initialization }
LiteralPrintValue >> initializeString: stringString [

	string := stringString.
	self beImmutable
]

{ #category : #testing }
LiteralPrintValue >> isLine [

	^ true
]

{ #category : #testing }
LiteralPrintValue >> isSimple [

	^(self string first = $() not
]

{ #category : #printing }
LiteralPrintValue >> printValueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'string' value: self string).
	^printer printValue: self arguments: args
]

{ #category : #accessing }
LiteralPrintValue >> sourceWith: emitter [

	emitter emitValue: self string
]

{ #category : #accessing }
LiteralPrintValue >> string [
	"<String>"

	^ string
]
