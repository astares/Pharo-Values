"
A Printvalue holds a representation of a `Value` to be printed.
It consists of
	- classname 	<String>													properly resolved against a target class (#name or #fullName)
	- arguments 	<`SequenceableCollection` of: Printargument>		the list of arguments with constructor variable name and a Printvalue

Printvalues are created when printing the source for a `Value` in the first pass. The second pass takes the Printvalue and produces a nicely indented soure string for the value.
"
Class {
	#name : #PrintValue,
	#superclass : #Value,
	#category : #'Values-Core-Base'
}

{ #category : #testing }
PrintValue class >> isAbstract [ 

	^ self == PrintValue 
]

{ #category : #accessing }
PrintValue >> description [
	"<Text>"

	| emitter |
	emitter := self textEmitterClass new.
	self sourceWith: emitter.
	^emitter stream contents
]

{ #category : #'private - accessing' }
PrintValue >> emitterClass [
	"<SourceEmitter class>"

	^ self isLine
		  ifTrue: [ LineEmitter ]
		  ifFalse: [ BlockEmitter ]
]

{ #category : #testing }
PrintValue >> isLine [

	^ false
]

{ #category : #testing }
PrintValue >> isSimple [
	"does it have to be printed in brackets?
	only literals are simple"

	^ false
]

{ #category : #accessing }
PrintValue >> sourceFor: outerEmitter [
	"<String>"

	^self sourceWith: (outerEmitter emitterFor: self)
]

{ #category : #accessing }
PrintValue >> sourceWith: emitter [
	"write yourself with the emitter"

	^ self subclassResponsibility
]

{ #category : #accessing }
PrintValue >> sourceWithPrinter: aPrinter [
	"<String>"

	| emitter |
	emitter := self emitterClass for: aPrinter.
	self sourceWith: emitter.
	^ emitter stream contents
]

{ #category : #'private - accessing' }
PrintValue >> textEmitterClass [
	"<SourceEmitter class>"

	^ self isLine
		  ifTrue: [ TextLineEmitter ]
		  ifFalse: [ TextBlockEmitter ]
]
