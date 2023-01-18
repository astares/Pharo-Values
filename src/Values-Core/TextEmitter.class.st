"
TextEmitter outputs a descriptive text
"
Class {
	#name : #TextEmitter,
	#superclass : #Emitter,
	#category : #'Values-Core-Formatting'
}

{ #category : #testing }
TextEmitter class >> isAbstract [

	^ self == TextEmitter
]

{ #category : #writing }
TextEmitter >> emitArraySourceFor: anArray [

	self emitSmallCollection: anArray
]

{ #category : #writing }
TextEmitter >> emitBold: aString [

	self stream nextPutAllText: aString asText allBold
]

{ #category : #writing }
TextEmitter >> emitClass: aString [

	self emitBold: aString
]

{ #category : #writing }
TextEmitter >> emitDictionarySourceFor: aDictionaryPrintValue [

	self emitSmallDictionary: aDictionaryPrintValue
]

{ #category : #writing }
TextEmitter >> emitSmallCollection: aSequenceableCollection [

	aSequenceableCollection do: [ :value |
		self emitSeparator.
		value sourceFor: self ]
]

{ #category : #writing }
TextEmitter >> emitSmallDictionary: aDictionaryPrintvalue [

	aDictionaryPrintvalue arguments do: [ :argument |
		self emitSeparator.
		argument name sourceFor: self.
		self emit: ': '.
		argument value sourceFor: self ]
]

{ #category : #writing }
TextEmitter >> emitValue: aString [

	self emitBold: aString
]

{ #category : #'private - accessing' }
TextEmitter >> emitterClassFor: printvalue [

	^ printvalue isLine
		  ifTrue: [ TextLineEmitter ]
		  ifFalse: [ TextBlockEmitter ]
]

{ #category : #'private - accessing' }
TextEmitter >> streamClass [

	^ TextStream
]
