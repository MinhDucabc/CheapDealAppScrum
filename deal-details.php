<?php
session_start();

include './Include/database.php';
include './models/Deal.php';
include './models/Package.php';

$dealModel = new Deal($pdo);
$packageModel = new Package($pdo);

$deal_id = isset($_GET['deal_id']) ? (int)$_GET['deal_id'] : 0;


// Fetch deal details
$dealModel->DealID = $deal_id;
$dealModel->readOne();



// Fetch packages for the deal
$deal_packages_stmt = $dealModel->getDealPackages();
$deal_packages = $deal_packages_stmt->fetchAll(PDO::FETCH_ASSOC);

// Calculate total with discount
$total = 0;
foreach ($deal_packages as $package) {
    $total += $package['Price'];
}

$discount_percentage = $dealModel->DiscountPercentage;
$discounted_total = $total * (1 - $discount_percentage / 100);

// Load the template
ob_start();
include './templates/deal-details.html.php';
$page_content = ob_get_clean();
include './layout-mobile.html.php';
?>