(declare-rel verifier.error (Bool Bool ))
(declare-rel foo@entry (Bool Int ))
(declare-rel foo@if.then (Bool Int ))
(declare-rel foo@if.end (Bool Int ))
(declare-rel foo@if.end.split (Bool Int Int ))
(declare-rel foo (Bool Bool Int Int ))
(declare-rel main@entry (Bool Int Int ))
(declare-rel main@entry.split (Bool ))
(declare-var foo@%cmp_0 Bool )
(declare-var %x_0 Int )
(declare-var foo@%inc_0 Int )
(declare-var error.flag_0 Bool )
(declare-var error.flag_1 Bool )
(declare-var main@%call_0 Int )
(declare-var main@%call1_0 Int )
(declare-var main@%call2_0 Int )
(declare-var error.flag_2 Bool )
(rule (verifier.error false true))
(rule (verifier.error true true))
(rule (foo true true %x_0 foo@%inc_0))
(rule (=> (not error.flag_0) (foo@entry error.flag_0 %x_0)))
(rule (=> (and (foo@entry error.flag_0 %x_0)
         (not error.flag_0)
         (= foo@%cmp_0 (> %x_0 10))
         foo@%cmp_0)
    (foo@if.then error.flag_0 %x_0)))
(rule (=> (and (foo@entry error.flag_0 %x_0)
         (not error.flag_0)
         (= foo@%cmp_0 (> %x_0 10))
         (not foo@%cmp_0))
    (foo@if.end error.flag_0 %x_0)))
(rule (=> (and (foo@if.then error.flag_0 %x_0) (not error.flag_0) error.flag_1)
    (foo@if.end error.flag_1 %x_0)))
(rule (=> (and (foo@if.end error.flag_0 %x_0)
         (not error.flag_0)
         (= foo@%inc_0 (+ %x_0 1)))
    (foo@if.end.split error.flag_0 foo@%inc_0 %x_0)))
(rule (=> (and (foo@entry error.flag_0 %x_0) error.flag_0)
    (foo@if.end.split error.flag_0 foo@%inc_0 %x_0)))
(rule (=> (and (foo@if.then error.flag_0 %x_0) error.flag_0)
    (foo@if.end.split error.flag_0 foo@%inc_0 %x_0)))
(rule (=> (and (foo@if.end error.flag_0 %x_0) error.flag_0)
    (foo@if.end.split error.flag_0 foo@%inc_0 %x_0)))
(rule (=> (and (foo@if.end.split error.flag_0 foo@%inc_0 %x_0) (not error.flag_0))
    (foo false false %x_0 foo@%inc_0)))
(rule (=> (and (foo@if.end.split error.flag_0 foo@%inc_0 %x_0) error.flag_0)
    (foo false true %x_0 foo@%inc_0)))
(rule (=> (not error.flag_0) (main@entry error.flag_0 main@%call1_0 main@%call2_0)))
(rule (=> (and (main@entry error.flag_0 main@%call1_0 main@%call2_0)
         (not error.flag_0)
         (foo error.flag_0 error.flag_1 main@%call_0 main@%call1_0)
         (foo error.flag_1 error.flag_2 main@%call1_0 main@%call2_0))
    (main@entry.split error.flag_2)))
(rule (=> (and (main@entry error.flag_0 main@%call1_0 main@%call2_0) error.flag_0)
    (main@entry.split error.flag_0)))
(query (main@entry.split true))

