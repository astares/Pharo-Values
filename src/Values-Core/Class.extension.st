Extension { #name : #Class }

{ #category : #'*Values-Core' }
Class >> isInScope: aClass [
	"<Boolean>
	true if aClass is visible by the receiver - aClass can be used in the source without namespace qualifier.
	false when aClass cannot be seen by the receiver - use the fullName"
	"All classes are globally visible in Pharo"

	^ true
]

{ #category : #'*Values-Core' }
Class >> nameRelativeTo: targetClass [
	"<String>"
	"self nameRelativeTo: Object"
	"there are no namespaces in Pharo"

	^self name asString
]
