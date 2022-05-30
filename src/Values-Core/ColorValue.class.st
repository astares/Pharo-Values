"
A color value
"
Class {
	#name : #ColorValue,
	#superclass : #Color,
	#category : #'Values-Core-Colors'
}

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

{ #category : #'instance creation' }
ColorValue class >> red: r green: g blue: b [

	^ self r: r g: g b: b
]

{ #category : #converting }
ColorValue >> asByteArray [

	^ ByteArray
		with: (self red * 255) truncated
		with: (self green * 255) truncated
		with: (self blue * 255) truncated
]

{ #category : #converting }
ColorValue >> asGrayValue [
	"<Number>
	between 0.0 (Black) and 1.0 (White) suitable for PDF DeviceGray"

	^ self brightness
]
