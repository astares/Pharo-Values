"
ValuePrintvalue holds the data to print a `Value`.

Instance Variables:
	arguments	<`SequenceableCollection` of: (`PrintArgument` | `EmptyArgument`)> the arguments
	classname	<`String`>
"
Class {
	#name : #ValuePrintValue,
	#superclass : #PrintValue,
	#instVars : [
		'classname',
		'arguments'
	],
	#category : #'Values-Core-Base'
}

{ #category : #'instance creation' }
ValuePrintValue class >> className: classnameString arguments: argumentsArray [

	| inst |
	inst := self new.
	inst initializeClassname: classnameString arguments: argumentsArray.
	^ inst
]

{ #category : #'instance creation - optional' }
ValuePrintValue class >> classname: classnameString [

	^self className: classnameString arguments: nil
]

{ #category : #specification }
ValuePrintValue class >> localSpecification [

	<constant: #classname class: #String>
	<sequence: #arguments>
]

{ #category : #accessing }
ValuePrintValue >> arguments [
	"<Array>"

	^ arguments ifNil: [ #() ] 
]

{ #category : #accessing }
ValuePrintValue >> classname [
	"<String>"

	^classname
]

{ #category : #initialization }
ValuePrintValue >> initializeClassname: classnameString arguments: argumentsArray [

	classname := classnameString.
	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	self beImmutable
]

{ #category : #testing }
ValuePrintValue >> isLine [

	self arguments size = 1 ifTrue: [ 
		^ self arguments first value isLine ].
	^ self arguments size < 5 and: [ 
		  self arguments allSatisfy: [ :arg | arg isSimple ] ]
]

{ #category : #printing }
ValuePrintValue >> printValueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'classname' value: self className).
	args add: (printer array: 'arguments' value: self arguments).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
ValuePrintValue >> sourceWith: emitter [

	self arguments isEmpty ifTrue: [ ^ emitter emitEmpty: self ].
	emitter inBracketsDo: [ 
		emitter emitClass: self classname.
		self arguments do: [ :arg | 
			emitter emitSeparator.
			emitter emitArgument: arg ] ]
]
