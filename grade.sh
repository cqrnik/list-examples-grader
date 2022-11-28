# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission

cd student-submission


if [ -f ListExamples.java ]
then 
    echo "file exists in given repository"
else 
    echo "file does not exist in given repository"
    exit
fi

cp ../TestListExamples.java ./

set +e
javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" TestListExamples.java 2> ListCompile.txt
if [ $? -eq 0 ]
then 
    echo "file compiles correctly"
    
else 
    echo "file does not compile correctly"
    exit
fi

echo "running tests..."
java -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > ListTestResult.txt
if [ $? -ne 0 ]
then 
    java -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > ListTestResult.txt
fi

echo "GRADING:"
total_tests=$(grep -B 1 "Time" ListTestResult.txt | head -n +1 |grep -o '\.' | wc -l ) 
junit_errors=$(grep -B 1 "Time" ListTestResult.txt | head -n +1 |grep -o 'E' | wc -l)
echo "Total Tests Run:"

echo $total_tests
echo "Errors:"
echo $junit_errors

echo "FINAL SCORE:"
echo $((total_tests - junit_errors))"/"$total_tests












