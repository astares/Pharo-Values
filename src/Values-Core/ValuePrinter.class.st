"
ValuePrinter creates the source for a Value.
For each level, a new ValuePrinter is created.
"
Class {
	#name : #ValuePrinter,
	#superclass : #Object,
	#instVars : [
		'target'
	],
	#category : #'Values-Core-Base'
}

{ #category : #'instance creation' }
ValuePrinter class >> newFor: targetClass [

	| inst |
	inst := self new.
	inst initializeTarget: targetClass.
	^ inst
]

{ #category : #accessing }
ValuePrinter >> array: selectorName value: object [
	"<PrintArgument | nil>"

	object isEmpty ifTrue: [ ^ nil ].
	^ PrintArgument
		  name: selectorName
		  value: (object printValueWith: self)
]

{ #category : #accessing }
ValuePrinter >> classNameOf: value [

	^ value class nameRelativeTo: self target
]

{ #category : #accessing }
ValuePrinter >> constant: selectorName value: object [
	"<PrintArgument>"

	^ PrintArgument name: selectorName value: (object printValueWith: self)
]

{ #category : #accessing }
ValuePrinter >> dictionary: selectorName value: object [
	"<PrintArgument | nil>"

	object isEmpty ifTrue: [ ^ nil ].
	^ PrintArgument
		  name: selectorName
		  value: (object printValueWith: self)
]

{ #category : #initialization }
ValuePrinter >> initializeTarget: targetClass [

	target := targetClass
]

{ #category : #accessing }
ValuePrinter >> optional: selectorName value: object [
	"<PrintArgument | nil>"

	^ object ifNotNil: [ 
		  PrintArgument
			  name: selectorName
			  value: (object printValueWith: self) ]
]

{ #category : #printing }
ValuePrinter >> printValue: aValue arguments: arguments [

	aValue class new = aValue ifTrue: [ 
		^ ValuePrintValue classname: (self classNameOf: aValue) ].
	^ ValuePrintValue
		  className: (self classNameOf: aValue)
		  arguments: (arguments select: [ :arg | arg notNil ])
]

{ #category : #accessing }
ValuePrinter >> target [
	"<Value class>
	the class for which the object is printed.
	Takes the visibility of classes into account for short class name generation"

	^target
]
