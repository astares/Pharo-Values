"
A ValueMap is an ordered dictionary preserving the order in which entries are added.

Instances are also used as ordered volatile dictionary, not just as value.

In VisualWorks, ValueMap is subclassed from Dictionary to inherit the dictionary API.

Instance Variables:
	orderedDictionary	<`OrderedDictionary` of: Object>		the wrapped ordered dictionary


The class used to be named `OrderedDictionary`, but was renamed for dialect compatibility with Pharo, which has a class named `OrderedDictionary` with different semantics. So in Pharo ValueMap is just a wrapper around an OrderedDictionary
"
Class {
	#name : #ValueMap,
	#superclass : #Collection,
	#instVars : [
		'orderedDictionary'
	],
	#category : #'Values-Core-Collections'
}

{ #category : #examples }
ValueMap class >> example [
 	<example>

	| map |
	map := self new.
	map at: #title put: self class name , ' example with examples of all basic values'.
	map at: #boolean put: true.
	map at: #character put: $A.
	map at: #symbol put: #mySymbol.
	map at: #string put: 'with umlauts and euro: äöüß€'.
	map at: #schlüssel put: nil.
	map at: #integer put: 42.
	map at: #number put: 3.14.
	map at: #date put: (Date d: 27 m: 3 y: 2022).
	map at: #time put: (Time h: 12 m: 18).
	map at: #timestamp put: (Timestamp d: 27 m: 3 y: 2022 h: 12 m: 18).
	map at: #duration put: 5 minutes.
	map at: #color put: (ColorValue fromBytesRed: 127 green: 0 blue: 0).
	map at: #knownColor put: ColorValue red.
	map at: #array put: #(#one 'two' 3).
	map at: #bytearray put: #[1 2 3].
	map
		at: #valuemap
		put: (self
			with: #test -> true
			with: #two -> 2
			with: #none -> nil).
	^map
]

{ #category : #accessing }
ValueMap >> = otherValueMap [

	^ self class = otherValueMap class and: [ 
		  self size = otherValueMap size and: [ 
			  (1 to: self size) allSatisfy: [ :i | 
				  (self atIndex: i) = (otherValueMap atIndex: i) ] ] ]
]

{ #category : #accessing }
ValueMap >> add: anAssociation [ 

	orderedDictionary add: anAssociation 
]

{ #category : #accessing }
ValueMap >> addAll: aKeyedCollection [

	^ orderedDictionary addAll: aKeyedCollection
]

{ #category : #accessing }
ValueMap >> at: key [ 
	"Answer the value associated with the key."

	^ orderedDictionary at: key
]

{ #category : #accessing }
ValueMap >> at: aKey ifAbsent: aBlock [

	^ orderedDictionary at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
ValueMap >> at: key put: anObject [ 

	^ orderedDictionary at: key put: anObject 
]

{ #category : #accessing }
ValueMap >> atIndex: anInteger [ 

	^ orderedDictionary associationAt: (orderedDictionary keys at: anInteger)
]

{ #category : #enumerating }
ValueMap >> do: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument."

	^ orderedDictionary associations do: aBlock
]

{ #category : #accessing }
ValueMap >> indexOf: aSymbol [ 
 
	^ orderedDictionary indexOfKey: aSymbol 
]

{ #category : #initialization }
ValueMap >> initialize [
	super initialize.
	orderedDictionary := OrderedDictionary new
]

{ #category : #testing }
ValueMap >> isEmpty [

	^ orderedDictionary isEmpty 
]

{ #category : #accessing }
ValueMap >> keys [

	^ orderedDictionary keys
]

{ #category : #iterating }
ValueMap >> keysDo: aBlockClosure [ 
	
	^ orderedDictionary keysDo: aBlockClosure 
]

{ #category : #accessing }
ValueMap >> removeKey: aKey [ 

	^ orderedDictionary removeKey: aKey
]

{ #category : #accessing }
ValueMap >> removeKey: aKey ifAbsent: aBlock [ 
	

	^ orderedDictionary removeKey: aKey ifAbsent: aBlock 
	
]

{ #category : #accessing }
ValueMap >> values [

	^ orderedDictionary values
]
