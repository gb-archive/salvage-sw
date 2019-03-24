rem echo %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
set PATH="C:\\sdcc-2.9\\bin"
sdcc --stack-auto --vc -mgbz80 %1 %2 %3 %4 %5 %6 %7 %8 %9
