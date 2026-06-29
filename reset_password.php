<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../config/db_config.php';

session_start();
if (!isset($_SESSION['username']) || (($_SESSION['role'] ?? '') !== 'admin')) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized', 'data' => null]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'POST only', 'data' => null]);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
if (!is_array($data)) $data = $_POST;

$username = trim((string)($data['username'] ?? ''));
$role = trim((string)($data['role'] ?? ''));

if ($username === '' || !in_array($role, ['student', 'teacher'], true)) {
    echo json_encode(['success' => false, 'message' => 'username and role required', 'data' => null]);
    exit;
}

function random_temp_pass($len = 6) {
    $chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    $out = '';
    for ($i = 0; $i < $len; $i++) {
        $out .= $chars[random_int(0, strlen($chars) - 1)];
    }
    return $out;
}

$plainPassword = random_temp_pass(6);
$passwordHash = password_hash($plainPassword, PASSWORD_DEFAULT);

$stmt = $conn->prepare("UPDATE users SET password = ? WHERE username = ? AND role = ?");
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'DB error', 'data' => null]);
    exit;
}

$stmt->bind_param('sss', $passwordHash, $username, $role);
$stmt->execute();
$updated = $stmt->affected_rows;
$stmt->close();

if ($updated < 1) {
    echo json_encode(['success' => false, 'message' => 'User not found', 'data' => null]);
    exit;
}

echo json_encode([
    'success' => true,
    'message' => 'Password reset',
    'data' => [
        'username' => $username,
        'password' => $plainPassword
    ]
]);
?>
