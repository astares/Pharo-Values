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

{ #category : #specification }
Value class >> localSpecification [
	"specification of the constants with pragmas.
	Only for the instvars defined in this class - access the full specification with #specification"

	^self subclassResponsibility
]

{ #category : #'named values' }
Value class >> namedValuesAt: aClass [
	"<Dictionary key: Value value: Symbol>
	the named instances of aClass"

	^ self namedValuesRegistry at: aClass ifAbsent: [ Dictionary new ]
]

{ #category : #'named values' }
Value class >> namedValuesAt: aClass ifAbsentPut: aBlock [
	"<Dictionary key: Value value: Symbol>
	the named instances of aClass"

	^ self namedValuesRegistry at: aClass ifAbsentPut: aBlock
]

{ #category : #'named values' }
Value class >> namedValuesRegistry [
	"<Dictionary key: Class value: (Dictionary key: Value value: Symbol)>
	the named instances of classes.
	This is a light weight implementation to hold all named instances of all classes, instead of storing them with the class"

	^ NamedValuesRegistry ifNil: [ NamedValuesRegistry := Dictionary new ]
]

{ #category : #initialization }
Value class >> obsolete [

	self allInstancesDo: #beMutable.
	super obsolete
]

{ #category : #marshalling }
Value class >> passMode [
	"for OpenTalk StSt (Smalltalk to Smalltalk)"

	^ #value
]

{ #category : #initialization }
Value class >> primeRuntime [
	"reset and load all class variables to fill the caches to avoid lazy initialization at runtime.
	This should be executed when deploying after all application fonts and extensions are loaded"
	<script>

	self resetNamedValuesRegistry.
	Object namesByValues
]

{ #category : #'class initialization' }
Value class >> resetNamedValuesRegistry [
	<script>

	NamedValuesRegistry := nil
]

{ #category : #pragmas }
Value class >> specificationPragmas [
	<pragmas: #class>
	^#(
		#constant:class:
		#constant:class:comment:

		#optional:class:default:
		#optional:class:default:comment:

		#sequence:
		#sequence:comment:
		"#sequence:elements:comment:"

		#map:
		#map:comment:
		"#map:keys:values:comment:"
	)
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

{ #category : #printing }
Value >> printOn: stream [

	stream nextPutAll: self asSource
]

{ #category : #printing }
Value >> printValueWith: printer [

	^ printer printValue: self arguments: #()
]
