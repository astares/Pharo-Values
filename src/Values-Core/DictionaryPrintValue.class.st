"
DictionaryPrintValue is used for printing Dictionaries

Instance Variables:
	arguments	<`SequenceableCollection` of `DictionaryPrintArgument`>	the PrintArguments for each entry
"
Class {
	#name : #DictionaryPrintValue,
	#superclass : #PrintValue,
	#instVars : [
		'arguments',
		'isOrdered'
	],
	#category : #'Values-Core-Base'
}

{ #category : #'instance creation - optional' }
DictionaryPrintValue class >> arguments: argumentsArray [

	^ self arguments: argumentsArray isOrdered: nil
]

{ #category : #'instance creation' }
DictionaryPrintValue class >> arguments: argumentsArray isOrdered: isOrderedBoolean [

	| inst |
	inst := self new.
	inst initializeArguments: argumentsArray isOrdered: isOrderedBoolean.
	^ inst
]

{ #category : #'instance creation - optional' }
DictionaryPrintValue class >> isOrdered: isOrderedBoolean [

	^ self arguments: nil isOrdered: isOrderedBoolean
]

{ #category : #specification }
DictionaryPrintValue class >> localSpecification [

	<sequence: #arguments>
	<optional: #isOrdered class: #Boolean default: 'false'>
]

{ #category : #accessing }
DictionaryPrintValue >> arguments [
	"<Array>"

	^arguments ifNil: [#()]
]

{ #category : #initialization }
DictionaryPrintValue >> initializeArguments: argumentsArray isOrdered: isOrderedBoolean [

	(argumentsArray notNil and: [ argumentsArray notEmpty ]) ifTrue: [
		arguments := (Array withAll: argumentsArray) beImmutable ].
	(isOrderedBoolean notNil and: [ self isOrdered ~= isOrderedBoolean ])
		ifTrue: [ isOrdered := isOrderedBoolean ].
	self beImmutable
]

{ #category : #testing }
DictionaryPrintValue >> isEmpty [

	^self arguments isEmpty
]

{ #category : #testing }
DictionaryPrintValue >> isLine [

	^self isEmpty
]

{ #category : #testing }
DictionaryPrintValue >> isOrdered [
	"<Boolean>"

	^ isOrdered ifNil: [ false ]
]

{ #category : #printing }
DictionaryPrintValue >> printValueWith: printer [

	| args |
	args := OrderedCollection new.
	args add: (printer array: 'arguments' value: self arguments).
	args add: (printer optional: 'isOrdered' value: isOrdered).
	^printer printValue: self arguments: args
]

{ #category : #accessing }
DictionaryPrintValue >> sourceWith: emitter [
	self isEmpty ifTrue: [
		^emitter emit: self targetClassName , ' new'].
	emitter emitDictionarySourceFor: self
]

{ #category : #accessing }
DictionaryPrintValue >> targetClass [

	^ self isOrdered
		  ifTrue: [ ValueMap ]
		  ifFalse: [ Dictionary ]
]

{ #category : #accessing }
DictionaryPrintValue >> targetClassName [

	^self targetClass name asString
]
