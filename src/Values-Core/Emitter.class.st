"
Emitter outputs a Printvalue as formatted source code to a stream.
Subclasses write source or text.
This implements the second pass of the source generation for `Values`.

Instance Variables
	printer	<`ValuePrinter`>				the printer to resolve namespace names
	level		<`Integer`>						the indentionS level
	stream		<`WriteStream` | `TextStream`>		the output stream
"
Class {
	#name : #Emitter,
	#superclass : #Object,
	#instVars : [
		'printer',
		'stream',
		'level'
	],
	#category : #'Values-Core-Formatting'
}

{ #category : #'instance creation' }
Emitter class >> for: aPrinter [

	| inst |
	inst := self new.
	inst initializePrinter: aPrinter stream: nil level: -1.
	^inst
]

{ #category : #'instance creation' }
Emitter class >> for: aPrinter on: aWriteStream at: anInteger [

	| inst |
	inst := self new.
	inst initializePrinter: aPrinter stream: aWriteStream level: anInteger.
	^inst
]

{ #category : #testing }
Emitter class >> isAbstract [

	^ self == Emitter
]

{ #category : #writing }
Emitter >> emit: aString [

	self stream nextPutAll: aString
]

{ #category : #writing }
Emitter >> emitArgument: aPrintargument [

	self emit: aPrintargument name , ': '.
	aPrintargument value sourceFor: self
]

{ #category : #writing }
Emitter >> emitArraySourceFor: anArray [
	self inBracketsDo: [
		anArray size > 4
			ifTrue: [self emitLongCollection: anArray]
			ifFalse: [
			self emitSmallCollection: anArray]]
]

{ #category : #writing }
Emitter >> emitClass: aString [

	self emit: aString
]

{ #category : #writing }
Emitter >> emitDictionarySourceFor: aDictionaryPrintvalue [
	self inBracketsDo: [
		aDictionaryPrintvalue arguments size > 4
			ifTrue: [
			self emitLongDictionary: aDictionaryPrintvalue]
			ifFalse: [
			self emitSmallDictionary: aDictionaryPrintvalue]]
]

{ #category : #writing }
Emitter >> emitEmpty: aValuePrintvalue [
	"write the constructor for an empty instance"

	self emitClass: aValuePrintvalue className.
	self emit: ' new'
]

{ #category : #writing }
Emitter >> emitLongCollection: aSequenceableCollection [
	self emit: '(', (OrderedCollection nameRelativeTo: self printer target) , ' new: ' , aSequenceableCollection size printString, ')'.
	aSequenceableCollection do: [:value |
		self emitSeparator.
		self emit: 'add: '.
		value sourceFor: self.
		self stream nextPut: $;].
	self emitSeparator.
	self emit: 'yourself'
]

{ #category : #writing }
Emitter >> emitLongDictionary: aDictionaryPrintvalue [
	self emit: '(', (aDictionaryPrintvalue targetClass nameRelativeTo: self printer target), ' new: ' , aDictionaryPrintvalue arguments size printString, ')'.
	aDictionaryPrintvalue arguments do: [:argument |
		self emitSeparator.
		self emit: 'add: '.
		argument name sourceFor: self.
		self emit: ' -> '.
		argument value sourceFor: self.
		self stream nextPut: $;].
	self emitSeparator.
	self emit: 'yourself'
]

{ #category : #writing }
Emitter >> emitSeparator [

	self subclassResponsibility
]

{ #category : #writing }
Emitter >> emitSmallCollection: aSequenceableCollection [

	self emit: (Array nameRelativeTo: self printer target).
	aSequenceableCollection do: [ :value |
		self emitSeparator.
		self emit: 'with: '.
		value sourceFor: self ]
]

{ #category : #writing }
Emitter >> emitSmallDictionary: aDictionaryPrintvalue [

	self emit: (aDictionaryPrintvalue targetClass nameRelativeTo: self printer target).
	aDictionaryPrintvalue arguments do: [:argument |
		self emitSeparator.
		self emit: 'with: '.
		argument name sourceFor: self.
		self emit: ' -> '.
		argument value sourceFor: self]
]

{ #category : #writing }
Emitter >> emitValue: aString [

	self emit: aString
]

{ #category : #'private - accessing' }
Emitter >> emitterClassFor: printvalue [
	"<Emitter class>"

	^ self subclassResponsibility
]

{ #category : #accessing }
Emitter >> emitterFor: printvalue [
	"<Emitter>"

	^ (self emitterClassFor: printvalue) for: self printer on: self stream at: self level
]

{ #category : #writing }
Emitter >> inBracketsDo: aZeroArgumentBlock [

	self stream nextPut: $(.
	aZeroArgumentBlock ensure: [self stream nextPut: $)]
]

{ #category : #initialization }
Emitter >> initializePrinter: aPrinter stream: aWriteStream level: anInteger [

	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger
]

{ #category : #accessing }
Emitter >> level [
	"<Integer>
	the indent level"

	^ level ifNil: [ 0 ]
]

{ #category : #accessing }
Emitter >> printer [
	"<ValuePrinter>"

	^ printer
]

{ #category : #accessing }
Emitter >> stream [

	"<WriteStream | TextStream>
		the output stream"

	^ stream ifNil: [ stream := self streamClass on: (String new: 100) ]
]

{ #category : #'private - accessing' }
Emitter >> streamClass [
	"<WriteStream class | TextStream class>"

	^ self subclassResponsibility
]
