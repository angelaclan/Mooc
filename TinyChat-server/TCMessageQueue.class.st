Class {
	#name : #TCMessageQueue,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #'TinyChat-server'
}

{ #category : #accessing }
TCMessageQueue >> add: aMessage [
	messages add: aMessage
]

{ #category : #'as yet unclassified' }
TCMessageQueue >> formattedMessagesFrom: aMessageNumber [
	^ String
		streamContents: [ :formattedMessagesStream | 
			(self listFrom: aMessageNumber)
				do: [ :m | formattedMessagesStream nextPutAll: m printString ] ]
]

{ #category : #initialize }
TCMessageQueue >> initialize [ 
super initialize.
messages := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
TCMessageQueue >> listFrom: anIndex [
	^ (anIndex > 0 and: [ anIndex <= messages size ])
		ifTrue: [ messages copyFrom: anIndex to: messages size ]
		ifFalse: [ #() ]
]

{ #category : #accessing }
TCMessageQueue >> rest [
	messages removeAll
]

{ #category : #accessing }
TCMessageQueue >> size [
	^ messages size
]