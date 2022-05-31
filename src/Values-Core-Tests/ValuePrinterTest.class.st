"
Tests for the source strings of Values, see `ValuePrinter`
"
Class {
	#name : #ValuePrinterTest,
	#superclass : #TestCase,
	#category : #'Values-Core-Tests-Base'
}

{ #category : #tests }
ValuePrinterTest >> testArray [

	self assert: Array new asSource equals: '#()'.
	self assert: #( 1 2 3 4 ) asSource equals: '#(1 2 3 4)'.
	self
		assert: #( 1 2 3 4 5 6 7 8 9 10 ) asSource
		equals: '#(1 2 3 4 5 6 7 8 9 10)'.
	self
		assert: (Array
				 with: 1
				 with: 2
				 with: 3
				 with: 4) asSource
		equals: '#(1 2 3 4)'.
	self
		assert:
			(Array with: 1 with: (Date d: 7 m: 7 y: 2007) with: ColorValue red)
				asSource
		equals: '(Array
	with: 1
	with: (Date d: 7 m: 7 y: 2007)
	with: ColorValue red)'.
	self
		assert:
		(#( 1 2 3 4 ) , (Array with: (Date d: 7 m: 7 y: 2007))) asSource
		equals: '((OrderedCollection new: 5)
	add: 1;
	add: 2;
	add: 3;
	add: 4;
	add: (Date d: 7 m: 7 y: 2007);
	yourself)'.
	self
		assert: (Array
				 with: TestValue example
				 with: (Date d: 7 m: 7 y: 2007)
				 with: ColorValue red) asSource
		equals: '(Array
	with: (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x ''name'')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> ''string''))
	with: (Date d: 7 m: 7 y: 2007)
	with: ColorValue red)'
]

{ #category : #tests }
ValuePrinterTest >> testArraySource [

	self
		assert: (TestValue
				 constant: #constantSymbol
				 optional: #optionalSymbol
				 array: #( 1 #a $x 'name' )
				 dictionary: (ValueMap with: 1 -> #symbol with: #key -> 'string'))
				asSource
		equals: '(TestValue
	constant: #constantSymbol
	optional: #optionalSymbol
	array: #(1 #a $x ''name'')
	dictionary: (ValueMap
		with: 1 -> #symbol
		with: #key -> ''string''))'
]

{ #category : #tests }
ValuePrinterTest >> testBoolean [

	self assert: true asSource equals: 'true'.
	self assert: false asSource equals: 'false'
]

{ #category : #tests }
ValuePrinterTest >> testColorValue [

	self assert: ColorValue new isEmpty.
	self assert: ColorValue red asSource equals: 'ColorValue red'.
	self
		assert: (ColorValue fromBytesRed: 255 green: 0 blue: 0) asSource
		equals: 'ColorValue red'.
	self
		assert: (ColorValue fromBytesRed: 255 green: 0 blue: 10) asSource
		equals: '(ColorValue fromBytesRed: 255 green: 0 blue: 10)'
]

{ #category : #tests }
ValuePrinterTest >> testDate [

	self
		assert: (Date d: 7 m: 7 y: 2007) asSource
		equals: '(Date d: 7 m: 7 y: 2007)'
]

{ #category : #tests }
ValuePrinterTest >> testDictionary [

	| dict |
	self assert: ValueMap new asSource equals: 'ValueMap new'.
	dict := ValueMap with: 1 -> 75 with: #b -> $x.
	self assert: dict asSource equals: '(ValueMap
	with: 1 -> 75
	with: #b -> $x)'
]

{ #category : #tests }
ValuePrinterTest >> testDictionarySource [

	self
		assert: (TestValue
				 constant: #constantSymbol
				 optional: #optionalSymbol
				 array: #( 1 #a $x 'name' )
				 dictionary: (ValueMap with: 1 -> #symbol with: #key -> 'string'))
				asSource
		equals: '(TestValue
	constant: #constantSymbol
	optional: #optionalSymbol
	array: #(1 #a $x ''name'')
	dictionary: (ValueMap
		with: 1 -> #symbol
		with: #key -> ''string''))'.
	self
		assert: (TestValue constant: #Haider) asSource
		equals: '(Testvalue constant: #Haider)'
]

{ #category : #tests }
ValuePrinterTest >> testDictionaryWithValues [

	| dict |
	dict := ValueMap
		        with: 1 -> TestValue example
		        with: TestValue example -> $x.
	self assert: dict asSource equals: '(Valuemap
	with: 1 -> (TestValue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x ''name'')
		dictionary: (ValueMap
			with: 1 -> #symbol
			with: #key -> ''string''))
	with: (TestValue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x ''name'')
		dictionary: (ValueMap
			with: 1 -> #symbol
			with: #key -> ''string'')) -> $x)'
]

{ #category : #tests }
ValuePrinterTest >> testDuration [

	self
		assert: 5 minutes asSource
		equals: '(Duration nanoseconds: 300000000000)'
]

{ #category : #tests }
ValuePrinterTest >> testLiteralArrays [

	self assert: #( 1 2 10 20 100 ) asSource equals: '#(1 2 10 20 100)'
]

{ #category : #tests }
ValuePrinterTest >> testLongDictionary [

	| dict |
	dict := ValueMap new.
	dict at: 1 put: 75.
	dict at: #b put: $x.
	dict at: 42 put: 'Hello'.
	dict at: 'abc' put: 32.
	dict at: 2 put: #( #String ).
	dict at: true put: #hi.
	self assert: dict asSource equals: '((ValueMap new: 6)
	add: 1 -> 75;
	add: #b -> $x;
	add: 42 -> ''Hello'';
	add: ''abc'' -> 32;
	add: 2 -> #(#String);
	add: true -> #hi;
	yourself)'
]

{ #category : #tests }
ValuePrinterTest >> testNumbers [

	self assert: 42 asSource equals: '42'.
	self assert: 429999999939333 asSource equals: '429999999939333'.
	self assert: 2.5 asSource equals: '2.5'
	"only VW, not Gemstone
	self assert: 2.5e7 asSource = '2.5e7'.
	self assert: 2.5e-7 asSource = '2.5e-7'.
	self assert: 2.5d137 asSource = '2.5d137'.
	self assert: 2.5d-137 asSource = '2.5d-137'.
	self assert: 25s7 asSource = '25.0000000s'.
	self assert: (2 / 5) asSource = '(2 / 5)'.
	"
]

{ #category : #tests }
ValuePrinterTest >> testOptionalConstantSource [

	self
		assert: (TestValue
				 constant: #constantSymbol
				 optional: #optionalSymbol
				 array: #( 1 #a $x 'name' )
				 dictionary: (ValueMap with: 1 -> #symbol with: #key -> 'string'))
				asSource
		equals: '(TestValue
	constant: #constantSymbol
	optional: #optionalSymbol
	array: #(1 #a $x ''name'')
	dictionary: (Valuemap
		with: 1 -> #symbol
		with: #key -> ''string''))'.
	self
		assert: (TestValue
				 constant: #constantSymbol
				 optional: #optionalSymbol
				 array: #( 1 #a $x 'name' )) asSource
		equals:
		'(Testvalue constant: #constantSymbol optional: #optionalSymbol array: #(1 #a $x ''name''))'.
	self
		assert:
			(TestValue constant: #constantSymbol optional: #optionalSymbol)
				asSource
		equals:
		'(Testvalue constant: #constantSymbol optional: #optionalSymbol)'.
	self
		assert: (TestValue constant: #constantSymbol) asSource
		equals: '(TestValue constant: #constantSymbol)'
]

{ #category : #tests }
ValuePrinterTest >> testPoint [

	self assert: (1 @ 2) asSource equals: '1 @ 2'.
	self
		assert: (1 @ (Date d: 7 m: 7 y: 2007)) asSource
		equals: '1 @ (Date d: 7 m: 7 y: 2007)'
]

{ #category : #tests }
ValuePrinterTest >> testTime [

	self
		assert: (Time h: 7 m: 27 s: 13) asSource
		equals: '(Time h: 7 m: 27 s: 13)'.
	self
		assert: (Time h: 7 m: 27 s: 0) asSource
		equals: '(Time h: 7 m: 27)'.
	self assert: (Time h: 7 m: 27) asSource equals: '(Time h: 7 m: 27)'.
	self assert: (Time h: 7 m: 0 s: 0) asSource equals: '(Time h: 7)'.
	self assert: (Time h: 7 m: 0) asSource equals: '(Time h: 7)'.
	self assert: (Time h: 7) asSource equals: '(Time h: 7)'.
	self assert: (Time h: 0) asSource equals: 'Time zero'.
	self assert: Time zero asSource equals: 'Time zero'
]

{ #category : #tests }
ValuePrinterTest >> testTimestamp [
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27 s: 13) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27 s: 13)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27 s: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 0 s: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007) asSource = '(Timestamp d: 15 m: 7 y: 2007)'
]
