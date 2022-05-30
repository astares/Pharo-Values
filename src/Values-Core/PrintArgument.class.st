"
A PrintArgument holds the data to print one instance variable (constant) and its value.

	- name 	<`String`> 		the name of the argument
	- value 	<`PrintValue`>	the print value of the value
			
With `PrintValue` it represents the source for a Value
"
Class {
	#name : #PrintArgument,
	#superclass : #Value,
	#instVars : [
		'name',
		'value'
	],
	#category : #'Values-Core-Base'
}

{ #category : #specification }
PrintArgument class >> localSpecification [

	<constant: #name class: #String>
	<constant: #value class: #PrintValue>
]

{ #category : #'instance creation' }
PrintArgument class >> name: nameString value: valuePrintvalue [

	| inst |
	inst := self new.
	inst initializeName: nameString value: valuePrintvalue.
	^ inst
]

{ #category : #printing }
PrintArgument >> initializeName: nameString value: valuePrintvalue [

	name := nameString.
	value := valuePrintvalue.
	self beImmutable
]

{ #category : #testing }
PrintArgument >> isSimple [

	^self value isSimple
]

{ #category : #accessing }
PrintArgument >> name [
	"<String>"

	^ name
]

{ #category : #accessing }
PrintArgument >> sourceWith: emitter [

	emitter emitArgument: self
]

{ #category : #evaluating }
PrintArgument >> value [
	"<Printvalue>"

	^ value
]
