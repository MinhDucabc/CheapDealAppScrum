<?php
// Include database configuration
include './Include/database.php';

// Include model files
include './models/Customer.php';

// Instantiate customer model
$customer = new Customer($pdo);

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    ob_start();
    include './templates/register.html.php';
    $page_content = ob_get_clean();
    include './layout-mobile.html.php';
    exit;
}

// Define required fields, including new credit_card and terms
$required = ['name', 'email', 'password', 'confirm_password', 'phone', 'address', 'credit_card', 'terms'];
foreach ($required as $field) {
    if (empty($_POST[$field])) {
        $error = "All fields are required, including agreeing to the terms.";
        ob_start();
        include './templates/register.html.php';
        $page_content = ob_get_clean();
        include './layout-mobile.html.php';
        exit;
    }
}

// Sanitize and validate inputs
$customer->Name = filter_var(trim($_POST['name']), FILTER_SANITIZE_STRING);
$customer->Email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];
$customer->PhoneNumber = filter_var(trim($_POST['phone']), FILTER_SANITIZE_STRING);
$customer->Address = filter_var(trim($_POST['address']), FILTER_SANITIZE_STRING);
$credit_card = filter_var(trim($_POST['credit_card']), FILTER_SANITIZE_STRING);
$terms = $_POST['terms'];

// Validate password match
if ($password !== $confirm_password) {
    $error = "Passwords do not match.";
    ob_start();
    include './templates/register.html.php';
    $page_content = ob_get_clean();
    include './layout-mobile.html.php';
    exit;
}

// Validate password strength
if (strlen($password) < 8 || !preg_match("/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/", $password)) {
    $error = "Password must be at least 8 characters and contain both letters and numbers.";
    ob_start();
    include './templates/register.html.php';
    $page_content = ob_get_clean();
    include './layout-mobile.html.php';
    exit;
}

// Validate email existence
if ($customer->emailExists()) {
    $error = "Email already registered.";
    ob_start();
    include './templates/register.html.php';
    $page_content = ob_get_clean();
    include './layout-mobile.html.php';
    exit;
}

// Basic credit card validation (example: check format)
if (!preg_match("/^\d{16}$/", $credit_card)) {
    $error = "Invalid credit card number. Must be 16 digits.";
    ob_start();
    include './templates/register.html.php';
    $page_content = ob_get_clean();
    include './layout-mobile.html.php';
    exit;
}

// Ensure terms are agreed to
if ($terms !== 'on') {
    $error = "You must agree to the Terms of Service and Privacy Policy.";
    ob_start();
    include './templates/register.html.php';
    $page_content = ob_get_clean();
    include './layout-mobile.html.php';
    exit;
}

// Assign password
$customer->Password = $password;
// Optionally store credit_card securely (e.g., encrypted, or integrate with a payment processor)
// $customer->CreditCard = encrypt($credit_card); // Example; implement proper encryption

// Attempt to create customer
if ($customer->create()) {
    header("Location: login.php?success=Registration successful");
    exit;
}

$error = "Registration failed. Please try again.";
ob_start();
include './templates/register.html.php';
$page_content = ob_get_clean();
include './layout-mobile.html.php';
exit;
?>