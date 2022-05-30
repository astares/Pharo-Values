"
Value is the abstract root object of values (literal objects).
All Value classes which have subclasses are considered abstract. Only leaf classes can have instances!!
Literal objects are created immutable with constructors.
The instance variables are object constants.

Subclasses must implement the following messages:
	class specification
		localSpecification'
"
Class {
	#name : #Value,
	#superclass : #Object,
	#classVars : [
		'NamedValuesRegistry'
	],
	#category : #'Values-Core-Base'
}

{ #category : #testing }
Value class >> isAbstract [ 

	^ self == Value
]

{ #category : #comparing }
Value >> = anObject [
	"all instvars must be equal"

	^self isEqualValue: anObject
]

{ #category : #comparing }
Value >> hash [

	^ (1 to: self class instSize)
		  inject: 0
		  into: [ :hash :i | hash bitXor: (self instVarAt: i) hash ]
]

{ #category : #testing }
Value >> isEmpty [

	^ self = self class new
]

{ #category : #'private - comparing' }
Value >> isEqualValue: anObject [

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	1 to: self class instSize do: [ :i | 
		((self instVarAt: i) isEqualValue: (anObject instVarAt: i)) 
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #testing }
Value >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #copying }
Value >> postCopy [

	super postCopy.
	self beImmutable
]
