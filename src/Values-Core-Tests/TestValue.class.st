"
`TestValue` is a resource class for testing values
"
Class {
	#name : #TestValue,
	#superclass : #Value,
	#instVars : [
		'constant',
		'optional',
		'array',
		'dictionary'
	],
	#category : #'Values-Core-Tests-Resources'
}

{ #category : #'instance creation - optional' }
TestValue class >> constant: constantSymbol [

	| inst |
	inst := self new.
	inst initializeConstant: constantSymbol optional: nil array: nil dictionary: nil.
	^ inst
]

{ #category : #'instance creation - optional' }
TestValue class >> constant: constantSymbol array: arrayArray [

	| inst |
	inst := self new.
	inst initializeConstant: constantSymbol optional: nil array: arrayArray dictionary: nil.
	^ inst
]

{ #category : #'instance creation - optional' }
TestValue class >> constant: constantSymbol array: arrayArray dictionary: dictionaryDictionary [
	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: nil
		array: arrayArray
		dictionary: dictionaryDictionary.
	^inst
]

{ #category : #'instance creation - optional' }
TestValue class >> constant: constantSymbol dictionary: dictionaryDictionary [

	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: nil
		array: nil
		dictionary: dictionaryDictionary.
	^ inst
]

{ #category : #'instance creation - optional' }
TestValue class >> constant: constantSymbol optional: optionalSymbol [

	| inst |
	inst := self new.
	inst initializeConstant: constantSymbol optional: optionalSymbol array: nil dictionary: nil.
	^ inst
]

{ #category : #'instance creation - optional' }
TestValue class >> constant: constantSymbol optional: optionalSymbol array: arrayArray [

	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: optionalSymbol
		array: arrayArray
		dictionary: nil.
	^ inst
]

{ #category : #'instance creation' }
TestValue class >> constant: constantSymbol optional: optionalSymbol array: arrayArray dictionary: dictionaryDictionary [
	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: optionalSymbol
		array: arrayArray
		dictionary: dictionaryDictionary.
	^inst
]

{ #category : #'instance creation - optional' }
TestValue class >> constant: constantSymbol optional: optionalSymbol dictionary: dictionaryDictionary [

	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: optionalSymbol
		array: nil
		dictionary: dictionaryDictionary.		
	^ inst
]

{ #category : #'test instances' }
TestValue class >> example [
	<sampleInstance>
	
	^ TestValue
		  constant: #constantSymbol
		  optional: #optionalSymbol
		  array: #( 1 #a $x 'name' )
		  dictionary: (ValueMap with: 1 -> #symbol with: #key -> 'string')
]

{ #category : #specification }
TestValue class >> localSpecification [
	<constant: #constant class: #(#Symbol)>
	<optional: #optional class: #(#Symbol) default: '#none'>
	<sequence: #array>
	<map: #dictionary>
]

{ #category : #accessing }
TestValue >> array [
	"<Array>"

	^ array ifNil: [ #(  ) ]
]

{ #category : #accessing }
TestValue >> constant [
	"<Symbol>"

	^ constant
]

{ #category : #accessing }
TestValue >> dictionary [
	"<Dictionary>"

	^ dictionary ifNil: [ Dictionary new beImmutable ]
]

{ #category : #initialization }
TestValue >> initializeConstant: constantSymbol optional: optionalSymbol array: arrayArray dictionary: dictionaryDictionary [

	constant := constantSymbol.
	(optionalSymbol notNil and: [ self optional ~= optionalSymbol ]) 
		ifTrue: [ optional := optionalSymbol ].
	(arrayArray notNil and: [ arrayArray notEmpty ]) ifTrue: [ 
		array := (Array withAll: arrayArray) beImmutable ].
	(dictionaryDictionary notNil and: [ dictionaryDictionary notEmpty ]) 
		ifTrue: [ 
		dictionary := (ValueMap withAll: dictionaryDictionary) beImmutable ].
	self beImmutable
]

{ #category : #accessing }
TestValue >> optional [
	"<Symbol>"

	^ optional ifNil: [ #none ]
]

{ #category : #marshalling }
TestValue >> passInstVars [
	"for OpenTalk StSt"

	^#(#default #default #default #value)
]

{ #category : #printing }
TestValue >> printvalueWith: printer [

	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'constant' value: self constant).
	args add: (printer optional: 'optional' value: optional).
	args add: (printer array: 'array' value: self array).
	args add: (printer dictionary: 'dictionary' value: self dictionary).
	^ printer printValue: self arguments: args
]
