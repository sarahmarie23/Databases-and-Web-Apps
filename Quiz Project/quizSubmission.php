<?php

$username = "XXXXXXXXXX";
$password = "XXXXXXXXXX";

$quizuser = $_POST["quizuser"];
$q1 = $_POST["question1"];
$q2 = $_POST["question2"];
$q3 = $_POST["question3"];
$q4 = $_POST["question4"];
$q5 = $_POST["question5"];
$q6 = $_POST["question6"];
$q7 = strtoupper($_POST["question7"]);
$q8 = strtoupper($_POST["question8"]);


$db_conn_str = 
    "(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)
                               (HOST = cedar.humboldt.edu)
                               (PORT = 1521))
                    (CONNECT_DATA = (SID = STUDENT)))";

$conn = oci_connect($username, $password, $db_conn_str);

$password = NULL;


$quiz_str = 'INSERT INTO submissions
             VALUES
             (id_seq.NEXTVAL, 1000, :quizuser, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, 0)';

$quiz_query_stmt = oci_parse($conn, $quiz_str);

oci_bind_by_name($quiz_query_stmt, ":quizuser", $quizuser);
oci_bind_by_name($quiz_query_stmt, ":q1", $q1);
oci_bind_by_name($quiz_query_stmt, ":q2", $q2);
oci_bind_by_name($quiz_query_stmt, ":q3", $q3);
oci_bind_by_name($quiz_query_stmt, ":q4", $q4);
oci_bind_by_name($quiz_query_stmt, ":q5", $q5);
oci_bind_by_name($quiz_query_stmt, ":q6", $q6);
oci_bind_by_name($quiz_query_stmt, ":q7", $q7);
oci_bind_by_name($quiz_query_stmt, ":q8", $q8);


oci_execute($quiz_query_stmt, OCI_COMMIT_ON_SUCCESS);


oci_free_statement($quiz_query_stmt);


?>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">  
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
    <script type="module" src="quizSubmission.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Pirata+One&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" type="text/css" href="quizSubmission.css">  
    <title>Quiz submission</title>
    <link href="https://fonts.googleapis.com/css?family=Noto Sans" rel="stylesheet">
  
</head>
    
<body>
    <?php
    
    $grade_func_str = 'begin :the_score := grade_quiz(:quizuser); end;';
    $grade_func_stmt = oci_parse($conn, $grade_func_str);
    oci_bind_by_name($grade_func_stmt, ':quizuser', $quizuser);
    oci_bind_by_name($grade_func_stmt, ':the_score', $score, 1);
    oci_execute($grade_func_stmt, OCI_COMMIT_ON_SUCCESS); 
    
   
    echo "SCORE: ".$score;
    
    ?>
   <div>
    <p class="text">
        YOUR SCORE: <?php echo $score?>
        <br><br>        
        Wanna see how your score compares to everyone else?
        
    </p>
    <a href="results.html">CLICK HERE</a>
    </div>   
        
   
    <div id="data"></div>
    
    
    <?php
    
    oci_free_statement($grade_func_stmt);
    oci_close($conn);
    
   ?> 
</body>
</html>



