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
