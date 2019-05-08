; Sun May 05 12:50:41 CEST 2019
;
;+ (version "3.3.1")
;+ (build "Build 430")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Grasas
;+		(comment "Nombre de grasas")
		(type INTEGER)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Proteines
;+		(comment "Nombre de proteines")
		(type INTEGER)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Valor_energetic%28kcal%29
;+		(comment "Nombre de kilocaloríes")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Ingredient_general
;+		(comment "Ingredient general al que fa referència aquest ingredient concret.")
		(type INSTANCE)
;+		(allowed-classes InfoIngredient)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Apat
;+		(comment "Indica si pot ser un plat per esmorzar, dinar o sopar (o diversos)")
		(type SYMBOL)
		(allowed-values Esmorzar Dinar Sopar)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot GrauRecomanacio
;+		(comment "Ens indica com de recomanable es que una persona en mengui")
		(type INTEGER)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Familia
;+		(comment "Indica a la familia general d'aliments a la que pertany.")
		(type SYMBOL)
		(allowed-values Carn Peix Verdura Llegum L%C3%A0ctic Fruita Fruits_secs Ous Cereals)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Sopar
;+		(comment "Indica si és un plat per a un sopar")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Tipus_nutrient
;+		(comment "Indica el tipus de nutrient que estem tractant (dins de tota la familia general de nutrients i micronutrients).\n\nEls greixos mono o poliinsaturats són positius per la alimentació. Els greixos trans no.")
		(type SYMBOL)
		(allowed-values Aigua Minerals Proteines Vitamines Fibra Hidrats_de_carboni Greixos_mono_o_poliinsat Greixos_trans)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Hidrats+de+carboni
;+		(comment "Nombre d'hidrats de carboni")
		(type INTEGER)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Nutrients
;+		(comment "Aqui contenim les instàncies dels diferents nutrients que conté")
		(type INSTANCE)
;+		(allowed-classes Nutrient)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot Ingredients
;+		(comment "Ingredients principals del plat")
		(type INSTANCE)
;+		(allowed-classes IngredientConcret)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Dinar
;+		(comment "Indica si és un plat per a un dinar")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Esmorzar
;+		(comment "Indica si és un plat per a un esmorzar")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Cocci%C3%B3
;+		(comment "Manera com cuinem el ingredient")
		(type SYMBOL)
		(allowed-values Planxa Al_forn Fregit Fresc Saltejat Bullit)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Temporada
		(type SYMBOL)
		(allowed-values Hivern Primavera Estiu Tardor)
		(cardinality 1 4)
		(create-accessor read-write))
	(single-slot Nom_ingredient
;+		(comment "Nom del ingredient")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Quantitat_nutrient
;+		(comment "Valor en grams de nutrient")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Quantitat
;+		(comment "Quantitat que porta d'un ingredient general")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Nom
;+		(comment "Nom del plat")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Tipus_plat
;+		(comment "Indica si el plat és un 1r, 2n, postres o beguda (pot ser varios)")
		(type SYMBOL)
		(allowed-values 1r 2n Postres Beguda)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

		(defclass Plat
			(is-a USER)
			(role concrete)
			(multislot Apat
		;+		(comment "Indica si pot ser un plat per esmorzar, dinar o sopar (o diversos)")
				(type SYMBOL)
				(allowed-values Esmorzar Dinar Sopar)
				(cardinality 1 ?VARIABLE)
				(create-accessor read-write))
			(single-slot GrauRecomanacio
		;+		(comment "Ens indica com de recomanable es que una persona en mengui")
				(type INTEGER)
				(default 0)
		;+		(cardinality 1 1)
				(create-accessor read-write))
			(single-slot Nom
		;+		(comment "Nom del plat")
				(type STRING)
		;+		(cardinality 0 1)
				(create-accessor read-write))
			(multislot Tipus_plat
		;+		(comment "Indica si el plat és un 1r, 2n, postres o beguda (pot ser varios)")
				(type SYMBOL)
				(allowed-values 1r 2n Postres Beguda)
				(cardinality 1 ?VARIABLE)
				(create-accessor read-write))
			(multislot Ingredients
		;+		(comment "Ingredients principals del plat")
				(type INSTANCE)
		;+		(allowed-classes IngredientConcret)
				(cardinality 1 ?VARIABLE)
				(create-accessor read-write)))

(defclass InfoIngredient
	(is-a USER)
	(role concrete)
	(single-slot Familia
;+		(comment "Indica a la familia general d'aliments a la que pertany.")
		(type SYMBOL)
		(allowed-values Carn Peix Verdura Llegum L%C3%A0ctic Fruita Fruits_secs Ous Cereals)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nom_ingredient
;+		(comment "Nom del ingredient")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Valor_energetic%28kcal%29
;+		(comment "Nombre de kilocaloríes")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Temporada
		(type SYMBOL)
		(allowed-values Hivern Primavera Estiu Tardor)
		(cardinality 1 4)
		(create-accessor read-write))
	(multislot Nutrients
;+		(comment "Aqui contenim les instàncies dels diferents nutrients que conté")
		(type INSTANCE)
;+		(allowed-classes Nutrient)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass IngredientConcret
	(is-a USER)
	(role concrete)
	(single-slot Quantitat
;+		(comment "Quantitat que porta d'un ingredient general")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Cocci%C3%B3
;+		(comment "Manera com cuinem el ingredient")
		(type SYMBOL)
		(allowed-values Planxa Al_forn Fregit Fresc Saltejat Bullit)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Ingredient_general
;+		(comment "Ingredient general al que fa referència aquest ingredient concret.")
		(type INSTANCE)
;+		(allowed-classes InfoIngredient)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Nutrient
	(is-a USER)
	(role concrete)
	(single-slot Quantitat_nutrient
;+		(comment "Valor en grams de nutrient")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Tipus_nutrient
;+		(comment "Indica el tipus de nutrient que estem tractant (dins de tota la familia general de nutrients i micronutrients).\n\nEls greixos mono o poliinsaturats són positius per la alimentació. Els greixos trans no.")
		(type SYMBOL)
		(allowed-values Aigua Minerals Proteines Vitamines Fibra Hidrats_de_carboni Greixos_mono_o_poliinsat Greixos_trans)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					INSTANCIAS					 		---------- 								INSTANCIAS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

(definstances instances

([IA_Instance_1] of  Plat
	(Apat Dinar Sopar)
	(Ingredients [IA_Instance_2])
	(Nom "Arros a la cubana")
	(Tipus_plat 1r 2n))

([IA_Instance_7] of  Plat

	(Apat Esmorzar)
	(Ingredients [IA_Instance_8])
	(Nom "Maduixes")
	(Tipus_plat 1r 2n))


([IA_Instance_2] of  IngredientConcret

	(Cocci%C3%B3 Bullit)
	(Ingredient_general [IA_Instance_3])
	(Quantitat 100))

([IA_Instance_8] of  IngredientConcret

	(Cocci%C3%B3 Bullit)
	(Ingredient_general [IA_Instance_6])
	(Quantitat 100))

([IA_Instance_3] of  InfoIngredient
	(Familia Carn)
	(Nom_ingredient "Arros")
	(Nutrients [IA_Instance_4])
	(Temporada Hivern)
	(Valor_energetic%28kcal%29 100))

([IA_Instance_6] of  InfoIngredient
    (Familia Fruita)
    (Nom_ingredient "Maduixa")
    (Nutrients [IA_Instance_4])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 100))


([IA_Instance_4] of  Nutrient

	(Quantitat_nutrient 10)
	(Tipus_nutrient Hidrats_de_carboni))


;;; Paella

([P0] of  Plat

    (Apat Dinar Sopar)
    (Ingredients  [IP0_0] [IP0_1] [IP0_2] [IP0_3] [IP0_4] [IP0_5] [IP0_6])
    (Nom "Paella valenciana")
    (Tipus_plat 1r 2n))

;;400 arros
([IP0_0] of  IngredientConcret

    (Cocci%C3%B3 Bullit)
    (Ingredient_general [I0])
    (Quantitat 400))

([I0] of  InfoIngredient
    (Familia Cereals)
    (Nom_ingredient "Arros")
    (Nutrients [I0_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 130))

([I0_N0] of  Nutrient

    (Quantitat_nutrient 0.3)
    (Tipus_nutrient Greixos_mono_o_poliinsat))


;;500 pollastre
([IP0_1] of  IngredientConcret

    (Cocci%C3%B3 Al_forn)
    (Ingredient_general [I1])
    (Quantitat 500))

([I1] of  InfoIngredient
    (Familia Carn)
    (Nom_ingredient "Pollastre sencer")
    (Nutrients [I1_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 239))

([I1_N0] of  Nutrient

    (Quantitat_nutrient 0.3)
    (Tipus_nutrient Greixos_mono_o_poliinsat))


;;225 llagostins
([IP0_2] of  IngredientConcret

    (Cocci%C3%B3 Bullit)
    (Ingredient_general [I2])
    (Quantitat 225))

([I2] of  InfoIngredient
    (Familia Marisc)
    (Nom_ingredient "Llagostins")
    (Nutrients [I2_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 88))

([I2_N0] of  Nutrient

    (Quantitat_nutrient 1.8)
    (Tipus_nutrient Greixos_mono_o_poliinsat))


;;250 molusc
([IP0_3] of  IngredientConcret

    (Cocci%C3%B3 Fresc)
    (Ingredient_general [I3])
    (Quantitat 250))

([I3] of  InfoIngredient
    (Familia Cereals)
    (Nom_ingredient "Molusc")
    (Nutrients [I3_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 72))

([I3_N0] of  Nutrient

    (Quantitat_nutrient 1.96)
    (Tipus_nutrient Greixos_mono_o_poliinsat))


;;150 tomate
([IP0_4] of  IngredientConcret

    (Cocci%C3%B3 Fresc)
    (Ingredient_general [I4])
    (Quantitat 150))

([I4] of  InfoIngredient
    (Familia Vegetals)
    (Nom_ingredient "Tomaquet fresc")
    (Nutrients [I4_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 22.17))

([I4_N0] of  Nutrient

    (Quantitat_nutrient 0.21)
    (Tipus_nutrient Greixos_mono_o_poliinsat))


;;0.7 safrà
([IP0_5] of  IngredientConcret

    (Cocci%C3%B3 Fresc)
    (Ingredient_general [I5])
    (Quantitat 0.7))

([I5] of  InfoIngredient
    (Familia Cereals)
    (Nom_ingredient "Safrà")
    (Nutrients [I5_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 352))

([I5_N0] of  Nutrient

    (Quantitat_nutrient 5.85)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;200 calamar
([IP0_6] of  IngredientConcret

    (Cocci%C3%B3 Bullit)
    (Ingredient_general [I6])
    (Quantitat 200))

([I6] of  InfoIngredient
    (Familia Marisc)
    (Nom_ingredient "Calamar")
    (Nutrients [I6_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 80.40))

([I6_N0] of  Nutrient

    (Quantitat_nutrient 1.4)
    (Tipus_nutrient Greixos_mono_o_poliinsat))


;;; Macarrons tomàquet

([IP1] of  Plat

    (Apat Dinar Sopar)
    (Ingredients [IP1_0] [IP1_1] [IP1_2] [IP1_3] [IP1_4] [IP1_5])
    (Nom "Macarrons amb tomaquet")
    (Tipus_plat 1r 2n))

;;600 pasta
([IP1_0] of  IngredientConcret

    (Cocci%C3%B3 Bullit)
    (Ingredient_general [I7])
    (Quantitat 600))

([I7] of  InfoIngredient
    (Familia Cereals)
    (Nom_ingredient "Pasta")
    (Nutrients [I7_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 359))

([I7_N0] of  Nutrient

    (Quantitat_nutrient 1.58)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;50 mantega
([IP1_1] of  IngredientConcret

    (Cocci%C3%B3 Bullit)
    (Ingredient_general [I8])
    (Quantitat 50))

([I8] of  InfoIngredient
    (Familia Làctic)
    (Nom_ingredient "Mantega")
    (Nutrients [I8_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 897))

([I8_N0] of  Nutrient

    (Quantitat_nutrient 99.5)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;50 mozzarella
([IP1_2] of  IngredientConcret

    (Cocci%C3%B3 Bullit)
    (Ingredient_general [I9])
    (Quantitat 50))

([I9] of  InfoIngredient
    (Familia Làctic)
    (Nom_ingredient "Mozzarella")
    (Nutrients [I9_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 233))

([I9_N0] of  Nutrient

    (Quantitat_nutrient 16.1)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;250 tomaquet fregit
([IP1_3] of  IngredientConcret

    (Cocci%C3%B3 Fregit)
    (Ingredient_general [I10])
    (Quantitat 250))

([I10] of  InfoIngredient
    (Familia Làctic)
    (Nom_ingredient "Tomaquet fregit")
    (Nutrients [I10_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 87.6))

([I10_N0] of  Nutrient

    (Quantitat_nutrient 6.4)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;50 oli oliva
([IP1_4] of  IngredientConcret

    (Cocci%C3%B3 Fregit)
    (Ingredient_general [I11])
    (Quantitat 20))

([I11] of  InfoIngredient
    (Familia Làctic)
    (Nom_ingredient "Oli oliva")
    (Nutrients [I11_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 899))

([I11_N0] of  Nutrient

    (Quantitat_nutrient 99.9)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;30 ceba
([IP1_5] of  IngredientConcret

    (Cocci%C3%B3 Fregit)
    (Ingredient_general [I10])
    (Quantitat 250))

([I12] of  InfoIngredient
    (Familia Làctic)
    (Nom_ingredient "Ceba")
    (Nutrients [I12_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 31.85))

([I12_N0] of  Nutrient

    (Quantitat_nutrient 0.25)
    (Tipus_nutrient Greixos_mono_o_poliinsat))



;;; Flam

([IP2] of  Plat

    (Apat Esmorzar Dinar Sopar)
    (Ingredients [IP2_0] [IP2_1])
    (Nom "Flam")
    (Tipus_plat Postres ))

;;500 llet vaca
([IP2_0] of  IngredientConcret

    (Cocci%C3%B3 Fresc)
    (Ingredient_general [I13])
    (Quantitat 500))

([I13] of  InfoIngredient
    (Familia Lactic)
    (Nom_ingredient "Llet de vaca sencera")
    (Nutrients [I13_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 65.4))

([I13_N0] of  Nutrient

    (Quantitat_nutrient 3.8)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;240 ou gallina
([IP2_1] of  IngredientConcret

    (Cocci%C3%B3 Fresc)
    (Ingredient_general [I14])
    (Quantitat 240))

([I14] of  InfoIngredient
    (Familia Ous)
    (Nom_ingredient "Ou gallina")
    (Nutrients [I8_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 162))

([I14_N0] of  Nutrient

    (Quantitat_nutrient 12.1)
    (Tipus_nutrient Greixos_mono_o_poliinsat))

;;200 sucre blanc
([IP1_2] of  IngredientConcret

    (Cocci%C3%B3 Fresc)
    (Ingredient_general [I15])
    (Quantitat 200))

([I15] of  InfoIngredient
    (Familia Làctic)
    (Nom_ingredient "Sucre blanc")
    (Nutrients [I15_N0])
    (Temporada Hivern Primavera Estiu Tardor)
    (Valor_energetic%28kcal%29 399))

([I15_N0] of  Nutrient

    (Quantitat_nutrient 0.0)
    (Tipus_nutrient Greixos_mono_o_poliinsat))



)   ; cal aquest parentesis per acabar totes les instancies

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					TEMPLATES					 		---------- 								TEMPLATES
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;;; deftemplat para almacenar la informacion que se infiere del expediente

;INFORMACION PARA LA SOLUCION FINAL
;;; deftemplat para almacenar la informacion de la solucion final ordenada
;;; distinguimos entre tipos de platos. Los ordenamos y luego los iremos mezclando en orden

(deftemplate MAIN::solucionOrdenadaE "solucio final on ordenem tots els plats"
	(slot posicio (type INTEGER))
	(slot plat (type INSTANCE) (allowed-classes Plat))
)

(deftemplate MAIN::solucionOrdenadaDP "solucio final on ordenem tots els plats"
	(slot posicio (type INTEGER))
	(slot plat (type INSTANCE) (allowed-classes Plat))
)

(deftemplate MAIN::solucionOrdenadaDS "solucio final on ordenem tots els plats"
	(slot posicio (type INTEGER))
	(slot plat (type INSTANCE) (allowed-classes Plat))
)

(deftemplate MAIN::solucionOrdenadaSP "solucio final on ordenem tots els plats"
	(slot posicio (type INTEGER))
	(slot plat (type INSTANCE) (allowed-classes Plat))
)

(deftemplate MAIN::solucionOrdenadaSS "solucio final on ordenem tots els plats"
	(slot posicio (type INTEGER))
	(slot plat (type INSTANCE) (allowed-classes Plat))
)

(deftemplate MAIN::solucionOrdenadaP "solucio final on ordenem tots els plats"
	(slot posicio (type INTEGER))
	(slot plat (type INSTANCE) (allowed-classes Plat))
)


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					FUNCIONES					 		---------- 								EXTRAS
;;;-------------------------------------------------------------------------------------------------------------------------------------------------------

;;; Funcion para hacer una pregunta general
(deffunction MAIN::pregunta-general (?pregunta)
	(format t "%s" ?pregunta)
	(bind ?respuesta (read))
	?respuesta
)

;;; Funcion para hacer una pregunta con respuesta en un rango dado
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s? [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer una pregunta con un conjunto definido de valores de repuesta
(deffunction MAIN::pregunta-lista (?pregunta)
	(format t "%s" ?pregunta)
	(bind ?resposta (readline))
	(bind ?res (str-explode ?resposta))
	?res
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MENSAJES					 		---------- 								MENSAJES
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;;; Mensajes a las clases
;;; Aqui aun podem completar mas para que imprima mas información. Dependerá de como se muestre por pantalla


(defmessage-handler MAIN::Plat imprimeixNom primary()
	(printout t " Plat:  " ?self:Nom crlf)
)

(defmessage-handler MAIN::InfoIngredient imprimeixNom primary()
	(printout t ?self:Nom_ingredient crlf)
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					 MAIN					 		---------- 								MAIN
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; Este es el modulo principal, en este se comprobara l existencia del estudiante
;; en el conjunto de instancias del sistema

(defmodule MAIN
	(export ?ALL))

(defrule MAIN::primeraRegla "regla inicial"
	(initial-fact)
	=>
	(reset)
	(printout t crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t "------ Sistema de Recomendacion de un Menú semanal -----" crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t crlf)
	(assert (nou_usuari))	;;aixo ens permet crear un fact
	(focus PREGUNTES)
)


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  				MODULO DE PREGUNTAS				 		---------- 							MODULO DE PREGUNTAS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este se le haran las preguntas al estudiantes
;; para obtener la informacion de sus restricciones y/o preferencias

(defmodule PREGUNTES
		(import MAIN ?ALL)
		(export ?ALL)
)

(defrule PREGUNTES::preguntar_sexe "regla para saber el sexo del usuario"
	(nou_usuari)
	=>
	(bind ?q (pregunta-general "What is your gender? [M F Indef]:  "))
	(switch ?q
		(case M then (assert(Genere M)))
		(case F then (assert(Genere F)))
		(case Indef then (assert(Genere Indef)))
	)
)

(defrule PREGUNTES::preguntar_edat "regla para saber la franja de edad en que se encuantra"
	(nou_usuari)
	=>
		(bind ?q (pregunta-numerica "How old are you?" 65 120))
	(if (and (> ?q 65) (< ?q 75)) then
        (assert(Edat 1)))

    (if (and (> ?q 74) (< ?q 90)) then
        (assert(Edat 2)))

    (if (> ?q 89) then
        (assert(Edat 3)))
)

(defrule PREGUNTES::preguntar_activitat_fisica "regla para saber la cantidad de actividad física que realiza el usuario"
	(nou_usuari)
	=>
	(bind ?q (pregunta-numerica "How often do you practice sport? [barely(1) regularly(2) often(3)]:  " 1 3))
	(switch ?q
		(case P then (assert(Actividad P)))
		(case R then (assert(Actividad R)))
		(case M then (assert(Actividad M)))
	)
)

(defrule PREGUNTES::preguntar_temporada "regla para saber la temporada del año en que nos encontramos"
	(nou_usuari)
	=>
	(bind ?q (pregunta-numerica "What season of the year are we in? [Winter(1) Spring(2) Summer(3) Autumn(4)]:  " 1 4))
	(switch ?q
		(case 1 then (assert(Temporada Hivern)))
		(case 2 then (assert(Temporada Primavera)))
		(case 3 then (assert(Temporada Estiu)))
		(case 4 then (assert(Temporada Tardor)))
	)
)


;DEFINIM LES RESTRICCIONS
(defrule PREGUNTES::preguntar_alergies_restriccions "regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	=>
		(bind ?q (pregunta-general "Do you have any restriction of food you MUST NOT eat? [Yes(Y) No(N)]:  "))
		(switch ?q
			(case Y then (assert(Restriccio S)))
			(case N then (assert(Restriccio N)))
		)
)

(defrule PREGUNTES::definir_alergies_restriccions"regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	(Restriccio S)
	=>
	;;AQUI CALDRIA AMPLIAR-HO MÉS A PODER SER
	(printout t "Restrictions: " crlf)
	(printout t "1. Meet " crlf)
	(printout t "2. Fish " crlf)
	(printout t "3. Fruit" crlf)
	(printout t "4. Dairy (Lactic)" crlf)
	(printout t "5. Gluten" crlf)
	(printout t "6. Specific food" crlf)
	(bind ?rest (pregunta-lista "Separate your answer with a blank between each identifier (can be multiple) :"))

	(progn$ (?it ?rest)	;Per a cadascun dels elements seleccionats
		(switch ?it
			(case 1 then   (assert(Restriccio Carn)))
			(case 2 then   (assert(Restriccio Peix)))
			(case 3 then   (assert(Restriccio Fruita)))
			(case 4 then   (assert(Restriccio Lactic)))
			(case 5 then   (assert(Restriccio Gluten)))
			(case 6 then
                (printout t crlf)
                (bind ?q (pregunta-general "Write the name of the product (in singular if possible):  "))
                (assert (Restriccio ?q)))
        )
    )
  (assert(RestriccionsAfegides))
)

;DEFINIM LES PREFERÈNCIES
(defrule PREGUNTES::preguntar_preferencies_negatives"regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	=>
		(bind ?q (pregunta-general "Do you have food you would RATHER NOT eat [Yes(Y) No(N)]:  "))
		(switch ?q
			(case Y then (assert(PreferenciesN S)))
			(case N then (assert(PreferenciesN N)))
		)
)

(defrule PREGUNTES::definir_preferencies_negatives "regla para saber si tiene algun tipo de preferencia de alimentos a no consumir"
	(nou_usuari)
	(PreferenciesN S)
	=>
	;;AQUI CALDRIA AMPLIAR-HO MÉS A PODER SER
	(printout t "Preferences of food you would rather not eat: " crlf)
	(printout t "1. Meet " crlf)
	(printout t "2. Fish " crlf)
	(printout t "3. Fruit" crlf)
	(printout t "4. Nuts" crlf)
	(printout t "5. Dairy" crlf)
	(printout t "6. Select to write specific food products" crlf)
	(bind ?pref (pregunta-lista "Separate your answer with a blank between each identifier (in case there are several) : "))

	(progn$ (?it ?pref)	;Per a cadascun dels elements seleccionats
		(switch ?it
			(case 1 then   (assert(PreferenciaN Carn)))
			(case 2 then   (assert(PreferenciaN Peix)))
			(case 3 then   (assert(PreferenciaN Fruita)))
			(case 4 then   (assert(PreferenciaN Fruits_secs)))
			(case 5 then   (assert(PreferenciaN Lactic)))
			(case 6 then
                (printout t crlf)
                (bind ?q (pregunta-general "Write the name of the product (in singular if possible):  "))
                (assert (PreferenciaN ?q)))

        )
	)
  (assert(PreferenciesAfegidesN))
)

;DEFINIM LES PREFERÈNCIES
(defrule PREGUNTES::preguntar_preferencies_positives "regla para saber si tiene algun tipo de alergia o restricción"
	(nou_usuari)
	=>
		(bind ?q (pregunta-general "Do you have food you would LIKE to eat [Yes(Y) No(N)]:  "))
		(switch ?q
			(case Y then (assert(PreferenciesP S)))
			(case N then (assert(PreferenciesP N)))
		)
)


(defrule PREGUNTES::definir_preferencies_positives "regla para saber si tiene algun tipo de preferencia de alimentos a no consumir"
	(nou_usuari)
	(PreferenciesP S)
	=>
	;;AQUI CALDRIA AMPLIAR-HO MÉS A PODER SER
	(printout t "Preferences of food you would like to eat: " crlf)
	(printout t "1. Meet " crlf)
	(printout t "2. Fish " crlf)
	(printout t "3. Fruit" crlf)
	(printout t "4. Nuts" crlf)
	(printout t "5. Dairy" crlf)
	(printout t "6. Select to write specific food products" crlf)
	(bind ?pref (pregunta-lista "Separate your answer with a blank between each identifier (in case there are several) : "))

	(progn$ (?it ?pref)	;Per a cadascun dels elements seleccionats
		(switch ?it
			(case 1 then   (assert(PreferenciaP Carn)))
			(case 2 then   (assert(PreferenciaP Peix)))
			(case 3 then   (assert(PreferenciaP Fruita)))
			(case 4 then   (assert(PreferenciaP Fruits_secs)))
			(case 5 then   (assert(PreferenciaP Lactic)))
			(case 6 then
                (printout t crlf)
                (bind ?q (pregunta-general "Write the name of the product (in singular if possible):  "))
                (assert (PreferenciaP ?q)))
        )
	)
  (assert(PreferenciesAfegidesP))
)


;PREGUNTEM SI TÉ ALGUNA DE LES SEGUENTS MALALTIES
(defrule PREGUNTES::definir_malalties "regla para saber si tiene alguna de las siguientes enfermedades"
	(nou_usuari)
	=>
	;;AQUI CALDRIA AMPLIAR-HO MÉS A PODER SER
	(printout t "Indicate whether you have any of these illneses: " crlf)
	(printout t "1. Osteoporosis " crlf)
	(printout t "2. Articular problems " crlf)
	(printout t "3. Diabetis" crlf)
	(printout t "4. Hipertension" crlf)
	(printout t "5. Non of the above" crlf)
	(bind ?malalties (pregunta-lista "Separate your answer with a blank between each identifier (in case there are several) : "))

	(progn$ (?it ?malalties)	;Per a cadascun dels elements seleccionats
		(switch ?it
			(case 1 then   (assert(Osteoporosis)))
			(case 2 then   (assert(Problemes articulars)))
			(case 3 then   (assert(Diabetis)))
			(case 4 then   (assert(Hipertensio)))
		)
	)
  (assert(MalaltiesAfegides))
)

(defrule finalPreguntes "regla para pasar al modulo siguiente"
      (nou_usuari)
      =>
	  (printout t crlf)
	  (printout t "Passem al modul de inferir dades: "crlf)
      (focus INFERIR_DADES)
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODULO DE INFERENCIAS DE DATOS				---------- 				MODULO DE INFERENCIAS DE DATOS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este modulo se hace la abstraccion de los datos obtenidos del modulo de pregunatas
(defmodule INFERIR_DADES
		(import MAIN ?ALL)
		(import PREGUNTES ?ALL)
		(export ?ALL)
)

(defrule INFERIR_DADES::doesntDoAnything "Here we would add the different rules"
  (nou_usuari)
  =>
	(printout t crlf)
	(printout t "Passem al modul de filtrar plats no possibles: "crlf)
  (focus MALALTIES)
)


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODUL DE MALALTIES			---------- 				MODUL DE MALALTIES
;;;------------------------------------------------------------------------------------------------------------------------------------------------------
(defmodule MALALTIES
	(import MAIN ?ALL)
	(import PREGUNTES ?ALL)
	(import INFERIR_DADES ?ALL)
	(export ?ALL)
)

(defrule MALALTIES::osteoporosis "Aqui definim els fets que implica"
	(nou_usuari)
	(MalaltiesAfegides)
	=>
	(assert (PreferenciesP S))
	(assert (PreferenciesAfegidesP))
	(assert (PreferenciaP Lactic))
)

(defrule MALALTIES::problemes_articulars "Aqui definim els fets que implica"
	(nou_usuari)
	(MalaltiesAfegides)
	=>


)

(defrule MALALTIES::hipertensio "Aqui definim els fets que implica"
	(nou_usuari)
	(MalaltiesAfegides)
	=>


)

(defrule MALALTIES::diabetis "Aqui definim els fets que implica"
	(nou_usuari)
	(MalaltiesAfegides)
	=>


)

(defrule MALALTIES::passemAFiltrat "No fa res. Passem al seguent modul"
	(nou_usuari)
	=>
	(printout t crlf)
	(printout t "Passem al modul de marcar les filtrat: "crlf)
	(focus FILTRAT)
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODULO DE FILTRADO				---------- 				MODULO DE FILTRADO
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este modulo se hace la abstraccion de los datos obtenidos del modulo de pregunatas
(defmodule FILTRAT
	(import MAIN ?ALL)
	(import PREGUNTES ?ALL)
	(import INFERIR_DADES ?ALL)
	(import MALALTIES ?ALL)
	(export ?ALL)
)

(defrule FILTRAT::descartarAmbCarn "regla para descartar los platos que contengan carne"
  (Restriccio Carn)
  (RestriccionsAfegides)
  ?plat <- (object (is-a Plat))
	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (and (eq ?FI FALSE) (<= ?i (length$ (send ?plat get-Ingredients))))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))
        (if (eq (send ?ingredientGeneral get-Familia) Carn) then
            (printout t " Eliminem el plat " (instance-name ?plat) crlf)
            (send ?plat delete)
            (bind ?FI TRUE)
        )

        (bind ?i (+ ?i 1))

     )
)

(defrule FILTRAT::descartarAmbPeix "regla para descartar los platos que contengan carne"
  (Restriccio Peix)
  (RestriccionsAfegides)
  ?plat <- (object (is-a Plat))
	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (and (eq ?FI FALSE) (<= ?i (length$ (send ?plat get-Ingredients))))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))
        (if (eq (send ?ingredientGeneral get-Familia) Peix) then
            (printout t " Eliminem el plat " (instance-name ?plat) crlf)
            (send ?plat delete)
            (bind ?FI TRUE)
        )

        (bind ?i (+ ?i 1))

     )
)

(defrule FILTRAT::descartarAmbFruita "regla para descartar los platos que contengan carne"
  (Restriccio Fruita)
  (RestriccionsAfegides)
  ?plat <- (object (is-a Plat))
	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (and (eq ?FI FALSE) (<= ?i (length$ (send ?plat get-Ingredients))))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))
        (if (eq (send ?ingredientGeneral get-Familia) Fruita) then
            (printout t " Eliminem el plat " (instance-name ?plat) crlf)
            (send ?plat delete)
            (bind ?FI TRUE)
        )

        (bind ?i (+ ?i 1))
     )
)

(defrule FILTRAT::descartarLactic "regla para descartar los platos que contengan carne"
  (Restriccio Lactic)
  (RestriccionsAfegides)
  ?plat <- (object (is-a Plat))
	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (and (eq ?FI FALSE) (<= ?i (length$ (send ?plat get-Ingredients))))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))
        (if (eq (send ?ingredientGeneral get-Familia) Làctic) then
            (printout t " Eliminem el plat " (instance-name ?plat) crlf)
            (send ?plat delete)
            (bind ?FI TRUE)
        )

        (bind ?i (+ ?i 1))
     )
)

(defrule FILTRAT::filtremPlatsRestringuits "aqui intentem potenciar els plats que tenen productes de temporada"
    (nou_usuari)
    (RestriccionsAfegides)
    (Restriccio $?P)   ;poden haveri varies coses a potenciar
    ?plat <- (object (is-a Plat))

	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (and (eq ?FI FALSE) (<= ?i (length$ (send ?plat get-Ingredients))))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))

        ;Comprovem si pertany a una familia a potenciar
        (if (member$ (send ?ingredientGeneral get-Familia) ?P) then    ;comprovem si son de la mateixa familia
					(printout t " Eliminem el plat " (instance-name ?plat) crlf)
					(send ?plat delete)
					(bind ?FI TRUE)
        )

            (if (eq ?FI FALSE) then
                (bind ?a (send ?ingredientGeneral get-Nom_ingredient))
                (progn$ (?it ?P)
                    (if (= (str-compare ?it ?a) 0) then
                                    (printout t " Eliminem el plat " (instance-name ?plat) crlf)
                                    (send ?plat delete)
                                )
                )
            )
        (bind ?i (+ ?i 1))
     )
)



(defrule FILTRAT::finalFiltrat "regla para pasar al modulo siguiente"
      (nou_usuari)
      =>
			(printout t crlf)
			(printout t "Passem al modul de marcar les preferencies: "crlf)
      (focus PREFERENCIES)
)



;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODULO DE PREFERENCIAS				---------- 				MODULO DE PREFERENCIAS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este modulo se hace la abstraccion de los datos obtenidos del modulo de pregunatas
(defmodule PREFERENCIES
	(import MAIN ?ALL)
	(import PREGUNTES ?ALL)
	(import INFERIR_DADES ?ALL)
	(import FILTRAT ?ALL)
	(export ?ALL)
)


;Li sumem 1 a la puntuacio del plat per cada ingredient de temporada que conte
(defrule PREFERENCIES::preferirProductesTemporada "aqui intentem potenciar els plats que tenen productes de temporada"
    (nou_usuari)
    (Temporada ?n)
    ?plat <- (object (is-a Plat))

	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (<= ?i (length$ (send ?plat get-Ingredients)))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))
        (if (member$ ?n (send ?ingredientGeneral get-Temporada)) then
            (printout t " Potenciem el plat " (instance-name ?plat) " perque te un ingredient de temporada "crlf)
            (bind ?grau (+ (send ?plat get-GrauRecomanacio) 1))
            (send ?plat put-GrauRecomanacio ?grau)
        )
        (bind ?i (+ ?i 1))
     )
)


;Li sumem 1 a la puntuacio del plat per cada ingredient de temporada que conte
(defrule PREFERENCIES::preferirProductesANoConsumir "aqui intentem potenciar els plats que tenen productes de temporada"
    (nou_usuari)
    (PreferenciesN S)
    (PreferenciesAfegidesN)
    (PreferenciaN $?P)   ;poden haveri varies coses a potenciar
    ?plat <- (object (is-a Plat))

	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (<= ?i (length$ (send ?plat get-Ingredients)))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))

        ;Comprovem si pertany a una familia a potenciar
        (if (member$ (send ?ingredientGeneral get-Familia) ?P) then    ;comprovem si son de la mateixa familia
            (printout t " Potenciem el plat " (instance-name ?plat) " perque te un ingredient de la familia a potenciar de no menjar"crlf)
            (bind ?grau (+ (send ?plat get-GrauRecomanacio) -2))
            (send ?plat put-GrauRecomanacio ?grau)
        )

        (bind ?a (send ?ingredientGeneral get-Nom_ingredient))
         (progn$ (?it ?P)
            (if (= (str-compare ?it ?a) 0) then
            (printout t " Potenciem el plat " (instance-name ?plat) " perque te un ingredient a potenciar de no menjar "crlf)
            (bind ?grau (+ (send ?plat get-GrauRecomanacio) -2))
            (send ?plat put-GrauRecomanacio ?grau))
        )

        (bind ?i (+ ?i 1))
     )
)


;Li sumem 1 a la puntuacio del plat per cada ingredient de temporada que conte
(defrule PREFERENCIES::preferirProductesAConsumir "aqui intentem potenciar els plats que tenen productes de temporada"
    (nou_usuari)
    (PreferenciesP S)
    (PreferenciesAfegidesP)
    (PreferenciaP $?P)   ;poden haveri varies coses a potenciar
    ?plat <- (object (is-a Plat))

	=>
	(bind ?i 1)
	(bind ?FI FALSE)

     (while (<= ?i (length$ (send ?plat get-Ingredients)))
      do
        (bind ?ingredient (nth$ ?i (send ?plat get-Ingredients))) ;agafem el n-èssim ingredient
        (bind ?ingredientGeneral (send ?ingredient get-Ingredient_general))

        ;Comprovem si pertany a una familia a potenciar
        (if (member$ (send ?ingredientGeneral get-Familia) ?P) then    ;comprovem si son de la mateixa familia
            (printout t " Potenciem el plat " (instance-name ?plat) " perque te un ingredient de la familia a potenciar a menjar"crlf)
            (bind ?grau (+ (send ?plat get-GrauRecomanacio) 1))
            (send ?plat put-GrauRecomanacio ?grau)
        )

        (bind ?a (send ?ingredientGeneral get-Nom_ingredient))
         (progn$ (?it ?P)
            (if (= (str-compare ?it ?a) 0) then
            (printout t " Potenciem el plat " (instance-name ?plat) " perque te un ingredient a potenciar a menjar "crlf)
            (bind ?grau (+ (send ?plat get-GrauRecomanacio) 1))
            (send ?plat put-GrauRecomanacio ?grau))
        )

        (bind ?i (+ ?i 1))
     )
)


(defrule PREFERENCIES::acabatLesPreferencia "Saltem al seguent modul"
    (nou_usuari)
    =>
    (printout t crlf)
    (printout t "Passem al modul de formar menus: "crlf)
    (focus MENUS)
)


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  				MODULO DE MENÚS		---------- 				MODULO DE MENÚS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; Aqui montamos nustro menu final

(defmodule MENUS
	(import MAIN ?ALL)
	(import PREGUNTES ?ALL)
	(import INFERIR_DADES ?ALL)
	(import FILTRAT ?ALL)
	(import PREFERENCIES ?ALL)
	(export ?ALL)
)

(defrule MENUS::dividirEnTipusPlats "Ara dividim tots els plats que han quedat en esmorzar, dinar primer i segon plat, sopar primer i segon plat i postres"
	(nou_usuari)
	(not (FI))
	=>
	(bind ?esmorzars (find-all-instances ((?inst Plat)) (member$ Esmorzar ?inst:Apat)))
	(bind ?dinarsPrimers (find-all-instances ((?inst Plat)) (and (member$ Dinar ?inst:Apat) (member$ 1r ?inst:Tipus_plat)) ))
	(bind ?dinarsSegons(find-all-instances ((?inst Plat)) (and (member$ Dinar ?inst:Apat)(member$ 2n ?inst:Tipus_plat)) ))
	(bind ?soparsPrimers (find-all-instances ((?inst Plat)) (and (member$ Sopar ?inst:Apat)(member$ 1r ?inst:Tipus_plat)) ))
	(bind ?soparsSegons(find-all-instances ((?inst Plat)) (and (member$ Sopar ?inst:Apat)(member$ 2n ?inst:Tipus_plat)) ))
	(bind ?postres(find-all-instances ((?inst Plat)) (member$ Postres ?inst:Tipus_plat)))

	(bind ?pos 1)
	(progn$ (?i ?esmorzars)
		(assert (solucionOrdenadaE (posicio ?pos) (plat ?i)))
		(bind ?pos (+ ?pos 1))
	)

	(bind ?pos 1)
	(progn$ (?i ?dinarsPrimers)
		(assert (solucionOrdenadaDP (posicio ?pos) (plat ?i)))
		(bind ?pos (+ ?pos 1))
	)
	(bind ?pos 1)
	(progn$ (?i ?dinarsSegons)
		(assert (solucionOrdenadaDS (posicio ?pos) (plat ?i)))
		(bind ?pos (+ ?pos 1))
	)
	(bind ?pos 1)
	(progn$ (?i ?soparsPrimers)
		(assert (solucionOrdenadaSP (posicio ?pos) (plat ?i)))
		(bind ?pos (+ ?pos 1))
	)

	(bind ?pos 1)
	(progn$ (?i ?soparsSegons)
		(assert (solucionOrdenadaSS (posicio ?pos) (plat ?i)))
		(bind ?pos (+ ?pos 1))
	)

	(bind ?pos 1)
	(progn$ (?i ?postres)
		(assert (solucionOrdenadaP (posicio ?pos) (plat ?i)))
		(bind ?pos (+ ?pos 1))
	)
)


;ANEM A ORDENAR ELS RESULTATS
(defrule MENUS::ordenarEsmorzars "regla para ordenar las recomendaciones descendentemente por el grado de recomendacion"
	(not (FI))
	(nou_usuari)
	?p1 <- (solucionOrdenadaE (posicio ?pos1) (plat ?plat1))
	?p2 <- (solucionOrdenadaE (posicio ?pos2) (plat ?plat2))
	(test (and (> (send ?plat1 get-GrauRecomanacio) (send ?plat2 get-GrauRecomanacio)) (< ?pos1 ?pos2)))
	=>
	;anem modificant les posicions entre ells fins que cada plat te la seva posicio correcta
	(modify ?p1 (posicio ?pos2))
	(modify ?p2 (posicio ?pos1))
)

(defrule MENUS::ordenarDinarPrimers "regla para ordenar las recomendaciones descendentemente por el grado de recomendacion"
	(not (FI))
	(nou_usuari)
	?p1 <- (solucionOrdenadaDP (posicio ?pos1) (plat ?plat1))
	?p2 <- (solucionOrdenadaDP (posicio ?pos2) (plat ?plat2))
	(test (and (> (send ?plat1 get-GrauRecomanacio) (send ?plat2 get-GrauRecomanacio)) (< ?pos1 ?pos2)))
	=>
	;anem modificant les posicions entre ells fins que cada plat te la seva posicio correcta
	(modify ?p1 (posicio ?pos2))
	(modify ?p2 (posicio ?pos1))
)

(defrule MENUS::ordenarDinarSegons "regla para ordenar las recomendaciones descendentemente por el grado de recomendacion"
	(not (FI))
	(nou_usuari)
	?p1 <- (solucionOrdenadaDS (posicio ?pos1) (plat ?plat1))
	?p2 <- (solucionOrdenadaDS (posicio ?pos2) (plat ?plat2))
	(test (and (> (send ?plat1 get-GrauRecomanacio) (send ?plat2 get-GrauRecomanacio)) (< ?pos1 ?pos2)))
	=>
	;anem modificant les posicions entre ells fins que cada plat te la seva posicio correcta
	(modify ?p1 (posicio ?pos2))
	(modify ?p2 (posicio ?pos1))
)

(defrule MENUS::ordenarSoparPrimers "regla para ordenar las recomendaciones descendentemente por el grado de recomendacion"
	(not (FI))
	(nou_usuari)
	?p1 <- (solucionOrdenadaSP (posicio ?pos1) (plat ?plat1))
	?p2 <- (solucionOrdenadaSP (posicio ?pos2) (plat ?plat2))
	(test (and (> (send ?plat1 get-GrauRecomanacio) (send ?plat2 get-GrauRecomanacio)) (< ?pos1 ?pos2)))
	=>
	;anem modificant les posicions entre ells fins que cada plat te la seva posicio correcta
	(modify ?p1 (posicio ?pos2))
	(modify ?p2 (posicio ?pos1))
)

(defrule MENUS::ordenarSoparSegons "regla para ordenar las recomendaciones descendentemente por el grado de recomendacion"
	(not (FI))
	(nou_usuari)
	?p1 <- (solucionOrdenadaSS (posicio ?pos1) (plat ?plat1))
	?p2 <- (solucionOrdenadaSS (posicio ?pos2) (plat ?plat2))
	(test (and (> (send ?plat1 get-GrauRecomanacio) (send ?plat2 get-GrauRecomanacio)) (< ?pos1 ?pos2)))
	=>
	;anem modificant les posicions entre ells fins que cada plat te la seva posicio correcta
	(modify ?p1 (posicio ?pos2))
	(modify ?p2 (posicio ?pos1))
)


(defrule MENUS::ordenarPostres "regla para ordenar las recomendaciones descendentemente por el grado de recomendacion"
	(not (FI))
	(nou_usuari)
	?p1 <- (solucionOrdenadaP (posicio ?pos1) (plat ?plat1))
	?p2 <- (solucionOrdenadaP (posicio ?pos2) (plat ?plat2))
	(test (and (> (send ?plat1 get-GrauRecomanacio) (send ?plat2 get-GrauRecomanacio)) (< ?pos1 ?pos2)))
	=>
	;anem modificant les posicions entre ells fins que cada plat te la seva posicio correcta
	(modify ?p1 (posicio ?pos2))
	(modify ?p2 (posicio ?pos1))
)


;ANEM A MOSTRAR ELS RESULTATS
(defrule MENUS::FormarMenu "regla per obtenir el menu final"
	(nou_usuari)
	=>
	(bind ?esmorzars (find-all-instances ((?inst Plat)) (member$ Esmorzar ?inst:Apat)))
	(bind ?dinarsPrimers (find-all-instances ((?inst Plat)) (and (member$ Dinar ?inst:Apat) (member$ 1r ?inst:Tipus_plat)) ))
	(bind ?dinarsSegons(find-all-instances ((?inst Plat)) (and (member$ Dinar ?inst:Apat)(member$ 2n ?inst:Tipus_plat)) ))
	(bind ?soparsPrimers (find-all-instances ((?inst Plat)) (and (member$ Sopar ?inst:Apat)(member$ 1r ?inst:Tipus_plat)) ))
	(bind ?soparsSegons(find-all-instances ((?inst Plat)) (and (member$ Sopar ?inst:Apat)(member$ 2n ?inst:Tipus_plat)) ))
	(bind ?postres(find-all-instances ((?inst Plat)) (member$ Postres ?inst:Tipus_plat)))


	(printout t crlf)
	(printout t "AQUEST ÉS EL TEU MENÚ SETMANAL: " crlf)
	(printout t "----------------------------------- " crlf)

	(bind ?i 1)
	(while (<= ?i 7)
      do
        (printout t crlf)
        (switch ?i
		(case 1 then (printout t "DILLUNS" crlf))
		(case 2 then (printout t "DIMARTS" crlf))
		(case 3 then (printout t "DIMECRES" crlf))
		(case 4 then (printout t "DIJOUS" crlf))
		(case 5 then (printout t "DIVENDRES" crlf))
		(case 6 then (printout t "DISSABTE" crlf))
		(case 7 then (printout t "DIUMENGE" crlf)))

        (printout t "----------------------------------- " crlf)

        (if (> (length$ ?esmorzars) 0) then
            (bind ?j (+ (mod ?i (length$ ?esmorzars) ) 1 ))
            (bind ?esmorzar (nth$ ?j ?esmorzars)) ;agafem el n-èssim ingredient
            (bind ?e (send ?esmorzar get-Nom))
            (printout t "ESMORZAR : " ?e crlf)
        )


        (printout t "DINAR :" crlf)
        (if (> (length$ ?dinarsPrimers) 0) then
            (bind ?j (+ (mod ?i (length$ ?dinarsPrimers) ) 1 ))
            (bind ?dinar (nth$ ?j ?dinarsPrimers)) ;agafem el n-èssim ingredient
            (bind ?d (send ?dinar get-Nom))
            (printout t "Primer: " ?d crlf)
        )
        (if (> (length$ ?dinarsSegons) 0) then
            (bind ?j (+ (mod ?i (length$ ?dinarsSegons) ) 1 ))
            (bind ?dinar (nth$ ?j ?dinarsSegons)) ;agafem el n-èssim ingredient
            (bind ?d (send ?dinar get-Nom))
            (printout t "Segon : " ?d crlf)
        )
        (if (> (length$ ?postres) 0) then
            (bind ?j (+ (mod ?i (length$ ?postres) ) 1 ))
            (bind ?postra (nth$ ?j ?postres)) ;agafem el n-èssim ingredient
            (bind ?d (send ?postra get-Nom))
            (printout t "Postres : " ?d crlf)
        )


        (printout t "SOPAR :" crlf)
        (if (> (length$ ?soparsPrimers) 0) then
            (bind ?j (+ (mod ?i (length$ ?soparsPrimers) ) 1 ))
            (bind ?sopar (nth$ ?j ?soparsPrimers)) ;agafem el n-èssim ingredient
            (bind ?s (send ?sopar get-Nom))
            (printout t "Primer : " ?s crlf)
        )

        (if (> (length$ ?soparsSegons) 0) then
            (bind ?j (+ (mod ?i (length$ ?soparsSegons) ) 1 ))
            (bind ?sopar (nth$ ?j ?soparsSegons)) ;agafem el n-èssim ingredient
            (bind ?s (send ?sopar get-Nom))
            (printout t "Segon : " ?s crlf)
        )
        (if (> (length$ ?postres) 0) then
            (bind ?j (+ (mod ?i (length$ ?postres) ) 1 ))
            (bind ?postra (nth$ ?j ?postres)) ;agafem el n-èssim ingredient
            (bind ?d (send ?postra get-Nom))
            (printout t "Postres : " ?d crlf)
        )


        (bind ?i (+ ?i 1)) )

        (assert (FI))
)
