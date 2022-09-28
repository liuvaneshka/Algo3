!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:32'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:10'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:43'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:11'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:28'!
test10AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:42'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:04:04'!
test14NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:05:06'!
test15NegationOfFraccionIsCorrect

	self assert: (Numero with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'lvg 9/28/2022 13:12:34'!
setUp

	zero := Numero with: 0.
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf :=  Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'lvg 9/28/2022 13:00:05'!
* aMultiplier 

	^ self subclassResponsibility .
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'lvg 9/28/2022 12:29:26'!
+ anAdder 
	
	self subclassResponsibility .
	
	"double dispatch"! !

!Numero methodsFor: 'arithmetic operations' stamp: 'lvg 9/28/2022 13:17:39'!
/ aDivisor 
	
	^Fraccion with: self over: aDivisor! !

!Numero methodsFor: 'arithmetic operations' stamp: 'lvg 9/28/2022 13:00:12'!
negated
	
	self subclassResponsibility.
! !


!Numero methodsFor: 'testing' stamp: 'lvg 9/28/2022 11:32:30'!
isNegative
	
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'lvg 9/28/2022 11:39:14'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'lvg 9/28/2022 11:39:04'!
isZero

	self subclassResponsibility ! !




!Numero methodsFor: 'printing' stamp: 'lvg 9/28/2022 13:03:50'!
printOn: aStream
	
	self subclassResponsibility .! !


!Numero methodsFor: 'comparing' stamp: 'lvg 9/28/2022 13:03:04'!
= anObject

	self subclassResponsibility.
! !

!Numero methodsFor: 'comparing' stamp: 'lvg 9/28/2022 13:01:02'!
hash
	
	self subclassResponsibility ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'lvg 9/28/2022 11:47:02'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^Entero new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'lvg 9/28/2022 11:47:15'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 12:58:08'!
* aMultiplier 

	^self class with: value * aMultiplier integerValue.
! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 12:25:21'!
+ anAdder 
	
	
	^self class with: value + anAdder integerValue.
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:52:23'!
// aDivisor 
	
		^self class with: value // aDivisor integerValue.
		
! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 12:35:29'!
= anObject

	^(anObject isKindOf: self class) and: [value = anObject integerValue] 
! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:50:15'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue).
		! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 13:01:23'!
hash
	
	^value hash! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:35:13'!
initializeWith: aValue
	
	value := aValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:39:51'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:31:12'!
isNegative
	
	^value < 0 ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:32:55'!
isOne

	^value = 1! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:33:46'!
isZero
	 ^value = 0! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 12:31:42'!
negated
	
	^self * (self class with: -1).! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:41:28'!
printOn: aStream
	
	aStream print: value.
	
! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 12:59:20'!
* aMultiplier 

	^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator) .
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 13:10:00'!
+ anAdder

	| newNumerator newDenominator |
		
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
		
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 13:18:01'!
/ aDivisor 
	
	^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 12:36:19'!
= anObject

	^(anObject isKindOf: self class) and:[ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 13:14:31'!
denominator

	^denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 13:01:42'!
hash

	^(numerator hash / denominator hash) hash.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 13:15:03'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:31:38'!
isNegative
	
	^denominator < 0 .! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:33:17'!
isOne

	 ^false .! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:34:40'!
isZero

	^false.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 12:32:15'!
negated
	
	^self class with: numerator * (self class with: -1) over: denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 13:14:38'!
numerator

	^numerator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lvg 9/28/2022 11:42:25'!
printOn: aStream
	
	[ aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ].! !
