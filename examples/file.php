<?php
header('Content-Type: text/plain');
echo "Server IP: ".$_SERVER['SERVER_ADDR'];
echo "\nServer port: ".$_SERVER['SERVER_PORT'];
echo "\nClient IP: ".$_SERVER['REMOTE_ADDR'];
//Get the forwarded IP if it exists
if ( array_key_exists( 'X-Forwarded-For', $headers ) && filter_var( $headers['X-Forwarded-For'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) )
{
    $the_ip = $headers['X-Forwarded-For'];
}
elseif ( array_key_exists( 'HTTP_X_FORWARDED_FOR', $headers ) && filter_var( $headers['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ))
{
    $the_ip = $headers['HTTP_X_FORWARDED_FOR'];
} else {
    $the_ip = filter_var( $_SERVER['REMOTE_ADDR'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 );
}
echo "\nX-Forwarded-For: ".$the_ip;
?>