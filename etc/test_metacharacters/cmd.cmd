@echo off
@setlocal enabledelayedexpansion
@set "q=evaluated"

echo --- i ---
@rem echo !
@rem echo !q!
@rem echo q!q

echo --- " ---
echo "
echo "q"
echo q"q

echo --- # ---
echo #
echo #q#
echo q#q

echo --- $ ---
echo $
echo $q$
echo q$q

echo --- %% ---
@rem echo %
@rem echo %q%
@rem echo q%q

echo --- ^& ---
@rem echo &
@rem echo &q&
@rem echo q&q

echo --- ' ---
echo '
echo 'q'
echo q'q

echo --- ( ---
echo (
echo (q(
echo q(q

echo --- ) ---
echo )
echo )q)
echo q)q

echo --- * ---
echo *
echo *q*
echo q*q

echo --- + ---
echo +
echo +q+
echo q+q

echo --- , ---
echo ,
echo ,q,
echo q,q

echo --- - ---
echo -
echo -q-
echo q-q

echo --- . ---
echo .
echo .q.
echo q.q

echo --- / ---
echo /
echo /q/
echo q/q

echo --- : ---
echo :
echo :q:
echo q:q

echo --- ; ---
echo ;
echo ;q;
echo q;q

echo --- ^< ---
@rem echo <
@rem echo <q<
@rem echo q<q

echo --- = ---
echo =
echo =q=
echo q=q

echo --- ^> ---
@rem echo >
@rem echo >q>
@rem echo q>q

echo --- ? ---
echo ?
echo ?q?
echo q?q

echo --- @ ---
echo @
echo @q@
echo q@q

echo --- [ ---
echo [
echo [q[
echo q[q

echo --- \ ---
echo \
echo \q\
echo q\q

echo --- ] ---
echo ]
echo ]q]
echo q]q

echo --- ^^ ---
@rem echo ^
@rem echo ^q^
@rem echo q^q

echo --- _ ---
echo _
echo _q_
echo q_q

echo --- \` ---
echo `
echo `q`
echo q`q

echo --- { ---
echo {
echo {q{
echo q{q

echo --- ^| ---
@rem echo |
@rem echo |q|
@rem echo q|q

echo --- } ---
echo }
echo }q}
echo q}q

echo --- ~ ---
echo ~
echo ~q~
echo q~q

@endlocal
