<?php
require_once __DIR__ . '/common.php';
$teacher = require_teacher(false);

$classId = (int)($_GET['class_id'] ?? 0);
$subjects = [];

ensure_teacher_tables();

if ($classId > 0) {
    $stmt = $conn->prepare("SELECT DISTINCT subject_name FROM assignments
        WHERE assignment_type = 'teacher' AND teacher_username = ? AND class_id = ? AND IFNULL(subject_name,'') <> ''
        ORDER BY subject_name");
    if ($stmt) {
        $stmt->bind_param('si', $teacher, $classId);
        $stmt->execute();
        $res = $stmt->get_result();
        while ($row = $res->fetch_assoc()) {
            $name = trim((string)($row['subject_name'] ?? ''));
            if ($name !== '') $subjects[] = $name;
        }
        $stmt->close();
    }
}

if (count($subjects) === 0 && $classId > 0) {
    $stmt = $conn->prepare("SELECT DISTINCT subject_name FROM assigned_teachers
        WHERE teacher_username = ? AND class_id = ? AND IFNULL(subject_name,'') <> ''
        ORDER BY subject_name");
    if ($stmt) {
        $stmt->bind_param('si', $teacher, $classId);
        $stmt->execute();
        $res = $stmt->get_result();
        while ($row = $res->fetch_assoc()) {
            $name = trim((string)($row['subject_name'] ?? ''));
            if ($name !== '') $subjects[] = $name;
        }
        $stmt->close();
    }
}

if (count($subjects) === 0) {
    $stmt = $conn->prepare("SELECT DISTINCT subject_name FROM assignments
        WHERE assignment_type = 'teacher' AND teacher_username = ? AND IFNULL(subject_name,'') <> ''
        ORDER BY subject_name");
    if ($stmt) {
        $stmt->bind_param('s', $teacher);
        $stmt->execute();
        $res = $stmt->get_result();
        while ($row = $res->fetch_assoc()) {
            $name = trim((string)($row['subject_name'] ?? ''));
            if ($name !== '') $subjects[] = $name;
        }
        $stmt->close();
    }
}

if (count($subjects) === 0) {
    $subjects = ['Mathematics', 'English', 'Biology'];
}

respond(true, 'Class subjects loaded', ['subjects' => $subjects]);
?>
