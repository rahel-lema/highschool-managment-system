

  `teacher_username` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `teacher_username`, `title`, `message`, `class_id`, `created_at`, `attachment_name`, `attachment_url`) VALUES
(3, 'tch003', 'exam day', 'on 12.1.2012', 0, '2026-05-20 14:18:06', NULL, NULL),
(4, 'tch003', 'sdgf', 'fdshgf', 1, '2026-05-20 14:21:52', 'chaoter 3.pdf', 'backend/teacher/uploads/announcements/20260521002152_chaoter_3.pdf'),
(5, 'tch001', 'v', 'a', 1, '2026-05-20 15:01:54', 'chaoter 3.pdf', 'backend/teacher/uploads/announcements/20260521010154_chaoter_3.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_teachers`
--

CREATE TABLE `assigned_teachers` (
  `id` int(11) NOT NULL,
  `teacher_username` varchar(50) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_teachers`
--

INSERT INTO `assigned_teachers` (`id`, `teacher_username`, `class_id`, `subject_name`) VALUES
(1, 'tch001', 1, 'Mathematics'),
(2, 'tch003', 1, 'dsa');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_username` varchar(50) NOT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `assignment_type` varchar(20) NOT NULL DEFAULT 'teacher',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `class_id`, `teacher_username`, `subject_name`, `assignment_type`, `created_at`) VALUES
(1, 1, 'tch001', 'Mathematics', 'teacher', '2026-05-19 20:32:32'),
(2, 1, 'tch001', 'English', 'teacher', '2026-05-19 20:32:32'),
(3, 1, 'tch003', 'dsa', 'teacher', '2026-05-20 14:18:33'),
(4, 2, 'tch002', 'Biology', 'teacher', '2026-05-20 14:38:02'),
(5, 2, 'tch004', 'History', 'teacher', '2026-05-20 14:38:02'),
(6, 3, 'tch001', 'Mathematics', 'teacher', '2026-05-20 14:38:02'),
(7, 3, 'tch003', 'Physics', 'teacher', '2026-05-20 14:38:02'),
(8, 4, 'tch002', 'Chemistry', 'teacher', '2026-05-20 14:38:02'),
(9, 4, 'tch005', 'English', 'teacher', '2026-05-20 14:38:02'),
(10, 5, 'tch003', 'Physics', 'teacher', '2026-05-20 14:38:02'),
(11, 5, 'tch002', 'Biology', 'teacher', '2026-05-20 14:38:02'),
(12, 6, 'tch001', 'Mathematics', 'teacher', '2026-05-20 14:38:02'),
(13, 6, 'tch002', 'Chemistry', 'teacher', '2026-05-20 14:38:02'),
(14, 7, 'tch004', 'History', 'teacher', '2026-05-20 14:38:02'),
(15, 7, 'tch005', 'English', 'teacher', '2026-05-20 14:38:02'),
(16, 8, 'tch004', 'Geography', 'teacher', '2026-05-20 14:38:02'),
(17, 8, 'tch005', 'Civics', 'teacher', '2026-05-20 14:38:02'),
(18, 9, 'tch003', 'Physics', 'teacher', '2026-05-20 14:38:02'),
(19, 9, 'tch001', 'Mathematics', 'teacher', '2026-05-20 14:38:02'),
(20, 10, 'tch002', 'Chemistry', 'teacher', '2026-05-20 14:38:02'),
(21, 10, 'tch005', 'English', 'teacher', '2026-05-20 14:38:02'),
(22, 11, 'tch004', 'Economics', 'teacher', '2026-05-20 14:38:02'),
(23, 11, 'tch005', 'English', 'teacher', '2026-05-20 14:38:02'),
(24, 12, 'tch004', 'History', 'teacher', '2026-05-20 14:38:02'),
(25, 12, 'tch005', 'Civics', 'teacher', '2026-05-20 14:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `grade_level` varchar(20) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `grade_level`, `section`) VALUESCREATE DATABASE bensa_school;
use bensa_school;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `fname`, `lname`, `department`, `phone`) VALUES
(1, 'adm001', 'Admin', 'One', 'Registration', '');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
(1, 'Grade 9 - A', '9', 'A'),
(2, 'Grade 9 A', '9', 'A'),
(3, 'Grade 9 B', '9', 'B'),
(4, 'Grade 10 A', '10', 'A'),
(5, 'Grade 10 B', '10', 'B'),
(6, 'Grade 11 Natural A', '11', 'A'),
(7, 'Grade 11 Natural B', '11', 'B'),
(8, 'Grade 11 Social A', '11', 'A'),
(9, 'Grade 11 Social B', '11', 'B'),
(10, 'Grade 12 Natural A', '12', 'A'),
(11, 'Grade 12 Natural B', '12', 'B'),
(12, 'Grade 12 Social A', '12', 'A'),
(13, 'Grade 12 Social B', '12', 'B'),
(14, 'Grade 9 A', '9', 'A'),
(15, 'Grade 9 B', '9', 'B'),
(16, 'Grade 10 A', '10', 'A'),
(17, 'Grade 10 B', '10', 'B'),
(18, 'Grade 11 Natural A', '11', 'A'),
(19, 'Grade 11 Natural B', '11', 'B'),
(20, 'Grade 11 Social A', '11', 'A'),
(21, 'Grade 11 Social B', '11', 'B'),
(22, 'Grade 12 Natural A', '12', 'A'),
(23, 'Grade 12 Natural B', '12', 'B'),
(24, 'Grade 12 Social A', '12', 'A'),
(25, 'Grade 12 Social B', '12', 'B'),
(26, 'Grade 9 A', '9', 'A'),
(27, 'Grade 9 B', '9', 'B'),
(28, 'Grade 10 A', '10', 'A'),
(29, 'Grade 10 B', '10', 'B'),
(30, 'Grade 11 Natural A', '11', 'A'),
(31, 'Grade 11 Natural B', '11', 'B'),
(32, 'Grade 11 Social A', '11', 'A'),
(33, 'Grade 11 Social B', '11', 'B'),
(34, 'Grade 12 Natural A', '12', 'A'),
(35, 'Grade 12 Natural B', '12', 'B'),
(36, 'Grade 12 Social A', '12', 'A'),
(37, 'Grade 12 Social B', '12', 'B'),
(38, 'Grade 9 A', '9', 'A'),
(39, 'Grade 9 B', '9', 'B'),
(40, 'Grade 10 A', '10', 'A'),
(41, 'Grade 10 B', '10', 'B'),
(42, 'Grade 11 Natural A', '11', 'A'),
(43, 'Grade 11 Natural B', '11', 'B'),
(44, 'Grade 11 Social A', '11', 'A'),
(45, 'Grade 11 Social B', '11', 'B'),
(46, 'Grade 12 Natural A', '12', 'A'),
(47, 'Grade 12 Natural B', '12', 'B'),
(48, 'Grade 12 Social A', '12', 'A'),
(49, 'Grade 12 Social B', '12', 'B'),
(50, 'Grade 9 A', '9', 'A'),
(51, 'Grade 9 B', '9', 'B'),
(52, 'Grade 10 A', '10', 'A'),
(53, 'Grade 10 B', '10', 'B'),
(54, 'Grade 11 Natural A', '11', 'A'),
(55, 'Grade 11 Natural B', '11', 'B'),
(56, 'Grade 11 Social A', '11', 'A'),
(57, 'Grade 11 Social B', '11', 'B'),
(58, 'Grade 12 Natural A', '12', 'A'),
(59, 'Grade 12 Natural B', '12', 'B'),
(60, 'Grade 12 Social A', '12', 'A'),
(61, 'Grade 12 Social B', '12', 'B'),
(62, 'Grade 9 A', '9', 'A'),
(63, 'Grade 9 B', '9', 'B'),
(64, 'Grade 10 A', '10', 'A'),
(65, 'Grade 10 B', '10', 'B'),
(66, 'Grade 11 Natural A', '11', 'A'),
(67, 'Grade 11 Natural B', '11', 'B'),
(68, 'Grade 11 Social A', '11', 'A'),
(69, 'Grade 11 Social B', '11', 'B'),
(70, 'Grade 12 Natural A', '12', 'A'),
(71, 'Grade 12 Natural B', '12', 'B'),
(72, 'Grade 12 Social A', '12', 'A'),
(73, 'Grade 12 Social B', '12', 'B'),
(74, 'Grade 9 A', '9', 'A'),
(75, 'Grade 9 B', '9', 'B'),
(76, 'Grade 10 A', '10', 'A'),
(77, 'Grade 10 B', '10', 'B'),
(78, 'Grade 11 Natural A', '11', 'A'),
(79, 'Grade 11 Natural B', '11', 'B'),
(80, 'Grade 11 Social A', '11', 'A'),
(81, 'Grade 11 Social B', '11', 'B'),
(82, 'Grade 12 Natural A', '12', 'A'),
(83, 'Grade 12 Natural B', '12', 'B'),
(84, 'Grade 12 Social A', '12', 'A'),
(85, 'Grade 12 Social B', '12', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `class_enrollments`
--

CREATE TABLE `class_enrollments` (
  `id` int(11) NOT NULL,
  `student_username` varchar(50) NOT NULL,
  `class_id` int(11) NOT NULL,
  `enrollment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_enrollments`
--

INSERT INTO `class_enrollments` (`id`, `student_username`, `class_id`, `enrollment_date`) VALUES
(1, 'std001', 1, '2026-05-19'),
(2, 'std002', 1, '2026-05-20'),
(3, 'std003', 2, '2026-05-20'),
(4, 'std004', 2, '2026-05-20'),
(5, 'std005', 3, '2026-05-20'),
(6, 'std006', 3, '2026-05-20'),
(7, 'std007', 4, '2026-05-20'),
(8, 'std008', 4, '2026-05-20'),
(9, 'std009', 5, '2026-05-20'),
(10, 'std010', 5, '2026-05-20'),
(11, 'std011', 6, '2026-05-20'),
(12, 'std012', 6, '2026-05-20'),
(13, 'std013', 7, '2026-05-20'),
(14, 'std014', 7, '2026-05-20'),
(15, 'std015', 8, '2026-05-20'),
(16, 'std016', 9, '2026-05-20'),
(17, 'std017', 10, '2026-05-20'),
(18, 'std018', 11, '2026-05-20'),
(19, 'std019', 12, '2026-05-20'),
(20, 'std020', 12, '2026-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`id`, `username`, `fname`, `lname`) VALUES
(1, 'dir001', 'Director', 'One');

-- --------------------------------------------------------

--
-- Table structure for table `director_announcements`
--

CREATE TABLE `director_announcements` (
  `id` int(11) NOT NULL,
  `director_username` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `send_to` varchar(40) NOT NULL DEFAULT 'all',
  `target_username` varchar(50) DEFAULT NULL,
  `priority` varchar(20) NOT NULL DEFAULT 'normal',
  `attachment_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `student_username` varchar(50) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_username` varchar(50) NOT NULL,
  `term` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `marks` decimal(6,2) NOT NULL DEFAULT 0.00,
  `letter_grade` varchar(3) NOT NULL,
  `entered_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `student_username`, `class_id`, `teacher_username`, `term`, `subject`, `marks`, `letter_grade`, `entered_at`) VALUES
(1, 'std002', 1, 'tch005', 'Semester 1', 'English', 78.00, 'B', '2026-05-20 14:38:02'),
(2, 'std009', 5, 'tch003', 'Semester 1', 'Physics', 91.00, 'A', '2026-05-20 14:38:02'),
(3, 'std013', 7, 'tch004', 'Semester 1', 'History', 88.00, 'A', '2026-05-20 14:38:02'),
(4, 'std016', 9, 'tch001', 'Semester 1', 'Mathematics', 95.00, 'A', '2026-05-20 14:38:02'),
(5, 'std002', 1, 'tch001', 'Term1', 'English', 85.00, 'B', '2026-05-20 14:42:51'),
(7, 'std001', 1, 'tch001', 'Term1', 'English', 100.00, 'A', '2026-05-20 14:42:51');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `teacher_username` varchar(50) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_settings`
--

CREATE TABLE `school_settings` (
  `id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_email` varchar(255) DEFAULT NULL,
  `school_phone` varchar(50) DEFAULT NULL,
  `school_address` text DEFAULT NULL,
  `academic_year` varchar(30) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `term1_end` date DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_settings`
--

INSERT INTO `school_settings` (`id`, `school_name`, `school_email`, `school_phone`, `school_address`, `academic_year`, `opening_date`, `term1_end`, `closing_date`, `updated_at`) VALUES
(1, 'BENSE SECONDARY HIGH SCHOOL', '', '', '', '', NULL, NULL, NULL, '2026-05-19 20:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `grade_level` varchar(20) DEFAULT NULL,
  `stream` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `parent_name` varchar(120) DEFAULT NULL,
  `parent_phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `username`, `fname`, `mname`, `lname`, `date_of_birth`, `age`, `sex`, `grade_level`, `stream`, `address`, `parent_name`, `parent_phone`) VALUES
(1, 'std001', 'Student', '', 'One', NULL, 0, '', '9', 'A', '', '', ''),
(2, 'std891', 'tarko', 'melke', 'bante', '2012-12-31', 23, 'Male', '9', 'natural', '', 'fikir', '0909500401'),
(3, 'std002', 'Mahi', NULL, 'Ali', NULL, NULL, 'Female', '9', NULL, NULL, 'Ali Musa', '0911000002'),
(4, 'std003', 'Samuel', NULL, 'Birhanu', NULL, NULL, 'Male', '9', NULL, NULL, 'Birhanu Desta', '0911000003'),
(5, 'std004', 'Ruth', NULL, 'Daniel', NULL, NULL, 'Female', '9', NULL, NULL, 'Daniel Tesfaye', '0911000004'),
(6, 'std005', 'Natnael', NULL, 'Eshetu', NULL, NULL, 'Male', '10', NULL, NULL, 'Eshetu Gemechu', '0911000005'),
(7, 'std006', 'Hana', NULL, 'Fikru', NULL, NULL, 'Female', '10', NULL, NULL, 'Fikru Alemu', '0911000006'),
(8, 'std007', 'Yonas', NULL, 'Girma', NULL, NULL, 'Male', '10', NULL, NULL, 'Girma Bekele', '0911000007'),
(9, 'std008', 'Bethel', NULL, 'Haile', NULL, NULL, 'Female', '10', NULL, NULL, 'Haile Worku', '0911000008'),
(10, 'std009', 'Kalkidan', NULL, 'Issac', NULL, NULL, 'Female', '11', 'Natural', NULL, 'Issac John', '0911000009'),
(11, 'std010', 'Robel', NULL, 'Jemal', NULL, NULL, 'Male', '11', 'Natural', NULL, 'Jemal Ahmed', '0911000010'),
(12, 'std011', 'Meron', NULL, 'Kebede', NULL, NULL, 'Female', '11', 'Natural', NULL, 'Kebede Mulu', '0911000011'),
(13, 'std012', 'Henok', NULL, 'Lemma', NULL, NULL, 'Male', '11', 'Natural', NULL, 'Lemma Bekele', '0911000012'),
(14, 'std013', 'Meklit', NULL, 'Mohammed', NULL, NULL, 'Female', '11', 'Social', NULL, 'Mohammed Ali', '0911000013'),
(15, 'std014', 'Nahom', NULL, 'Nega', NULL, NULL, 'Male', '11', 'Social', NULL, 'Nega Tadesse', '0911000014'),
(16, 'std015', 'Rahel', NULL, 'Oumer', NULL, NULL, 'Female', '11', 'Social', NULL, 'Oumer Idris', '0911000015'),
(17, 'std016', 'Bereket', NULL, 'Paulos', NULL, NULL, 'Male', '12', 'Natural', NULL, 'Paulos Gebre', '0911000016'),
(18, 'std017', 'Saron', NULL, 'Qeneni', NULL, NULL, 'Female', '12', 'Natural', NULL, 'Qeneni Tolcha', '0911000017'),
(19, 'std018', 'Tewodros', NULL, 'Reta', NULL, NULL, 'Male', '12', 'Social', NULL, 'Reta Kassa', '0911000018'),
(20, 'std019', 'Selam', NULL, 'Sileshi', NULL, NULL, 'Female', '12', 'Social', NULL, 'Sileshi Abate', '0911000019'),
(21, 'std020', 'Yared', NULL, 'Tesfaye', NULL, NULL, 'Male', '12', 'Social', NULL, 'Tesfaye Alem', '0911000020');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`) VALUES
(3, 'Biology'),
(62, 'Chemistry'),
(67, 'Civics'),
(65, 'Economics'),
(2, 'English'),
(64, 'Geography'),
(63, 'History'),
(66, 'ICT'),
(1, 'Mathematics'),
(61, 'Physics');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `office_room` varchar(50) DEFAULT NULL,
  `office_phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `username`, `fname`, `mname`, `lname`, `department`, `subject`, `date_of_birth`, `age`, `sex`, `address`, `office_room`, `office_phone`) VALUES
(1, 'tch001', 'Teacher', NULL, 'One', 'Academics', 'Mathematics', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'tch003', 'Mr', 'kasowmer', 'Mandefro', 'Mathematics', 'DSA', '2010-03-22', 32, 'Male', 'daye', '', ''),
(3, 'tch002', 'Sara', NULL, 'Mekonen', 'Science', 'Biology', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'tch004', 'Marta', NULL, 'Ali', 'Social', 'History', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'tch005', 'Samuel', NULL, 'Bekele', 'Language', 'English', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','teacher','admin','director') NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `status`, `last_login`, `created_at`) VALUES
(1, 'std001', 'student1@school.test', '1234', 'student', 'active', '2026-05-20 15:04:12', '2026-05-19 20:32:31'),
(2, 'tch001', 'teacher1@school.test', '1234', 'teacher', 'active', '2026-05-20 15:01:37', '2026-05-19 20:32:31'),
(3, 'adm001', 'admin1@school.test', '1234', 'admin', 'active', '2026-05-20 14:56:43', '2026-05-19 20:32:31'),
(4, 'dir001', 'director1@school.test', '1234', 'director', 'active', NULL, '2026-05-19 20:32:31'),
(5, 'tch003', 'kasowmer2016@gmail.com', '1234', 'teacher', 'active', '2026-05-20 14:19:54', '2026-05-20 14:00:58'),
(6, 'std891', 'tarko@gmail.com', '6JESA', 'student', 'active', NULL, '2026-05-20 14:19:35'),
(11, 'tch002', 't2@school.com', '1234', 'teacher', 'active', NULL, '2026-05-20 14:38:02'),
(12, 'tch004', 't4@school.com', '1234', 'teacher', 'active', NULL, '2026-05-20 14:38:02'),
(13, 'tch005', 't5@school.com', '1234', 'teacher', 'active', NULL, '2026-05-20 14:38:02'),
(15, 'std002', 's2@school.com', '1234', 'student', 'active', '2026-05-20 14:43:08', '2026-05-20 14:38:02'),
(16, 'std003', 's3@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(17, 'std004', 's4@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(18, 'std005', 's5@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(19, 'std006', 's6@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(20, 'std007', 's7@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(21, 'std008', 's8@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(22, 'std009', 's9@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(23, 'std010', 's10@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(24, 'std011', 's11@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(25, 'std012', 's12@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(26, 'std013', 's13@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(27, 'std014', 's14@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(28, 'std015', 's15@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(29, 'std016', 's16@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(30, 'std017', 's17@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(31, 'std018', 's18@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(32, 'std019', 's19@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02'),
(33, 'std020', 's20@school.com', '1234', 'student', 'active', NULL, '2026-05-20 14:38:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_teachers`
--
ALTER TABLE `assigned_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_enrollments`
--
ALTER TABLE `class_enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `director_announcements`
--
ALTER TABLE `director_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_grade` (`student_username`,`class_id`,`term`,`subject`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_settings`
--
ALTER TABLE `school_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_name` (`subject_name`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `assigned_teachers`
--
ALTER TABLE `assigned_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `class_enrollments`
--
ALTER TABLE `class_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `director_announcements`
--
ALTER TABLE `director_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `directors`
--
ALTER TABLE `directors`
  ADD CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;


