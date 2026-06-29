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
$email = trim((string)($data['email'] ?? ''));
$status = trim((string)($data['status'] ?? 'active'));

if ($username === '' || !in_array($role, ['student', 'teacher'], true) || $email === '') {
    echo json_encode(['success' => false, 'message' => 'username, role and email required', 'data' => null]);
    exit;
}

if (!in_array($status, ['active', 'inactive'], true)) {
    $status = 'active';
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

$st = $conn->prepare("UPDATE users SET email = ?, status = ? WHERE username = ? AND role = ?");
if (!$st) {
    echo json_encode(['success' => false, 'message' => 'DB error (users)', 'data' => null]);
    exit;
}
$st->bind_param('ssss', $email, $status, $username, $role);
$st->execute();
$st->close();

$fname = trim((string)($data['fname'] ?? ''));
$mname = trim((string)($data['mname'] ?? ''));
$lname = trim((string)($data['lname'] ?? ''));
$dob = trim((string)($data['date_of_birth'] ?? ''));
$ageRaw = trim((string)($data['age'] ?? ''));
$age = $ageRaw === '' ? null : (int)$ageRaw;
$sex = trim((string)($data['sex'] ?? ''));
$address = trim((string)($data['address'] ?? ''));

if ($fname === '' || $lname === '') {
    echo json_encode(['success' => false, 'message' => 'First and last name required', 'data' => null]);
    exit;
}

if ($role === 'student') {
    $gradeLevel = trim((string)($data['grade_level'] ?? ''));
    $stream = trim((string)($data['stream'] ?? ''));
    $parentName = trim((string)($data['parent_name'] ?? ''));
    $parentPhone = trim((string)($data['parent_phone'] ?? ''));

    $sql = "UPDATE students SET fname = ?, mname = ?, lname = ?, date_of_birth = NULLIF(?, ''), age = ?, sex = ?, grade_level = ?, stream = ?, address = ?, parent_name = ?, parent_phone = ? WHERE username = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        echo json_encode(['success' => false, 'message' => 'DB error (students)', 'data' => null]);
        exit;
    }
    $stmt->bind_param('ssssisssssss', $fname, $mname, $lname, $dob, $age, $sex, $gradeLevel, $stream, $address, $parentName, $parentPhone, $username);
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

    $department = trim((string)($data['department'] ?? ''));
    $subject = trim((string)($data['subject'] ?? ''));
    $officeRoom = trim((string)($data['office_room'] ?? ''));
    $officePhone = trim((string)($data['office_phone'] ?? ''));

    $sql = "UPDATE teachers SET fname = ?, mname = ?, lname = ?, date_of_birth = NULLIF(?, ''), age = ?, sex = ?, address = ?, department = ?, subject = ?, office_room = ?, office_phone = ? WHERE username = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        echo json_encode(['success' => false, 'message' => 'DB error (teachers)', 'data' => null]);
        exit;
    }
    $stmt->bind_param('ssssisssssss', $fname, $mname, $lname, $dob, $age, $sex, $address, $department, $subject, $officeRoom, $officePhone, $username);
}

$stmt->execute();
$stmt->close();

echo json_encode(['success' => true, 'message' => 'User updated', 'data' => ['username' => $username, 'role' => $role]]);
?>
