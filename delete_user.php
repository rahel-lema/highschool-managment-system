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

if ($role === 'student') {
    $tables = ['students', 'class_enrollments', 'grades'];
    foreach ($tables as $table) {
        $column = $table === 'students' ? 'username' : 'student_username';
        $stmt = $conn->prepare("DELETE FROM `$table` WHERE `$column` = ?");
        if ($stmt) {
            $stmt->bind_param('s', $username);
            $stmt->execute();
            $stmt->close();
        }
    }
} else {
    $tables = ['teachers', 'assignments', 'assigned_teachers', 'announcements', 'resources'];
    foreach ($tables as $table) {
        $column = $table === 'teachers' ? 'username' : 'teacher_username';
        $stmt = $conn->prepare("DELETE FROM `$table` WHERE `$column` = ?");
        if ($stmt) {
            $stmt->bind_param('s', $username);
            $stmt->execute();
            $stmt->close();
        }
    }
}

$stmt = $conn->prepare("DELETE FROM users WHERE username = ? AND role = ?");
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'DB error', 'data' => null]);
    exit;
}
$stmt->bind_param('ss', $username, $role);
$stmt->execute();
$deleted = $stmt->affected_rows;
$stmt->close();

echo json_encode(['success' => true, 'message' => 'User deleted', 'data' => ['deleted' => $deleted]]);
?>
