<?php
$path = __DIR__ . '/chats/';
$data['result'] = 'success';
// Подключение к базе данных MySQL
$host = 'localhost';
$db = 'company_website_db';
$user = 'root';
$password = '';
try {
  $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $password);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  $data['result'] = 'error';
  $data['error'] = 'Произошла ошибка при подключении к базе данных';
  echo json_encode($data);
  exit();
}
// Получаем данные, которые пришли на сервер
$input = file_get_contents('php://input');
// Декодируем полученную JSON строку
$data = json_decode($input, true);
// Проверяем была ли ошибка при декодировании JSON
if (json_last_error() !== JSON_ERROR_NONE) {
  $data['result'] = 'error';
  $data['error'] = 'Произошла ошибка при декодировании JSON строки';
  echo json_encode($data);
  exit();
}
// Получаем id клиента
$idClient = $data['id'];
// Получаем сообщения из чата
$chat = $data['chat'];
$start = $data['start'];
$date = $data['date'];
// Имя файла
$fileName = $path . $idClient;
$output = '';
foreach ($chat as $key => $value) {
  $output .= $key . '[' . $value['type'] . ']:' . PHP_EOL;
  $output .= strip_tags($value['content']) . PHP_EOL;
}
// Записываем сообщения в файл
if (!file_exists($fileName)) {
  $text = '// ' . $idClient . ' //' . PHP_EOL . PHP_EOL;
  if ($start) {
    $text .= '/////// start ///////' . PHP_EOL . $date . PHP_EOL . '/////// start ///////' . PHP_EOL;
  }
  $text .= $output;
  file_put_contents($fileName, $text, LOCK_EX);
} else {
  $text = '';
  if ($start) {
    $text .= PHP_EOL . '/////// start ///////' . PHP_EOL . $date . PHP_EOL . '/////// start ///////' . PHP_EOL;
  }
  $text .= $output;
  file_put_contents($fileName, $text, FILE_APPEND | LOCK_EX);
}
// Записываем сообщения в базу данных MySQL
try {
  $stmt = $pdo->prepare("INSERT INTO chatbot_messages (client_id, message_type, message_content, date_time) VALUES (:client_id, :message_type, :message_content, :date_time)");
  foreach ($chat as $key => $value) {
    $messageType = $value['type'];
    $messageContent = strip_tags($value['content']);
    $dateTime = date('Y-m-d H:i:s');
    $stmt->bindParam(':client_id', $idClient);
    $stmt->bindParam(':message_type', $messageType);
    $stmt->bindParam(':message_content', $messageContent);
    $stmt->bindParam(':date_time', $dateTime);
    $stmt->execute();
  }
} catch (PDOException $e) {
  $data['result'] = 'error';
  $data['error'] = 'Произошла ошибка при записи сообщений в базу данных';
  echo json_encode($data);
  exit();
}
echo json_encode($data);