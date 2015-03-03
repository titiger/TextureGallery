<?php
include('config.php');
require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->config(array(
    'debug' => true,
    'templates.path' => 'templates'
));


$app->get('/', function () use($app) {
	//php logic here
	$app->render('list.php');
});

$app->get('/category/:category', function ($category) use($app) {
	//php logic here
	$app->render('list.php');
});

$app->get('/admin', function () use($app) {
	//php logic here
	$app->render('admin.php');
});

$app->run();
