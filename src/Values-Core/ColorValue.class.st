"
A color value
"
Class {
	#name : #ColorValue,
	#superclass : #Color,
	#category : #'Values-Core-Colors'
}

{ #category : #'accessing - defaults' }
ColorValue class >> black [

	^ super black asColorValue
]

{ #category : #'accessing - defaults' }
ColorValue class >> blue [

	^ super blue asColorValue
]

{ #category : #'accessing - defaults' }
ColorValue class >> cyan [

	^ super cyan asColorValue
]

{ #category : #'instance creation' }
ColorValue class >> fromByte: anInteger [

	^ self fromBytes: (ByteArray new: 3 withAll: anInteger)
]

{ #category : #'instance creation' }
ColorValue class >> fromBytes: threeBytes [
	
	^ self fromBytesRed: threeBytes first green: (threeBytes at: 2) blue: threeBytes last
]

{ #category : #'instance creation' }
ColorValue class >> fromBytesRed: redByte green: greenByte blue: blueByte [

	^ self red: redByte / 255 green: greenByte / 255 blue: blueByte / 255
]

{ #category : #'accessing - defaults' }
ColorValue class >> green [

	^ super green asColorValue
]

{ #category : #'accessing - defaults' }
ColorValue class >> magenta [

	^ super magenta asColorValue
]

{ #category : #accessing }
ColorValue class >> namedValueNames [
	"The selection is the common set of color names with identical colors in VW and Squeak/Pharo
	The colors are all variations of min and max of the 3 components"

	<script: 'self namedValueNames inspect'>
	
	^ #( #black #white #red #green #blue #cyan #magenta #yellow )
]

{ #category : #'instance creation' }
ColorValue class >> new [

	^ self basicNew
]

{ #category : #'accessing - defaults' }
ColorValue class >> red [

	^ super red asColorValue
]

{ #category : #'instance creation' }
ColorValue class >> red: r green: g blue: b [

	^ self r: r g: g b: b
]

{ #category : #'accessing - defaults' }
ColorValue class >> white [

	^ super white asColorValue
]

{ #category : #'accessing - defaults' }
ColorValue class >> yellow [

	^ super yellow asColorValue
]

{ #category : #converting }
ColorValue >> asByteArray [

	^ ByteArray
		with: (self red * 255) truncated
		with: (self green * 255) truncated
		with: (self blue * 255) truncated
]

{ #category : #converting }
ColorValue >> asColorValue [

	^ self
]

{ #category : #converting }
ColorValue >> asGrayValue [
	"<Number>
	between 0.0 (Black) and 1.0 (White) suitable for PDF DeviceGray"

	^ self brightness
]

{ #category : #converting }
ColorValue >> rgbIndex [
	"<Integer>
	Three 8 bit RGB numbers interpreted as number for ordering"

	^ self asByteArray inject: 0 into: [:num :byte | (num bitShift: 8) + byte ]
]
