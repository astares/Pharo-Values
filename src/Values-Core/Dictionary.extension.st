Extension { #name : #Dictionary }

{ #category : #'*Values-Core' }
Dictionary >> keysForPrinting [

	^ [ self keys asSortedCollection ]
		  on: Error
		  do: [ :ex | ex return: self keys ]
]

{ #category : #'*Values-Core' }
Dictionary >> printArgumentsWith: aPrinter [

	^ self keysForPrinting collect: [ :key |
		  DictionaryPrintArgument
			  name: (key printValueWith: aPrinter)
			  value: ((self at: key) printValueWith: aPrinter) ]
]

{ #category : #'*Values-Core' }
Dictionary >> printValueWith: printer [

	^ DictionaryPrintValue arguments: (self printArgumentsWith: printer)
]
