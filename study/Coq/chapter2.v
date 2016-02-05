(*
 Proof-editing mode であそぼう
 @see http://www.iij-ii.co.jp/lab/techdoc/coqt/coqt2.html
 *)

(*forall (A : Prop), A -> A*)

Definition prop0 : forall (A : Prop), A -> A.
Proof. (* 証明を始める宣言 *)
intros.

(*
1 subgoal                                          (サブゴールが1つある)

______________________________________(1/1)        (サブゴールが1つあるうちの1つ目を表示)
forall A : Prop, A -> A                            (サブゴール(現在の結論))
これを証明図とする
*)
(*
1 subgoal
A : Prop (A は命題である)
H : A    (A が成り立つ)
______________________________________(1/1)
A
 *)
apply H.
(* apply H: Hをサブゴールに適用する *)
Qed.

(* prop0 is defined *)
(* C-c C-a C-p 命題を表示する *)
(*
Theorem, Lemmaの例
Theorem prop0 : forall (A : Prop), A -> A.
Lemma prop0 : forall (A : Prop), A -> A.

Example prop0 : forall (A : Prop), A -> A.
Example prop0 : forall (A : Prop), A -> A := fun A x => x.

名前を付けるまでもない命題を証明したいときのために Goal というコマンド
Goal forall (A : Prop), A -> A.
*)


(*
| C-c C-n     | 1ステップ評価        |
| C-c C-u     | 1ステップ戻る        |
| C-c C-Enter | カーソル位置まで評価 |
| C-c C-a C-o | SearchPattern        |
| C-c C-a C-p | Print                |
| C-c C-a C-c | Check                |
 *)
(* forall (P Q : Prop), (forall P : Prop, (())) *)

Goal forall (P Q : Prop), (forall P : Prop, (P -> Q) -> Q)
  -> ((P -> Q) -> P) -> P.
(*
   P <- 型変数
   H : Prop (A は命題である)
   H : A    (A が成り立つ) (仮定)
   intros は現在のサブゴールに対して、サブゴールが
   "forall A, B" なら仮定に A を入れてサブゴールを B に、
   サブゴールが "A -> B" なら仮定に "H : A"
   を入れてサブゴールを B に変えるはたらきをします。
   *)
intro.
intro.
intro.
intro.
apply H0.
(* H0の型は (P -> Q) -> P
(P -> Q) -> P
↓
P -> Q
一般に、仮定に "X : A -> B" があり、サブゴールが B のとき、"apply X." はサブゴールを "A" にするはたらきを持つ。
「"A -> B" という型を持った関数 X」があるときに型 B のプログラム(値)を作りたいなら、
型 A のプログラムがありさえすればそれを X に渡せば型 B のプログラムができる
現在の仮定からAが導ければBも導ける
このためにAをサブゴールに持ってくるためにapplyを使う
apply X は関数 X に何かを適用している訳ではなく、X に適用できる値の型をサブゴールに持って行く
紙の証明は A->B, B->C という風に順につなげて証明する
CoqはCが成り立つためにはBが必要
Bが成り立つためにはAが必要という風に逆
 *)
intro.
apply (H (P -> Q)).
apply (H P).
Qed.

Goal forall (P Q R : Prop), (P -> Q) -> ((P -> Q) -> P) -> P.
intros.
apply H0.
(* (P->Q) -> P で
 -> Pがとれて
 P -> Q になる*)
intro.
apply (H H1).
(* H: P -> Q
 のとき HのPにサブゴールのQを代入すると
 証明終了になる*)
Qed.

Goal forall (P Q : Prop), (forall P : Prop, (P -> Q) -> Q) -> ((P -> Q) -> P) ->  P.
Proof.
  intros. (* P *)
  apply H0. (* H0 の Pが取れる P -> Q *)
  intros. (* Pが H1になる *)
  apply (H Q).
  intro.
  apply H2.
  Qed.

Goal forall (P Q R : Prop), (P -> Q) -> (Q -> R) -> P -> R.
Proof.
  intro.
  intro.
  intro.
  intro.
  intro.
  intro.    (* R *)
  apply H0. (* Q *)
  apply H.  (* P *)
  apply H1. (* qed *)
  Qed.

Inductive list (A : Type) : Type :=
  | nil : list A
  | cons : A -> list A -> list A.

Inductive False : Prop :=.

Definition not (A : Prop) := A -> False.

Goal forall P : Prop, P ->  ~ ~ P.
Proof.
  intro.
  intro.
  intro.
  apply H0.
  apply H.
  Qed.

(* Inductive or (A B : Prop) : Prop := *)
(*   | or_introl : A -> or A B *)
(*   | or_intror : B -> or A B. *)

Goal forall (P Q : Prop), P \/ Q -> Q \/ P.
Proof.
  intros.
  case H.
  apply or_intror. (* 使えそうな定理(関数)がor_introl : A -> A \/ B
                      or_intror : B -> A \/ B*)
  apply or_introl.
  Qed.

Goal forall (P Q : Prop), P \/ Q -> Q \/ P.
Proof.
  intros.
  destruct H. (* destrucat H はcaseと同じ働き、その後仮定にあるHを消してからintroする *)
  right.      (* Q \/ P から P になる。ight タクティクは、サブゴール(型)が二つ型構成子を
                 持っているとき、そのうち二つ目の型構成子を適用する *)
  apply H.
  left.
  apply H.
  Qed.

(* Inductive and (A B : Prop) : Prop := *)
(*   conj : A -> B -> and A B. *)
Goal forall (P Q : Prop), P /\ Q -> Q /\ P.
Proof.
  intros.
  destruct H.
  split. (* 型構成子がひとつの場合 apply conj == splitになる *)
  apply H0.
  apply H.
  Qed.

Goal forall (P : Prop), P -> ~~P.
Proof.
  auto.
  Qed.
  (* info auto. *)

Goal forall (P : Prop), ~(P /\ ~P).
Proof.
  intros.
  intro.
  destruct H.
  apply H0.
  apply H.
  (* unfold not. *)
  Qed.

Goal forall (P Q : Prop), ~P \/ ~Q -> ~(P /\ Q).
Proof.
  intros.
  intro.
  destruct H.
  destruct H0.
  apply H.
  apply H0.
  destruct H0.
  apply H.
  apply H1.
  Qed.

Goal forall (P : Prop), (forall (P : Prop), ~~P -> P) -> P \/ ~P.
Proof.
  intros.
  (* destruct H. *)
  left.
  apply (H P).
  intro.
  apply H0.
  apply H.
