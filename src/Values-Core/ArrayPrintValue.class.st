"
ArrayPrintvalue is a special `Printvalue` for sequentiable collections of `Value`s
"
Class {
	#name : #ArrayPrintValue,
	#superclass : #PrintValue,
	#instVars : [
		'arguments'
	],
	#category : #'Values-Core-Base'
}

{ #category : #'instance creation' }
ArrayPrintValue class >> arguments: argumentsArray [
	| inst |
	inst := self new.
	inst initializeArguments: argumentsArray.
	^inst
]

{ #category : #specification }
ArrayPrintValue class >> localSpecification [

	<sequence: #arguments>
]

{ #category : #'private - accessing' }
ArrayPrintValue >> arguments [
	"<Array>"

	^ arguments ifNil: [#()]
]

{ #category : #initialization }
ArrayPrintValue >> initializeArguments: argumentsArray [

	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	self beImmutable
]

{ #category : #testing }
ArrayPrintValue >> isLine [

	^ self arguments size = 1 or: [
		  self arguments size < 5 and: [
			  self arguments allSatisfy: [ :arg | arg isSimple ] ] ]
]

{ #category : #printing }
ArrayPrintValue >> printValueWith: printer [

	| args |
	args := OrderedCollection new.
	args add: (printer array: 'arguments' value: self arguments).
	^printer printValue: self arguments: args
]

{ #category : #accessing }
ArrayPrintValue >> sourceWith: emitter [

	emitter emitArraySourceFor: self arguments
]
