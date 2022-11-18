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
    echo "file compiles correctly" > ListCompile.txt
    
else 
    echo "file does not compile correctly"
    exit
fi
set -e
echo "running tests..."
java -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > ListTestResult.txt
if [ $? -ne 0 ]
then 
    java -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples 2> ListTestResult.txt
fi
    
echo "GRADING:"

echo []




