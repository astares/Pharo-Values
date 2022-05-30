Class {
	#name : #ValueTest,
	#superclass : #TestCase,
	#category : #'Values-Core-Tests-Base'
}

{ #category : #'tests - extensions' }
ValueTest >> testIsEmpty [

	self
		assert: Value new isEmpty;
		deny: Value new isNotEmpty
]

{ #category : #'tests - extensions' }
ValueTest >> testIsEqualValue [

	self
		assert: (1 isEqualValue: 1); 
		assert: (1.0 isEqualValue: 1.0);
		assert: (Boolean isEqualValue: Boolean);
		assert: (Color red isEqualValue: Color red);
		assert: (ColorValue white isEqualValue: ColorValue white)
]

{ #category : #'tests - extensions' }
ValueTest >> testMutability [

	| a |
	a := #[6 6 6] copy.
	self assert: a first equals: 6.
	a beMutable. 
	a at: 1 put: 4.
	
	self assert: a first equals: 4.
	a beImmutable. 
	self should: [ a at: 1 put: 6 ] raise: ModificationForbidden
]
