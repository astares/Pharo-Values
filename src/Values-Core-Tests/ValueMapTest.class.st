"
Tests for `ValueMap` (the behavior of OrderedDictionary as `Dictionary` and as `Value`)
"
Class {
	#name : #ValueMapTest,
	#superclass : #TestCase,
	#category : #'Values-Core-Tests-Collections'
}

{ #category : #tests }
ValueMapTest >> testAdding [

	| od od1 |
	od := ValueMap new.
	self assert: od isEmpty.
	od add: #foo -> 'bar'.
	self assert: od size equals: 1.
	self assert: (od atIndex: 1) equals: (#foo -> 'bar').
	self assert: (od at: #foo) equals: 'bar'.
	od at: #baz put: 'xxx'.
	self assert: od size equals: 2.
	self assert: (od atIndex: 2) equals: (#baz -> 'xxx').
	self assert: (od at: #baz) equals: 'xxx'.
	od1 := ValueMap new.
	od1 add: #foo -> 'baz'.
	od1 at: #baz put: 'yyy'.
	od addAll: od1.
	self assert: od size equals: 2.
	self assert: (od at: #foo) equals: 'baz'.
	self assert: (od at: #baz) equals: 'yyy'
]

{ #category : #tests }
ValueMapTest >> testAddingWithGrowth [
	"Add iteratively elements, so that the dictionary must grow"

	| letters m1 m2 |
	letters := #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).

	m1 := ValueMap new.
	letters do: [:symbol | m1 add: symbol -> symbol asString ].
	self assert: m1 keys asArray equals: #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).

	m2 := ValueMap new.
	letters do: [:symbol | m2 at: symbol put: symbol asString ].
	self assert: m2 keys asArray equals: #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z)
]

{ #category : #tests }
ValueMapTest >> testComparing [

	self assert: (ValueMap with: #foo -> 'bar') equals: (ValueMap with: #foo -> 'bar').
	self deny: (ValueMap with: #foo -> 'bar') identicalTo: (ValueMap with: #foo -> 'bar').
	self deny: (ValueMap with: #foo -> 'bar') equals: (Dictionary with: #foo -> 'bar').
	self deny: (Dictionary with: #foo -> 'bar') equals: (ValueMap with: #foo -> 'bar').
	self assert: (ValueMap with: #foo -> 'bar' with: $a -> 123) equals: (ValueMap with: #foo -> 'bar' with: $a -> 123).
	self deny: (ValueMap with: #foo -> 'bar' with: $a -> 123) equals: (ValueMap with: $a -> 123 with: #foo -> 'bar' ).
	self deny: (ValueMap with: #foo -> 'bar' with: $a -> 123) equals: (ValueMap with: #foo -> 123 with: $a -> 'bar' ).
	self deny: (ValueMap with: #foo -> 'bar' with: $a -> 123) equals: (ValueMap with: #foo -> 'bar' with: $a -> 1234).
	self deny: (ValueMap with: #foo -> 'bar' with: $a -> 123) equals: (ValueMap with: #foo -> 'bars' with: $a -> 123).
	self deny: (ValueMap with: #foo -> 'bar' with: $a -> 123) equals: (ValueMap with: #foo -> 'bar' with: $a -> 123 with: '' -> 0)
]

{ #category : #'tests - failing' }
ValueMapTest >> testDescribeAndReadBackNew [

	| inst |
	inst := ValueMap new.
	self assert: inst asDescription equals: (Object compiler evaluate: inst asSource) asDescription
]

{ #category : #tests }
ValueMapTest >> testEnumeration [

	| map keys |
	map := ValueMap new.
	map add: #foo -> 'bar'.
	map at: #baz put: 'xxx'.

	map associationsDo: [ :assoc |
		self assert: (assoc isKindOf: Association).
		self assert: assoc key isSymbol.
		self assert: assoc value isString ].

	self assert: map keys asArray equals: #( #foo #baz ).
	self assert: map values asArray equals: #( 'bar' 'xxx' ).

	keys := OrderedCollection new.
	map keysDo: [ :k | keys add: k ].
	self assert: keys asArray equals: #( #foo #baz )
]

{ #category : #'tests - failing' }
ValueMapTest >> testExampleSource [
	self assert: ValueMap example asSource equals:
'((ValueMap new: 17)
	add: #title -> ''ValueMap class example with examples of all basic values'';
	add: #boolean -> true;
	add: #character -> $A;
	add: #symbol -> #mySymbol;
	add: #string -> ''with umlauts and euro: äöüß€'';
	add: #schlüssel -> nil;
	add: #integer -> 42;
	add: #number -> 3.14;
	add: #date -> (Date d: 27 m: 3 y: 2022);
	add: #time -> (Time h: 12 m: 18);
	add: #timestamp -> (Timestamp d: 27 m: 3 y: 2022 h: 12 m: 18);
	add: #duration -> (Duration nanoseconds: 300000000000);
	add: #color -> (ColorValue fromBytesRed: 127 green: 0 blue: 0);
	add: #knownColor -> ColorValue red;
	add: #array -> #(#one ''two'' 3);
	add: #bytearray -> #[1 2 3];
	add: #valuemap -> (ValueMap
		with: #test -> true
		with: #two -> 2
		with: #none -> nil);
	yourself)'
]

{ #category : #tests }
ValueMapTest >> testIndexOf [
	| od |
	od := ValueMap new.
	self assert: od isEmpty.
	self assert: (od indexOf: #foo) isZero.
	od add: #foo -> 'bar'.
	self assert: od size equals: 1.
	self assert: (od indexOf: #foo) equals: 1.
	self assert: (od indexOf: #baz) isZero.
	od at: #baz put: 'xxx'.
	self assert: od size equals: 2.
	self assert: (od indexOf: #baz) equals: 2
]

{ #category : #tests }
ValueMapTest >> testIndexedAccess [

	| map |
	map := ValueMap new.
	map add: #foo -> 'bar'.
	self assert: map size equals: 1.
	self assert: (map atIndex: 1) equals: (#foo -> 'bar').
	self should: [map atIndex: 0] raise: Error.
	self should: [map atIndex: 2] raise: Error.
	self should: [map atIndex: #key] raise: Error.
	self should: [map atIndex: '1'] raise: Error
]

{ #category : #tests }
ValueMapTest >> testKeyedAccess [

	| map |
	map := ValueMap new.
	map add: #foo -> 'bar'.
	map at: #baz put: 'xxx'.
	self assert: map size equals: 2.
	self assert: (map at: #foo) equals: 'bar'.
	self assert: (map at: #baz) equals: 'xxx'.
	self should: [map at: #bar] raise: KeyNotFound.
	self assert: (map at: #bar ifAbsent: [nil]) isNil
]

{ #category : #tests }
ValueMapTest >> testReadBackAllTestInstances [

	(ValueMap class organization listAtCategoryNamed: (ValueMap class whichCategoryIncludesSelector: #example)) do: [:sel |
		| inst readInst |
		inst := ValueMap perform: sel.
		self shouldnt: [readInst := Object compiler evaluate: inst asSource] raise: Error.
		self assert: inst asSource equals: readInst asSource]
]

{ #category : #tests }
ValueMapTest >> testRemoving [

	| map |
	map := ValueMap new.
	self assert: map isEmpty.
	self should: [map removeKey: #foo] raise: KeyNotFound.
	self shouldnt: [map removeKey: #foo ifAbsent: nil] raise: KeyNotFound.
	self assert: (map removeKey: #foo ifAbsent: nil) isNil.
	map add: #foo -> 'bar'.
	self assert: map size equals: 1.
	self assert: map keys asArray equals: #(#foo).
	self assert: (map removeKey: #foo) equals: 'bar'.
	self assert: map size equals: 0.
	self assert: map keys asArray equals: #().
	map add: #foo -> 'bar'.
	map at: #baz put: 'xxx'.
	self assert: map size equals: 2.
	self assert: map keys asArray equals: #(#foo #baz).
	self should: [map removeKey: #zzz] raise: KeyNotFound.
	self shouldnt: [map removeKey: #zzz ifAbsent: nil] raise: KeyNotFound.
	self assert: map size equals: 2.
	self assert: map keys asArray equals: #(#foo #baz).
	self assert: (map removeKey: #foo) equals: 'bar'.
	self assert: map size equals: 1.
	self assert: map keys asArray equals: #(#baz)
]
