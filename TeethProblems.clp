(deffacts startup
   (start))

(defrule start-rule
   ?p <- (start)
   =>
   (printout t "Do you have pain when you eat cold foods or liquids? ")
   (assert (cold_food_pain (read))))

(defrule cold-food-pain-rule
   (cold_food_pain yes)
   =>
   (printout t "Do you experience hot/cold sensitivity without visible signs of redness or swelling? ")
   (assert (hot_cold_sensitivity (read))))

(defrule sensitivity-rule
   (hot_cold_sensitivity yes)
   =>
   (printout t "You may have tooth sensitivity. Please see a dentist for diagnosis and treatment." crlf)
   (assert (stop)))

(defrule different-sensitivity-rule
   (hot_cold_sensitivity no)
   =>
   (printout t "Do you experience pain when eating sweet or acidic foods? ")
   (assert (sweet_acidic_sensitivity (read))))

(defrule sweet-acidic-sensitivity-rule
   (sweet_acidic_sensitivity yes)
   =>
   (printout t "You may have sensitivity to sweet or acidic foods. Consult with a dentist for further evaluation." crlf)
   (assert (stop)))

(defrule no-sensitivity-rule
   (sweet_acidic_sensitivity no)
   =>
   (printout t "You may have a different type of sensitivity. Consult with a dentist for further evaluation." crlf)
   (assert (stop)))

(defrule bite-chew-pain-rule
   (cold_food_pain no)
   =>
   (printout t "Do you have pain when you bite or chew? ")
   (assert (bite_or_chew_pain (read))))

(defrule cracked-tooth-rule
   (cold_food_pain no)
   (bite_or_chew_pain yes)
   =>
   (printout t "Do you have visible signs of a cracked tooth, such as a chipped tooth or pain when biting? ")
   (assert (visible_crack_signs (read))))

(defrule no-visible-crack-signs-rule
   (visible_crack_signs no)
   =>
   (printout t "You may have a different issue causing bite or chew pain. Consult with a dentist for further evaluation." crlf)
   (assert (stop)))

(defrule tooth-abscess-rule
   (visible_crack_signs yes)
   (bite_or_chew_pain yes)
   =>
   (printout t "You may have a tooth abscess. Please see a dentist for diagnosis and treatment." crlf)
   (assert (stop)))

(defrule stress-related-pain-rule
   (cold_food_pain no)
   (bite_or_chew_pain no)
   =>
   (printout t "Do you clench or grind your teeth, especially at night? ")
   (assert (teeth_clench_grind (read))))

(defrule teeth-clench-grind-rule
   (teeth_clench_grind yes)
   =>
   (printout t "Your tooth pain may be related to teeth clenching or grinding." crlf)
   (assert (stop)))

(defrule sinus-pressure-rule
   (cold_food_pain no)
   (bite_or_chew_pain no)
   (teeth_clench_grind no)
   =>
   (printout t "Do you have a history of sinus issues or currently experiencing sinus symptoms? ")
   (assert (sinus_symptoms (read))))

(defrule sinus-symptoms-rule
   (teeth_clench_grind no)
   (sinus_symptoms yes)
   =>
   (printout t "Your tooth pain may be related to sinus pressure and stress. See a doctor or dentist for further evaluation." crlf)
   (assert (stop)))

(defrule no-sinus-symptoms-rule
   (teeth_clench_grind no)
   (sinus_symptoms no)
   =>
   (printout t "Your tooth pain may be due to other reasons. Consult with a dentist for further evaluation." crlf)
   (assert (stop)))
