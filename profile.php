<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['customer_id'])) {
    header("Location: ./authentication/login.php");
    exit();
}

// Include database configuration
include './Include/database.php';

// Include Customer model
include './models/Customer.php';

// Instantiate Customer model
$customer = new Customer($pdo);
$customer->CustomerID = $_SESSION['customer_id'];
$customer->readOne();

// Initialize error and success variables
$error = null;
$success = null;

// Handle profile update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_profile'])) {
    // Sanitize inputs
    $customer->Name = filter_var(trim($_POST['name']), FILTER_SANITIZE_STRING);
    $customer->Email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
    $customer->Address = filter_var(trim($_POST['address']), FILTER_SANITIZE_STRING);
    $customer->PhoneNumber = filter_var(trim($_POST['phone']), FILTER_SANITIZE_STRING);
    $credit_card = filter_var(trim($_POST['credit_card']), FILTER_SANITIZE_STRING);
    $csv = filter_var(trim($_POST['csv']), FILTER_SANITIZE_STRING);

    // Validate inputs
    if (empty($customer->Name) || empty($customer->Email) || empty($customer->Address) || empty($customer->PhoneNumber)) {
        $error = "All fields are required.";
    } elseif (!filter_var($customer->Email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format.";
    } elseif ($credit_card && !preg_match("/^\d{16}$/", $credit_card)) {
        $error = "Invalid credit card number. Must be 16 digits.";
    } elseif ($csv && !preg_match("/^\d{3,4}$/", $csv)) {
        $error = "Invalid CSV. Must be 3 or 4 digits.";
    }

    // Handle profile picture upload
    if (isset($_FILES['avt_img']) && $_FILES['avt_img']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = './image/';
        // Ensure upload directory exists and is writable
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0755, true);
        }

        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        $max_size = 2 * 1024 * 1024; // 2MB
        $file_type = mime_content_type($_FILES['avt_img']['tmp_name']);
        $file_size = $_FILES['avt_img']['size'];
        $file_name = basename($_FILES['avt_img']['name']);
        $target_file = $upload_dir . time() . '_' . $file_name;

        if (!in_array($file_type, $allowed_types)) {
            $error = "Only JPEG, PNG, or GIF images are allowed.";
        } elseif ($file_size > $max_size) {
            $error = "Image size must be less than 2MB.";
        } elseif (!move_uploaded_file($_FILES['avt_img']['tmp_name'], $target_file)) {
            $error = "Failed to upload profile picture.";
        } else {
            $customer->avt_img = $target_file;
        }
    }

    // Update credit card and CSV only if provided
    if ($credit_card && !$error) {
        $customer->CreditCardInfo = $credit_card; // Ideally, encrypt or use a payment processor
    }
    if ($csv && !$error) {
        $customer->csv = $csv; // Ideally, encrypt
    }

    // Update the customer profile
    if (!isset($error) && $customer->update()) {
        $success = "Profile updated successfully!";
        $customer->readOne(); // Refresh customer data
    } else {
        $error = isset($error) ? $error : "Failed to update profile.";
    }
}

// Handle password change
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['change_password'])) {
    $newPassword = $_POST['new_password'];
    $confirmPassword = $_POST['confirm_password'];

    // Validate passwords
    if (empty($newPassword) || empty($confirmPassword)) {
        $error = "Please fill in both password fields.";
    } elseif ($newPassword !== $confirmPassword) {
        $error = "Passwords do not match.";
    } elseif (strlen($newPassword) < 8 || !preg_match("/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/", $newPassword)) {
        $error = "Password must be at least 8 characters and contain both letters and numbers.";
    } else {
        // Attempt to change password
        if ($customer->changePassword($newPassword)) {
            $success = "Password changed successfully!";
        } else {
            $error = "Failed to change password.";
        }
    }
}

// Start output buffering and include the template
ob_start();
include './templates/profile.html.php';
$page_content = ob_get_clean();

// Render it inside the layout
include './layout-mobile.html.php';
?>