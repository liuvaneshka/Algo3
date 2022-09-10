!classDefinition: #Arthas category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #Arthas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arthas class' category: 'AtaquesFantasticosLIU'!
Arthas class
	instanceVariableNames: 'arma enemigo1 enemigo2'!

!Arthas class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 23:47:18'!
atacar
	self atacarA: enemigo1.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 01:59:59'!
atacarA: combatienteASerAtacado
	
	arma = Hacha ifTrue:[combatienteASerAtacado recibirHachazo].
		
	arma = Espada ifTrue:[combatienteASerAtacado recibirApunialada].
	
	arma = Punio ifTrue:[combatienteASerAtacado recibirUnPunetazo].
	
	! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'LV 9/6/2022 16:28:42'!
enemigos: enemigos 
	enemigo1 := enemigos first. "aca esta atacando a un enemigo"! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'LV 9/6/2022 17:54:21'!
focalizarEnElMasHerido
	self shouldBeImplemented.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'LV 9/4/2022 20:57:06'!
usarEspada
	arma := Espada.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'LV 9/4/2022 19:27:22'!
usarHacha
	arma := Hacha.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'LV 9/4/2022 20:08:48'!
usarPunio
	arma := Punio.! !


!Arthas class methodsFor: '--** private fileout/in **--' stamp: 'LV 9/10/2022 20:32:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	arma := Punio.
	enemigo1 := Olgra.
	enemigo2 := nil.! !


!classDefinition: #CombatientesTest category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosLIU'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'para completar' stamp: 'LV 9/4/2022 19:03:57'!
combatienteHumanoArthas
	^Arthas.! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'LV 9/4/2022 12:09:51'!
combatienteOrcoMankrik
	^Mankrik! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'LV 9/5/2022 01:59:12'!
combatienteOrcoOlgra
	^Olgra! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'LV 9/5/2022 02:24:51'!
comenzarUnNuevoCombate
	self combatienteOrcoOlgra poneTuVidaEn20.
	self combatienteOrcoMankrik poneTuVidaEn20.
	Arthas usarPunio.! !


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'LV 9/4/2022 17:07:42'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'LV 9/4/2022 18:38:10'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'LV 9/4/2022 18:48:32'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'LV 9/4/2022 21:42:21'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'LV 9/4/2022 23:50:11'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'LV 9/4/2022 23:50:47'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:18'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:56:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas usarEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !


!classDefinition: #Enemigos category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #Enemigos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!


!classDefinition: #Espada category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #Espada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!


!classDefinition: #Hacha category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #Hacha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!


!classDefinition: #Mankrik category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #Mankrik
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mankrik class' category: 'AtaquesFantasticosLIU'!
Mankrik class
	instanceVariableNames: 'puntosDeVida'!

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:13:10'!
poneTuVidaEn20
	puntosDeVida := 20.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:13:40'!
puntosDeVida
	^puntosDeVida.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:14:03'!
recibirApunialada
	puntosDeVida := puntosDeVida - 8.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:14:14'!
recibirHachazo
	puntosDeVida := puntosDeVida - 10.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:14:28'!
recibirUnPunetazo
	puntosDeVida := puntosDeVida - 2.
	puntosDeVida = 24 ifTrue:[puntosDeVida := 20].! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:15:09'!
usarArmaduraDeCuero
	puntosDeVida := puntosDeVida + 2.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:15:23'!
usarArmaduraDeMetal
	puntosDeVida := puntosDeVida + 6. 	! !


!Mankrik class methodsFor: '--** private fileout/in **--' stamp: 'LV 9/10/2022 20:32:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 20.! !


!classDefinition: #Olgra category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #Olgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Olgra class' category: 'AtaquesFantasticosLIU'!
Olgra class
	instanceVariableNames: 'puntosDeVida armadura'!

!Olgra class methodsFor: 'as yet unclassified' stamp: 'LV 9/4/2022 00:29:19'!
poneTuVidaEn20
	puntosDeVida := 20.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'LV 9/4/2022 18:36:41'!
puntosDeVida
	^puntosDeVida .! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 01:37:10'!
recibirApunialada
	puntosDeVida := puntosDeVida - 8.
! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'LV 9/4/2022 19:35:35'!
recibirHachazo
	puntosDeVida := puntosDeVida - 10.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:09:21'!
recibirUnPunetazo
	puntosDeVida := puntosDeVida - 2.
	puntosDeVida = 24 ifTrue:[puntosDeVida := 20].

	

	! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'LV 9/4/2022 23:48:50'!
usarArmaduraDeCuero
	puntosDeVida := puntosDeVida + 2.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'LV 9/5/2022 02:09:09'!
usarArmaduraDeMetal
	puntosDeVida := puntosDeVida + 6. 	
! !


!Olgra class methodsFor: '--** private fileout/in **--' stamp: 'LV 9/10/2022 20:32:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 18.
	armadura := nil.! !


!classDefinition: #Punio category: 'AtaquesFantasticosLIU'!
DenotativeObject subclass: #Punio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosLIU'!

Arthas initializeAfterFileIn!
Mankrik initializeAfterFileIn!
Olgra initializeAfterFileIn!