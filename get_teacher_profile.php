<?php
require_once __DIR__ . '/common.php';
$teacher = require_teacher(false);

$conn->query("CREATE TABLE IF NOT EXISTS teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    fname VARCHAR(50) NOT NULL,
    mname VARCHAR(50) NULL,
    lname VARCHAR(50) NOT NULL,
    department VARCHAR(100) NULL,
    subject VARCHAR(100) NULL
)");

ensure_columns('teachers', [
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

$sql = "SELECT u.username, u.email, t.fname, t.lname,
            t.department,
            t.office_phone,
            t.office_room,
            t.subject,
            t.username AS employee_id_generated
        FROM users u
        LEFT JOIN teachers t ON t.username = u.username
        WHERE u.username = ?
        LIMIT 1";

$stmt = $conn->prepare($sql);
if (!$stmt) {
    respond(false, 'DB error');
}

$stmt->bind_param('s', $teacher);
$stmt->execute();
$row = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$row) {
    respond(false, 'Teacher not found');
}

respond(true, 'Teacher profile loaded', ['teacher' => $row]);
?>
