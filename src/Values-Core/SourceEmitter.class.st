"
SourceEmitter outputs source code.
"
Class {
	#name : #SourceEmitter,
	#superclass : #Emitter,
	#category : #'Values-Core-Formatting'
}

{ #category : #testing }
SourceEmitter class >> isAbstract [

	^ self == SourceEmitter 
]

{ #category : #'private - accessing' }
SourceEmitter >> emitterClassFor: printvalue [

	^ printvalue isLine
		  ifTrue: [ LineEmitter ]
		  ifFalse: [ BlockEmitter ]
]

{ #category : #'private - accessing' }
SourceEmitter >> streamClass [
	^WriteStream
]
