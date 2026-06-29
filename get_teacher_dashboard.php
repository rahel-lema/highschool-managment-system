<?php
require_once __DIR__ . '/common.php';
$teacher = require_teacher(false);

ensure_teacher_tables();

$assigned = [];
$stmt = $conn->prepare("SELECT DISTINCT a.class_id, c.name
    FROM assignments a
    LEFT JOIN classes c ON c.id = a.class_id
    WHERE a.teacher_username = ? AND a.assignment_type = 'teacher'
    ORDER BY a.class_id ASC");

if ($stmt) {
    $stmt->bind_param('s', $teacher);
    $stmt->execute();
    $res = $stmt->get_result();
    while ($row = $res->fetch_assoc()) {
        $id = (int)($row['class_id'] ?? 0);
        if ($id > 0) {
            $assigned[] = [
                'class_id' => $id,
                'name' => (string)($row['name'] ?? ('Class ' . $id))
            ];
        }
    }
    $stmt->close();
}

$legacy = $conn->prepare("SELECT DISTINCT a.class_id, c.name
    FROM assigned_teachers a
    LEFT JOIN classes c ON c.id = a.class_id
    WHERE a.teacher_username = ?
    ORDER BY a.class_id ASC");

if ($legacy) {
    $seen = [];
    foreach ($assigned as $c) {
        $seen[(int)$c['class_id']] = true;
    }

    $legacy->bind_param('s', $teacher);
    $legacy->execute();
    $res = $legacy->get_result();
    while ($row = $res->fetch_assoc()) {
        $id = (int)($row['class_id'] ?? 0);
        if ($id > 0 && !isset($seen[$id])) {
            $assigned[] = [
                'class_id' => $id,
                'name' => (string)($row['name'] ?? ('Class ' . $id))
            ];
        }
    }
    $legacy->close();
}

$totalStudents = 0;
$countStmt = $conn->prepare("SELECT COUNT(*) AS c FROM class_enrollments WHERE class_id = ?");
if ($countStmt) {
    foreach ($assigned as $c) {
        $cid = (int)$c['class_id'];
        $countStmt->bind_param('i', $cid);
        $countStmt->execute();
        $row = $countStmt->get_result()->fetch_assoc();
        $totalStudents += (int)($row['c'] ?? 0);
    }
    $countStmt->close();
}

respond(true, 'Teacher dashboard loaded', [
    'statistics' => [
        'total_classes' => count($assigned),
        'total_students' => $totalStudents
    ],
    'assigned_classes' => $assigned
]);
?>
