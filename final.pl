attends(476, im218).
attends(478, im218).
attends(479, im218).
attends(481, im218).
attends(482, im218).
attends(483, im218).
attends(484, im218).
attends(485, im218).
attends(487, im218).
attends(488, im218).
attends(489, im218).
attends(490, im218).
attends(491, im218).
attends(492, im218).
attends(494, im218).
attends(495, im218).
attends(496, im218).
attends(497, im218).
attends(498, im218).
attends(500, im218).
attends(501, im218).
attends(505, im218).
attends(506, im218).
attends(507, im218).
attends(508, im218).
attends(510, im218).
attends(512, im218).
attends(514, im218).
attends(517, im218).
attends(518, im218).
attends(479, im217).
attends(481, im217).
attends(486, im217).
attends(493, im217).
attends(494, im217).
attends(495, im217).
attends(497, im217).
attends(499, im217).
attends(502, im217).
attends(503, im217).
attends(504, im217).
attends(520, im217).
attends(507, im217).
attends(509, im217).
attends(512, im217).
attends(513, im217).
attends(514, im217).
attends(516, im217).
attends(476, im204).
attends(478, im204).
attends(482, im204).
attends(485, im204).
attends(486, im204).
attends(487, im204).
attends(488, im204).
attends(489, im204).
attends(490, im204).
attends(491, im204).
attends(492, im204).
attends(493, im204).
attends(494, im204).
attends(496, im204).
attends(498, im204).
attends(499, im204).
attends(500, im204).
attends(501, im204).
attends(502, im204).
attends(503, im204).
attends(505, im204).
attends(520, im204).
attends(508, im204).
attends(509, im204).
attends(510, im204).
attends(512, im204).
attends(513, im204).
attends(514, im204).
attends(515, im204).
attends(516, im204).
attends(517, im204).
attends(518, im204).
attends(479, im210).
attends(480, im210).
attends(481, im210).
attends(483, im210).
attends(484, im210).
attends(491, im210).
attends(497, im210).
attends(508, im210).
attends(513, im210).
attends(515, im210).
attends(517, im210).
attends(476, im209).
attends(478, im209).
attends(480, im209).
attends(481, im209).
attends(482, im209).
attends(484, im209).
attends(485, im209).
attends(487, im209).
attends(488, im209).
attends(489, im209).
attends(490, im209).
attends(492, im209).
attends(493, im209).
attends(495, im209).
attends(496, im209).
attends(497, im209).
attends(498, im209).
attends(499, im209).
attends(500, im209).
attends(504, im209).
attends(506, im209).
attends(515, im209).
attends(516, im209).
attends(518, im209).
attends(476, im216).
attends(478, im216).
attends(484, im216).
attends(487, im216).
attends(491, im216).
attends(492, im216).
attends(493, im216).
attends(496, im216).
attends(498, im216).
attends(501, im216).
attends(502, im216).
attends(504, im216).
attends(505, im216).
attends(507, im216).
attends(509, im216).
attends(512, im216).
attends(513, im216).
attends(514, im216).
attends(515, im216).
attends(479, im214).
attends(480, im214).
attends(482, im214).
attends(483, im214).
attends(485, im214).
attends(486, im214).
attends(488, im214).
attends(489, im214).
attends(490, im214).
attends(494, im214).
attends(495, im214).
attends(499, im214).
attends(500, im214).
attends(503, im214).
attends(504, im214).
attends(505, im214).
attends(506, im214).
attends(520, im214).
attends(507, im214).
attends(508, im214).
attends(510, im214).
attends(516, im214).
attends(517, im214).
attends(518, im214).
attends(480, im212).
attends(483, im212).
attends(486, im212).
attends(501, im212).
attends(502, im212).
attends(503, im212).
attends(506, im212).
attends(520, im212).
attends(509, im212).
attends(510, im212).

/*
Για την υλοποίηση της schedule/3 καλώ την lessons_perms/1 η οποία πρώτα κρατάει μια λίστα με όλα τα μαθήματα που υπάρχει και 
έπειτα καλεί την permumation/2 για να πάρει μεταθέσεις αυτής μέσω backtracking. Έπειτα με τη split_list/4 σπάω τη λίστα 
P σε 3 υπολίστες A,B,C με την κατάλληλη δομή (3-3-2).
*/
permutation([],[]).
permutation(L1,[X|T2]) :-
	delete(X,L1,L2),
	permutation(L2,T2).

delete(E,L,NL):-
	append(L1,[E|L2],L),
	append(L1,L2,NL).
    
lessons_perms(Y) :-
    setof(Y,X^attends(X,Y),L),
    permutation(L,Y).

split_list([],[_],[_],[_]).
split_list([X,Y,Z|L],[X|L1],[Y|L2],[Z|L3]) :-
	split_list(L,L1,L2,L3), !.
split_list([X,Y],[X],[Y],[]).

schedule(A,B,C) :-
    lessons_perms(P),
    split_list(P,A,B,C).

% Τέλος πρώτου ερωτήματος. Η schedule(A,B,C) επιστρέφει ένα ένα τα πιθανά προγράμματα μέσω backtracking.


/*
Για την υλοποίηση της schedule_errors/4 αρχικά κρατάω σε μία λίστα Foitites όλους τους κωδικούς φοιτητών και καλώ την βοηθητική
schedule_errors2/6 η οποία παίρνει τις εβδομάδες A,B,C, την λίστα Foitites, μία αρχική τιμή(0) από Errors και την τελική τιμή E.
Η τερματική συνθήκη, όταν αδειάσει η λίστα με τους φοιτητές, επιστρέφει στην τελική τιμή Ε την τιμή που υπήρχε στην TempErrors.
Αλλιώς σπάω την λίστα σε First και Rest για να απομονώσω τον πρώτο φοιτητή, ελέγχω αν είναι δυσαρεστημένος με το βοηθητικό
κατηγόρημα disgruntled/4. Αν ναι, καλώ την schedule_errors2 για τους υπόλοιπους φοιτητές αυξάνοντας την τιμή TempErros, αλλιώς
απλώς κάνω αναδρομή εξετάζοντας τον επόμενο φοιτητή. 
Για το disgruntled/3 αρχικά βάζω σε μία λίστα όλα τα μαθήματα που έχει ο φοιτητής και έπειτα ελέγχω αν κάποια από τις βδομάδες
Α,Β υπάρχει ολόκληρη μέσα στα μαθήματα του φοιτητή (κάτι που δεν χρειάζεται να ελέγξω στην C, αφού έχει μόνο δύο μαθήματα).
Ο έλεγχος αυτός γίνεται με το κατηγόρημα included/2.
*/
schedule_errors(A,B,C,E) :-
    setof(X,Y^attends(X,Y),Foitites),
    schedule_errors2(A,B,C,Foitites,0,E).

schedule_errors2(_A,_B,_C,[],TempErrors,TempErrors).

schedule_errors2(A,B,C,Foitites,TempErrors,E) :-
    append([First],Rest,Foitites),
    disgruntled(A,B,First),
    Next_Errors is TempErrors +1,
    schedule_errors2(A,B,C,Rest,Next_Errors,E).

schedule_errors2(A,B,C,Foitites,TempErrors,E) :-
    append([First],Rest,Foitites),
    not(disgruntled(A,B,First)),
    schedule_errors2(A,B,C,Rest,TempErrors,E).

included([],_).
included([H|T],L) :-
	select(H,L,L1),
	included(T,L1).

disgruntled(A,B,Foititis) :-
    setof(Y,attends(Foititis,Y),MathimataFoititi),
    (included(A,MathimataFoititi) ; included(B,MathimataFoititi)).

% Τέλος δεύτερου ερωτήματος. Η schedule_errors(A,B,C,E) επιστρέφει το πλήθος(Ε) των δυσαρεστημένων φοιτητών στο πρόγραμμα A,B,C.

/*
Για την υλοποίηση της minimal_schedule_errors/4 αρχικά βρίσκεται το ελάχιστο Error που υπάρχει σε όλα τα δυνατά προγράμματα
συνδιάζοντας τα δύο παραπάνω κατηγορήματα schedule/3 και schedule_errors/4. Με τη setof κρατάμε μόνο τα Error των προγραμμάτων,
από τα οποία χρειαζόμαστε μόνο την πρώτη τιμή (αφού η setof κάνει και αύξουσα ταξινόμηση). Έπειτα δημιουργείται ένα πρόγραμμα,
υπολογίζεται το Error αυτού, και αν αυτό ισούται με τα ελάχιστα Errors τότε επιστρέφεται. Με backtracking μπορώ να έχω όλες τις
λύσεις με το MinError.
*/

minimal_schedule_errors(A,B,C,MinError) :-
    setof(Errors,A^B^C^(schedule(A,B,C),schedule_errors(A,B,C,Errors)),[MinError|_]), % VRISKW MIN ERROR
    schedule(A,B,C),
    schedule_errors(A,B,C,Error),
    Error == MinError.
% Τέλος τρίτου ερωτήματος. Η minimal_schedule_errors(A,B,C,MinError) τα προγράμματα με το χαμηλότερο δυνατό error.

/*
Για το κατηγόρημα score_schedule(A,B,C,S) αρχικά βρίσκω όλους τους φοιτητές και καλώ την score_schedule2/6 στην οποία στέλνω
τις εβδομάδες, μια λίστα Foitites, ένα TempScore (στην αρχική κλήση 0) και ένα Fscore(S), το οποίο θα ταυτοποιηθεί με το TempScore
όταν αδειάσει η λίστα Foitites. Κρατάω τον πρώτο φοιτητή, υπολογίζω το σκορ του με το βοηθητικό κατηγόρημα score_foititi/5, κάνω
την πρόσθεση στο TempScore και συνεχίζω την αναδρομή για τους υπόλοιπους φοιτητές ανανεώνοντας την τιμή του προσωρινού σκορ και τη
λίστα με τους φοιτητές. Για το score_foititi/5, βρίσκω όλα τα μαθήματα του φοιτητή και αθροίζω τα σκορ που παίρνει ο φοιτητής από
την κάθε εβδομάδα με την βοήθεια του score_evdomadas/4. Για το score_evdomadas/3 βρίσκω το πλήθος των μαθημάτων του φοιτητή
στη βδομάδα αυτή, παίρνοντας την τομή των δύο και το μέγεθος αυτής. Αν ο φοιτητής έχει 3 μαθήματα στην ίδια βδομάδα, πάει -7,
αν έχει 1 +7, αν κανένα τότε 0. Τέλος, στην περίπτωση που έχει δύο μαθήματα πρέπει να ελέγξω αν τα δίνει συνεχόμενα(Δ-Τ ή Τ-Π)
ή όχι, όπου το σκορ είναι 1 και 3 αντιστοίχως.
*/

score_schedule(A,B,C,S) :-
    setof(X,Y^attends(X,Y),Foitites),
    score_schedule2(A,B,C,Foitites,0,S).

score_schedule2(_A,_B,_C,[],FScore,FScore).

score_schedule2(A,B,C,Foitites,TempScore,S) :-
    append([First],Rest,Foitites),
    score_foititi(First, A,B,C, Score_Prwtou),
    Next_Score is TempScore + Score_Prwtou,
    score_schedule2(A,B,C,Rest,Next_Score,S).


score_foititi(F,A,B,C,Score_foititi) :-
    findall(Y,attends(F,Y),Mathimata_Foititi),
    score_evdomadas(A,Mathimata_Foititi,Score1),
    score_evdomadas(B,Mathimata_Foititi,Score2),
    score_evdomadas(C,Mathimata_Foititi,Score3),
    Score_foititi is Score1+Score2+Score3.

sublist(S,L) :-
 append(_L1, L2, L),
 append(S, _L3, L2).

score_evdomadas(E,M,Score_evdomadas) :-
    mathimata_sti_vdomada(E,M,_A,N),
    N == 3, Score_evdomadas is -7.

score_evdomadas(E,M,Score_evdomadas) :-
    mathimata_sti_vdomada(E,M,A,N),
    N == 2, sublist(A,E), Score_evdomadas is 1.

score_evdomadas(E,M,Score_evdomadas) :-
    mathimata_sti_vdomada(E,M,A,N),
    N == 2, not(sublist(A,E)), Score_evdomadas is 3.

score_evdomadas(E,M,Score_evdomadas) :-
    mathimata_sti_vdomada(E,M,_A,N),
    N == 1, Score_evdomadas is 7.

score_evdomadas(E,M,Score_evdomadas) :-
    mathimata_sti_vdomada(E,M,_A,N),
    N == 0, Score_evdomadas is 0.

mathimata_sti_vdomada(E,M,A,N) :-
    intersection(E,M,A),
    length(A,N).

% Τέλος τέταρτου ερωτήματος. Η score_schedule(A,B,C,S) δέχεται ένα πρόγραμμα και επιστρέφει το σκορ αυτού.


/*
Η maximum_score_schedule/5 αρχικά κρατάει στη List λίστες προγραμμάτων με το ελάχιστονerror με την μορφή [A,B,C] καλώντας το 
κατηγόρημα minimal_schedule_errors/4 που υλοποιήθηκε και εξηγήθηκε παραπάνω. Έπειτα από την λίστα αυτών των προγραμμάτων 
βρίσκει το μεγαλύτερο σκορ με το βοηθητικό max_of_min_errors/3. Μετά βρίσκουμε ένα πρόγραμμα, ελέγχουμε αν το error του είναι ίσο με το min_error,
έπειτα αν το score του ισούται με το max score και γυρνάμε το αποτέλεσμα. Με backtracking παίρνουμε όλες τις λύσεις.

Για την max_of_min_errors/3 δεχόμαστε τη λίστα με τα προγράμματα, ένα Max_Temp(έστω 0 στην αρχή) και ενα Max_Score. Όταν αδειάσει
η λίστα με τα προγράμματα η τιμή του Max_Temp επιστρέφεται. Όσο η λίστα δεν είναι άδεια, απομονώνω το πρώτο στοιχείο της, το οποίο
πάλι είναι μία λίστα της μορφής [A,B,C], οπότε μετά σπάω αυτή τη λίστα σε A,B,C υπολίστες. Ελέγχω το σκορ του προγράμματος αυτού,
αν είναι μεγαλύτερο από το Max_Temp γίνεται αναδρομή αντικαθιστώντας αυτό με το Score που μόλις υπολογίστηκε και συνεχίζω με την
υπόλοιπη λίστα προγραμμάτων. Διαφορετικά απλώς συνεχίζω με το υπόλοιπο της λίστας.
*/

maximum_score_schedule(A,B,C,E,S) :-
  setof([A,B,C],minimal_schedule_errors(A,B,C,E),List),
  max_of_min_errors(List,0,S),
  schedule(A,B,C),
  schedule_errors(A,B,C,E1),
  E1 == E,
  score_schedule(A,B,C,S1),
  S1 == S.

max_of_min_errors([],Max_Temp,Max_Temp).
max_of_min_errors(Lista, Max_Temp, Max_Score) :-
    append([First],Rest,Lista),
    append([A,B,C],_,First),
    score_schedule(A,B,C,Score),
    Score > Max_Temp,
    max_of_min_errors(Rest,Score,Max_Score).

max_of_min_errors(Lista, Max_Temp, Max_Score) :-
    append([First],Rest,Lista),
    append([A,B,C],_,First),
    score_schedule(A,B,C,Score),
    Score =< Max_Temp,
    max_of_min_errors(Rest,Max_Temp,Max_Score).
