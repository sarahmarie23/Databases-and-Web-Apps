<?php 

    $username = "smj83";
    $password = "Calyps01!";

    $db_conn_str = 
    "(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)
                               (HOST = cedar.humboldt.edu)
                               (PORT = 1521))
                    (CONNECT_DATA = (SID = STUDENT)))";

    $conn = oci_connect($username, $password, $db_conn_str);

    $password = NULL;

    
    $display_str = 'select name, num_correct from submissions order by num_correct desc';
    $display_stmt = oci_parse($conn, $display_str);
    oci_execute($display_stmt, OCI_DEFAULT);
    
    $display_arr = array();
    while($row = oci_fetch_array($display_stmt, OCI_ASSOC)){
         array_push($display_arr, $row);
    }
    
    echo json_encode($display_arr);
    
   
    oci_free_statement($display_stmt);

    oci_close($conn);
    
    ?>
