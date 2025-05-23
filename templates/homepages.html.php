<!-- bg-gray-800 text-white -->
<header class="bg-gray-800 text-white py-4 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <div class="flex items-center">
            <a href="profile.php" class="mr-2">
                <img src="<?php echo htmlspecialchars($customer->avt_img ?: './image/default-avatar.png'); ?>" alt="Profile Picture" class="w-10 h-10 rounded-full mb-2">
            </a>
            <h1 class="text-xl font-bold">CheapDeals</h1>
        </div>
        <div class="flex items-center">
            <a href="cart.php" class="mr-4"><i class="fas fa-shopping-cart"></i></a>
            <a href="./csr_management.php" class="focus:outline-none"><i class="fas fa-bars"></i></a>
        </div>
    </div>
    <div class="container mx-auto mt-4">
        <form class="relative" action="search.php" method="get">
            <input type="text" name="query" placeholder="Search packages and deals..." class="w-full p-2 pl-10 rounded-lg bg-gray-700 text-white">
            <button type="submit" class="absolute left-3 top-3 text-gray-400">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>
</header>

<!-- Main Promotion Banner -->
<section class="gradient-blue text-white p-6">
    <div class="container mx-auto">
        <h2 class="text-2xl font-bold">15% OFF</h2>
        <p class="mb-4">All packages when ordered through the app</p>
        <a href="#packages" class="bg-white text-blue-700 px-6 py-2 rounded-lg font-medium inline-block">Shop Now</a>
    </div>
</section>

<!-- Package Categories -->
<section class="py-4 bg-white">
    <div class="container mx-auto flex justify-around">
        <a href="mobile.php" class="flex flex-col items-center">
            <div class="bg-blue-100 rounded-full w-16 h-16 flex items-center justify-center mb-2">
                <i class="fas fa-mobile-alt text-blue-500 text-xl"></i>
            </div>
            <span>Mobile</span>
        </a>
        <a href="broadband.php" class="flex flex-col items-center">
            <div class="bg-green-100 rounded-full w-16 h-16 flex items-center justify-center mb-2">
                <i class="fas fa-wifi text-green-500 text-xl"></i>
            </div>
            <span>Broadband</span>
        </a>
        <a href="tablet.php" class="flex flex-col items-center">
            <div class="bg-yellow-100 rounded-full w-16 h-16 flex items-center justify-center mb-2">
                <i class="fas fa-tablet-alt text-yellow-500 text-xl"></i>
            </div>
            <span>Tablet</span>
        </a>
        <a href="bill.php" class="flex flex-col items-center">
            <div class="bg-red-100 rounded-full w-16 h-16 flex items-center justify-center mb-2">
                <i class="fas fa-file-invoice text-red-500 text-xl"></i>
            </div>
            <span>Pay Bill</span>
        </a>
    </div>
</section>

<!-- Special Offers -->
<section class="py-6">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-bold">Special Offers</h2>
            <a href="offers.php" class="text-blue-600">View All</a>
        </div>
        
        <!-- Double Package Deal -->
        <?php while ($row = $deal_stmt->fetch(PDO::FETCH_ASSOC)): ?>
        <?php
            $discount = $row['DiscountPercentage'];
            $name = htmlspecialchars($row['DealName']);
            $desc = htmlspecialchars($row['Description']);
            $deal_id = $row['DealID'];
        ?>
        <a href="deal-details.php?deal_id=<?= $deal_id ?>" class="block">
            <div class="bg-white rounded-lg shadow-md mb-4 flex overflow-hidden hover:shadow-lg transition-shadow">
                <div class="gradient-blue text-white p-4 flex flex-col justify-center items-center w-24">
                    <div class="text-2xl font-bold"><?= $discount ?>%</div>
                    <div class="text-sm">OFF</div>
                </div>
                <div class="p-4 flex-1">
                    <h3 class="font-bold"><?= $name ?></h3>
                    <p class="text-gray-600 text-sm"><?= $desc ?></p>
                    <span class="text-blue-600 text-sm">View Details</span>
                </div>
            </div>
        </a>
        <?php endwhile; ?>
    </div>
</section>

<!-- Popular Packages -->
<section id="packages" class="py-6 bg-white">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-bold">Popular Packages</h2>
            <a href="packages.php" class="text-blue-600">View All</a>
        </div>

        <?php
        $package_stmt->execute();
        $hasPopular = false;
        while ($row = $package_stmt->fetch(PDO::FETCH_ASSOC)) {
            if (!$row['IsPopular']) continue;

            $hasPopular = true;
            $id = htmlspecialchars($row['PackageID']);
            $name = htmlspecialchars($row['PackageName']);
            $desc = htmlspecialchars($row['Description']);
            $price = number_format($row['Price'], 2);
            $rating = $row['Rating'];
            $type = strtolower($row['Type']);

            // Icon logic
            $icon = 'fa-box';
            $bgColor = 'bg-gray-200';
            $textColor = 'text-gray-600';

            if ($type === 'mobile') {
                $icon = 'fa-mobile-alt';
                $bgColor = 'bg-blue-100';
                $textColor = 'text-blue-500';
            } elseif ($type === 'broadband') {
                $icon = 'fa-wifi';
                $bgColor = 'bg-green-100';
                $textColor = 'text-green-500';
            } elseif ($type === 'tablet') {
                $icon = 'fa-tablet-alt';
                $bgColor = 'bg-purple-100';
                $textColor = 'text-purple-500';
            }
        ?>
            <a href="package-details.php?id=<?= $id ?>" class="block bg-white rounded-lg shadow-md mb-4 p-4">
                <div class="flex justify-between items-center">
                    <div class="flex items-center">
                        <div class="<?= $bgColor ?> rounded-full w-24 h-14 flex items-center justify-center mr-4">
                            <i class="fas <?= $icon ?> <?= $textColor ?> text-2xl"></i>
                        </div>
                        <div>
                            <h3 class="font-bold"><?= $name ?></h3>
                            <div class="flex text-yellow-400">
                                <?php for ($i = 0; $i < 5; $i++): ?>
                                    <?php if ($i < floor($rating)): ?>
                                        <i class="fas fa-star"></i>
                                    <?php else: ?>
                                        <i class="far fa-star"></i>
                                    <?php endif; ?>
                                <?php endfor; ?>
                            </div>
                            <p class="text-gray-600 text-sm"><?= $desc ?></p>
                        </div>
                    </div>
                    <div class="text-right">
                        <p class="text-lg font-bold text-blue-600">£<?= $price ?></p>
                        <i class="fas fa-chevron-right text-gray-400"></i>
                    </div>
                </div>
            </a>
        <?php } ?>

        <?php if (!$hasPopular): ?>
            <p class="text-gray-500">No popular packages available at the moment.</p>
        <?php endif; ?>
    </div>
</section>


<!-- Account Section -->
<section class="py-6 bg-white">
    <div class="container mx-auto px-4">
        <h2 class="text-xl font-bold mb-4">My Account</h2>
        
        <a href="account-usage.php" class="block border-b border-gray-200 py-3 flex justify-between items-center">
            <span>Current Usage</span>
            <div class="flex items-center">
                <span class="text-gray-600 mr-2">3.2GB / 5GB</span>
                <i class="fas fa-chevron-right text-gray-400"></i>
            </div>
        </a>
        
        <a href="account-bill.php" class="block border-b border-gray-200 py-3 flex justify-between items-center">
            <span>Current Bill</span>
            <div class="flex items-center">
                <span class="text-gray-600 mr-2">£34.99 due</span>
                <i class="fas fa-chevron-right text-gray-400"></i>
            </div>
        </a>
        
        <a href="account-settings.php" class="block py-3 flex justify-between items-center">
            <span>Account Settings</span>
            <i class="fas fa-chevron-right text-gray-400"></i>
        </a>
    </div>
</section>
