\version "2.19.11"
\language "english"

#(define (define-grob-custom-property symbol type? description)
  (if (not (equal? (object-property symbol 'backend-doc) #f))
      (ly:error (_ "symbol ~S redefined") symbol))

    (set-object-property! symbol 'backend-type? type?)
    (set-object-property! symbol 'backend-doc description)
    symbol)

#(define all-user-grob-custom-properties
   (map
     (lambda (x)
       (apply define-grob-custom-property x))

     `(
       (to-fingerings ,boolean? "boolean for moving glissandi to fingerings")
     )))

fingeringSlideEngraver =
#(lambda (context)
   (let ((glissandi '())
         (fingerings '()))

     `((acknowledgers
         (glissando-interface
           . ,(lambda (engraver grob source-engraver)
                (if (eq? #t (ly:grob-property grob 'to-fingerings))
                    (set! glissandi (append glissandi (list grob))))))

         (finger-interface
           . ,(lambda (engraver grob source-engraver)
                (set! fingerings (append fingerings (list grob))))))

       (stop-translation-timestep
         . ,(lambda (trans)
              (map (lambda (gliss)
                     (map (lambda (finger)
                            (if (eq? (ly:spanner-bound gliss LEFT)
                                     (ly:grob-parent finger X))
                                (ly:spanner-set-bound! gliss LEFT finger))
                            (if (eq? (ly:spanner-bound gliss RIGHT)
                                     (ly:grob-parent finger X))
                                (begin
                                  (ly:spanner-set-bound! gliss RIGHT finger)
                                  (set! glissandi (remove (lambda (x) (eq? x gliss)) glissandi)))))
                          fingerings))
                   glissandi)

              (set! fingerings '()))))))
