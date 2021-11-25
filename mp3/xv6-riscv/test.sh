cp -r myAns/kernel .
cp -r myAns/user .
cp early_bird_test/*.c user/

 
cp myAns/SOL/FCFS/* user/
python3 early_bird_test/grade-mp3-FCFS
sleep 2
cp myAns/SOL/RR/* user/
python3 early_bird_test/grade-mp3-RR
sleep 2
cp myAns/SOL/SJF/* user/
python3 early_bird_test/grade-mp3-SJF
sleep 2
cp myAns/SOL/PSJF/* user/
python3 early_bird_test/grade-mp3-PSJF
