#!/usr/bin/env zsh
q="evaluated"

echo "--- ! ---"
echo !
echo !q! # Running this command manually does not produce the expected result.
echo q!q # Running this command manually does not produce the expected result.

echo "--- \" ---"
#echo "
#echo "q"
#echo q"q

echo "--- # ---"
#echo #
#echo #q#
echo q#q

echo "--- $ ---"
echo $
#echo $q$
#echo q$q

echo "--- % ---"
echo %
echo %q%
echo q%q

echo "--- & ---"
#echo &
#echo &q&
#echo q&q

echo "--- ' ---"
#echo '
#echo 'q'
#echo q'q

echo "--- ( ---"
#echo (
#echo (q(
#echo q(q

echo "--- ) ---"
#echo )
#echo )q)
#echo q)q

echo "--- * ---"
#echo *
#echo *q*
#echo q*q

echo "--- + ---"
echo +
echo +q+
echo q+q

echo "--- , ---"
echo ,
echo ,q,
echo q,q

echo "--- - ---"
#echo -
echo -q-
echo q-q

echo "--- . ---"
echo .
echo .q.
echo q.q

echo "--- / ---"
echo /
echo /q/
echo q/q

echo "--- : ---"
echo :
echo :q:
echo q:q

echo "--- ; ---"
#echo ;
#echo ;q;
#echo q;q

echo "--- < ---"
#echo <
#echo <q<
#echo q<q

echo "--- = ---"
echo =
#echo =q=
echo q=q

echo "--- > ---"
#echo >
#echo >q>
#echo q>q

echo "--- ? ---"
#echo ?
#echo ?q?
#echo q?q

echo "--- @ ---"
echo @
echo @q@
echo q@q

echo "--- [ ---"
echo [
#echo [q[
#echo q[q

echo "--- \ ---"
#echo \
#echo \q\
#echo q\q

echo "--- ] ---"
echo ]
echo ]q]
echo q]q

echo "--- ^ ---"
echo ^
echo ^q^
echo q^q

echo "--- _ ---"
echo _
echo _q_
echo q_q

echo "--- \` ---"
#echo `
#echo `q`
#echo q`q

echo "--- { ---"
echo {
echo {q{
echo q{q

echo "--- | ---"
#echo |
#echo |q|
#echo q|q

echo "--- } ---"
#echo }
#echo }q}
echo q}q

echo "--- ~ ---"
#echo ~
echo ~q~
echo q~q
