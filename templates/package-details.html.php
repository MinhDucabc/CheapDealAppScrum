<?php
// templates/package-details.html.php

// Determine the header gradient and title based on package type
$headerGradient = 'gradient-purple'; // Default for Mobile
$headerTitle = 'Mobile Package'; // Default title

if ($package->Type === 'Broadband') {
    $headerGradient = 'gradient-blue'; // Blue gradient for Broadband
    $headerTitle = 'Broadband Package';
} elseif ($package->Type === 'Tablet') {
    $headerGradient = 'gradient-green'; // Green gradient for Tablet
    $headerTitle = 'Tablet Package';
}
?>

<div class="p-4">
    <!-- Header with Gradient -->
    <div class="<?= htmlspecialchars($headerGradient) ?> text-white p-4 rounded-t-lg">
        <div class="flex justify-between items-center">
            <a href="homepages.php">
                <i class="fas fa-arrow-left text-white"></i>
            </a>
            <h1 class="text-xl font-bold"><?= htmlspecialchars($headerTitle) ?></h1>
            <i class="fas fa-share-alt text-white"></i>
        </div>
    </div>

    <!-- Package Details -->
    <div class="bg-white p-4 rounded-b-lg shadow-md">
        <!-- Full-Width Image -->
        <?php if (!empty($package->img)): ?>
            <img src="<?= htmlspecialchars($package->img) ?>" alt="<?= htmlspecialchars($package->PackageName) ?>" class="w-full h-48 object-cover rounded-t-lg">
        <?php endif; ?>

        <!-- Package Name and Description -->
        <h2 class="text-lg font-semibold text-gray-800 mt-2"><?= htmlspecialchars($package->PackageName) ?></h2>
        <p class="text-sm text-gray-500 mt-1"><?= htmlspecialchars($package->Description) ?: 'No description available.' ?></p>

        <!-- Pricing -->
        <div class="flex justify-between items-center mt-4">
            <div>
                <p class="text-sm text-gray-500 line-through">STANDARD PRICE<br>£<?= number_format($package->old_price, 2) ?>/mo</p>
            </div>
            <div class="text-right">
                <p class="text-sm text-gray-500">App Price (15% off)</p>
                <p class="text-xl font-bold text-blue-600">£<?= number_format($package->Price, 2) ?>/mo</p>
            </div>
        </div>

        <!-- Core Features (Data, Minutes, Texts for Mobile; Speed for Broadband; Brand for Tablet) -->
        <?php if ($package->Type === 'Mobile'): ?>
            <div class="mt-4">
                <h3 class="text-sm font-semibold text-gray-700">Package Includes</h3>
                <div class="grid grid-cols-3 gap-2 mt-2">
                    <div class="bg-blue-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">DATA</p>
                        <p class="text-base font-semibold"><?= in_array('Unlimited Data', $features) ? 'Unlimited' : htmlspecialchars($package->FreeGB) . 'GB' ?></p>
                    </div>
                    <div class="bg-red-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">MINUTES</p>
                        <p class="text-base font-semibold"><?= in_array('Unlimited Minutes', $features) ? 'Unlimited' : htmlspecialchars($package->FreeMinutes) ?></p>
                    </div>
                    <div class="bg-green-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">TEXTS</p>
                        <p class="text-base font-semibold"><?= in_array('Unlimited Texts', $features) ? 'Unlimited' : htmlspecialchars($package->FreeSMS) ?></p>
                    </div>
                </div>
            </div>
        <?php elseif ($package->Type === 'Broadband'): ?>
            <div class="mt-4">
                <h3 class="text-sm font-semibold text-gray-700">Package Includes</h3>
                <div class="grid grid-cols-3 gap-2 mt-2">
                    <div class="bg-blue-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">DOWNLOAD SPEED</p>
                        <p class="text-base font-semibold"><?= htmlspecialchars($package->DownloadSpeed) ?>Mbps</p>
                    </div>
                    <div class="bg-green-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">UPLOAD SPEED</p>
                        <p class="text-base font-semibold"><?= htmlspecialchars($package->UploadSpeed) ?>Mbps</p>
                    </div>
                    <div class="bg-red-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">DATA</p>
                        <p class="text-base font-semibold"><?= in_array('Unlimited Data', $features) ? 'Unlimited' : 'Limited' ?></p>
                    </div>
                </div>
            </div>
        <?php elseif ($package->Type === 'Tablet'): ?>
            <div class="mt-4">
                <h3 class="text-sm font-semibold text-gray-700">Package Includes</h3>
                <div class="grid grid-cols-2 gap-2 mt-2">
                    <div class="bg-blue-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">BRAND</p>
                        <p class="text-base font-semibold"><?= htmlspecialchars($package->Brand) ?></p>
                    </div>
                    <div class="bg-green-50 p-2 rounded-lg text-center">
                        <p class="text-sm text-gray-600">RATING</p>
                        <p class="text-base font-semibold"><?= htmlspecialchars($package->Rating) ?>/5</p>
                    </div>
                </div>
            </div>
        <?php endif; ?>

        <!-- Additional Features -->
        <div class="mt-4">
            <h3 class="text-sm font-semibold text-gray-700">Features</h3>
            <ul class="mt-2 space-y-2">
                <?php foreach ($features as $feature): ?>
                    <?php if (!in_array($feature, ['Unlimited Data', 'Unlimited Minutes', 'Unlimited Texts'])): ?>
                        <li class="flex items-center">
                            <i class="fas fa-check-circle text-blue-500 mr-2"></i>
                            <span class="text-sm text-gray-600"><?= htmlspecialchars($feature) ?></span>
                        </li>
                    <?php endif; ?>
                <?php endforeach; ?>
                <!-- Static features from the image -->
                <li class="flex items-center">
                    <i class="fas fa-star text-yellow-500 mr-2"></i>
                    <span class="text-sm text-gray-600">Priority Customer Support</span>
                </li>
                <li class="flex items-center">
                    <i class="fas fa-shield-alt text-green-500 mr-2"></i>
                    <span class="text-sm text-gray-600">30-Day Satisfaction Guarantee</span>
                </li>
            </ul>
        </div>

        <!-- Terms & Conditions -->
        <div class="mt-4">
            <h3 class="text-sm font-semibold text-gray-700">Terms & Conditions</h3>
            <p class="text-sm text-gray-500 mt-2">
                <?= htmlspecialchars($package->Contract) ?>, £<?= number_format($package->UpfrontCost, 2) ?> upfront. Early termination fees apply. Fair usage policy applies to unlimited plans. See full terms on our website.
            </p>
        </div>

        <!-- Customize Contract -->
        <div class="mt-4">
            <h3 class="text-sm font-semibold text-gray-700">Customize</h3>
            <div class="mt-2 p-3 bg-gray-100 rounded-lg">
                <div class="flex items-center">
                    <i class="fas fa-info-circle text-blue-500 mr-2"></i>
                    <span class="text-sm text-gray-600"><?= htmlspecialchars($package->Contract) ?>, £<?= number_format($package->UpfrontCost, 2) ?> upfront.</span>
                </div>
            </div>
        </div>

        <!-- Add to Cart -->
        <div class="mt-4 flex justify-between items-center">
            <p class="text-xl font-bold text-blue-600">£<?= number_format($package->Price, 2) ?>/mo</p>
            <?php if ($alreadyInCart): ?>
                <button class="bg-gray-400 text-white px-4 py-2 rounded-lg cursor-not-allowed" disabled>Package type added</button>
            <?php else: ?>
                <a href="cart.php?action=add&id=<?= $package->PackageID ?>" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Add to Cart</a>
            <?php endif; ?>
        </div>
    </div>
</div>