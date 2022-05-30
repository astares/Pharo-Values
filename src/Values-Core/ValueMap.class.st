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
