<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../config/db_config.php';

session_start();
if (!isset($_SESSION['username']) || (($_SESSION['role'] ?? '') !== 'admin')) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized', 'data' => null]);
    exit;
}

$username = trim((string)($_GET['username'] ?? ''));
$role = trim((string)($_GET['role'] ?? ''));

if ($username === '' || !in_array($role, ['student', 'teacher'], true)) {
    echo json_encode(['success' => false, 'message' => 'username and role required', 'data' => null]);
    exit;
}

function ensure_columns($conn, $table, $columns) {
    foreach ($columns as $name => $definition) {
        $safeName = $conn->real_escape_string($name);
        $check = $conn->query("SHOW COLUMNS FROM `$table` LIKE '$safeName'");
        if ($check && $check->num_rows === 0) {
            $conn->query("ALTER TABLE `$table` ADD COLUMN $definition");
        }
    }
}

if ($role === 'student') {
    $sql = "SELECT u.username, u.email, u.role, u.status,
                s.fname, s.mname, s.lname, s.date_of_birth, s.age, s.sex,
                s.grade_level, s.stream, s.address, s.parent_name, s.parent_phone
            FROM users u
            LEFT JOIN students s ON s.username = u.username
            WHERE u.username = ? AND u.role = 'student'
            LIMIT 1";
} else {
    ensure_columns($conn, 'teachers', [
        'mname' => 'mname VARCHAR(50) NULL AFTER fname',
        'date_of_birth' => 'date_of_birth DATE NULL',
        'age' => 'age INT NULL',
        'sex' => 'sex VARCHAR(20) NULL',
        'address' => 'address TEXT NULL',
        'department' => 'department VARCHAR(100) NULL',
        'subject' => 'subject VARCHAR(100) NULL',
        'office_room' => 'office_room VARCHAR(50) NULL',
        'office_phone' => 'office_phone VARCHAR(50) NULL'
    ]);

    $sql = "SELECT u.username, u.email, u.role, u.status,
                t.fname, t.mname, t.lname, t.date_of_birth, t.age, t.sex,
                t.address, t.department, t.subject, t.office_room, t.office_phone
            FROM users u
            LEFT JOIN teachers t ON t.username = u.username
            WHERE u.username = ? AND u.role = 'teacher'
            LIMIT 1";
}

$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'DB error', 'data' => null]);
    exit;
}

$stmt->bind_param('s', $username);
$stmt->execute();
$user = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$user) {
    echo json_encode(['success' => false, 'message' => 'User not found', 'data' => null]);
    exit;
}

echo json_encode(['success' => true, 'message' => 'User loaded', 'data' => ['user' => $user]]);
?>
