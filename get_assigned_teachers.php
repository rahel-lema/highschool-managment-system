<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../config/db_config.php';

session_start();
if (!isset($_SESSION['username']) || (($_SESSION['role'] ?? '') !== 'admin')) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized', 'data' => null]);
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

$items = [];
$sql = "SELECT a.teacher_username, a.class_id, a.subject_name, c.name AS class_name
        FROM assignments a
        LEFT JOIN classes c ON c.id = a.class_id
        WHERE a.assignment_type = 'teacher'
        ORDER BY a.id DESC";
$res = $conn->query($sql);
if ($res) {
    while ($row = $res->fetch_assoc()) {
        $items[] = [
            'teacher_username' => (string)($row['teacher_username'] ?? ''),
            'class_id' => (int)($row['class_id'] ?? 0),
            'class_name' => (string)($row['class_name'] ?? ''),
            'subject_name' => (string)($row['subject_name'] ?? '')
        ];
    }
}

$seen = [];
foreach ($items as $item) {
    $key = $item['teacher_username'] . '|' . $item['class_id'] . '|' . $item['subject_name'];
    $seen[$key] = true;
}

$legacySql = "SELECT a.teacher_username, a.class_id, a.subject_name, c.name AS class_name
        FROM assigned_teachers a
        LEFT JOIN classes c ON c.id = a.class_id
        ORDER BY a.id DESC";
$legacy = $conn->query($legacySql);
if ($legacy) {
    while ($row = $legacy->fetch_assoc()) {
        $key = (string)($row['teacher_username'] ?? '') . '|' . (int)($row['class_id'] ?? 0) . '|' . (string)($row['subject_name'] ?? '');
        if (isset($seen[$key])) {
            continue;
        }

        $items[] = [
            'teacher_username' => (string)($row['teacher_username'] ?? ''),
            'class_id' => (int)($row['class_id'] ?? 0),
            'class_name' => (string)($row['class_name'] ?? ''),
            'subject_name' => (string)($row['subject_name'] ?? '')
        ];
    }
}

echo json_encode(['success' => true, 'message' => 'Assigned teachers loaded', 'data' => ['assigned_teachers' => $items]]);
?>
