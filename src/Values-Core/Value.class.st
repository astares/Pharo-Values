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
