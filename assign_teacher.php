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

$conn->query("CREATE TABLE IF NOT EXISTS assigned_teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_username VARCHAR(50) NOT NULL,
    class_id INT NOT NULL,
    subject_name VARCHAR(100) NOT NULL
)");

$conn->query("CREATE TABLE IF NOT EXISTS assignments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    teacher_username VARCHAR(50) NOT NULL,
    subject_name VARCHAR(100) NULL,
    assignment_type VARCHAR(20) NOT NULL DEFAULT 'teacher',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)");

$data = json_decode(file_get_contents('php://input'), true);
if (!is_array($data)) $data = $_POST;

$teacher = trim((string)($data['teacher_username'] ?? ''));
$classId = (int)($data['class_id'] ?? 0);
$subject = trim((string)($data['subject_name'] ?? ''));

if ($teacher === '' || $classId === 0 || $subject === '') {
    echo json_encode(['success' => false, 'message' => 'teacher, class and subject required', 'data' => null]);
    exit;
}

$exists = false;
$check = $conn->prepare("SELECT id FROM assigned_teachers WHERE teacher_username = ? AND class_id = ? AND subject_name = ? LIMIT 1");
if ($check) {
    $check->bind_param('sis', $teacher, $classId, $subject);
    $check->execute();
    $exists = (bool)$check->get_result()->fetch_assoc();
    $check->close();
}

if (!$exists) {
    $st = $conn->prepare("INSERT INTO assigned_teachers (teacher_username, class_id, subject_name) VALUES (?, ?, ?)");
    if (!$st) {
        echo json_encode(['success' => false, 'message' => 'DB error', 'data' => null]);
        exit;
    }
    $st->bind_param('sis', $teacher, $classId, $subject);
    $st->execute();
    $st->close();
}

$exists = false;
$check = $conn->prepare("SELECT id FROM assignments WHERE class_id = ? AND teacher_username = ? AND subject_name = ? AND assignment_type = 'teacher' LIMIT 1");
if ($check) {
    $check->bind_param('iss', $classId, $teacher, $subject);
    $check->execute();
    $exists = (bool)$check->get_result()->fetch_assoc();
    $check->close();
}

if (!$exists) {
    $assignment = $conn->prepare("INSERT INTO assignments (class_id, teacher_username, subject_name, assignment_type) VALUES (?, ?, ?, 'teacher')");
    if (!$assignment) {
        echo json_encode(['success' => false, 'message' => 'DB error (assignment)', 'data' => null]);
        exit;
    }
    $assignment->bind_param('iss', $classId, $teacher, $subject);
    $assignment->execute();
    $assignment->close();
}

echo json_encode(['success' => true, 'message' => 'Assigned', 'data' => null]);
?>
