<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../config/db_config.php';

session_start();
if (!isset($_SESSION['username']) || (($_SESSION['role'] ?? '') !== 'admin')) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized', 'data' => null]);
    exit;
}

$conn->query("CREATE TABLE IF NOT EXISTS subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE
)");

$countResult = $conn->query("SELECT COUNT(*) AS c FROM subjects");
$count = $countResult ? (int)($countResult->fetch_assoc()['c'] ?? 0) : 0;
if ($count === 0) {
    $conn->query("INSERT IGNORE INTO subjects (subject_name) VALUES
        ('Mathematics'),
        ('English'),
        ('Biology'),
        ('Physics'),
        ('Chemistry'),
        ('Civic'),
        ('Sport'),
        ('IT'),
        ('Economics')");
}

$subjects = [];
$res = $conn->query("SELECT subject_name FROM subjects ORDER BY subject_name ASC");
if ($res) {
    while ($row = $res->fetch_assoc()) {
        $name = trim((string)($row['subject_name'] ?? ''));
        if ($name !== '') {
            $subjects[] = $name;
        }
    }
}

echo json_encode(['success' => true, 'message' => 'Subjects loaded', 'data' => ['subjects' => $subjects]]);
?>
