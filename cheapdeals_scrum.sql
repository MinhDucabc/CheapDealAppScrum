-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 06, 2025 lúc 09:55 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cheapdeals_scrum`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auditlog`
--

CREATE TABLE `auditlog` (
  `LogID` int(11) NOT NULL,
  `EntityAffected` enum('Order','Payment','Customer','Subscription','Enquiry','CSR') NOT NULL,
  `EntityID` int(11) NOT NULL,
  `Action` enum('Create','Update','Delete') NOT NULL,
  `PerformedBy` int(11) NOT NULL,
  `Timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `broadband_features`
--

CREATE TABLE `broadband_features` (
  `FeatureID` int(11) NOT NULL,
  `PackageID` int(11) DEFAULT NULL,
  `Feature` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `broadband_features`
--

INSERT INTO `broadband_features` (`FeatureID`, `PackageID`, `Feature`) VALUES
(104, 2, 'No Installation Fee'),
(105, 2, 'WiFi Router Included');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `csr`
--

CREATE TABLE `csr` (
  `CSRID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `CreditCardInfo` varchar(255) DEFAULT NULL,
  `RegistrationDate` datetime DEFAULT current_timestamp(),
  `avt_img` varchar(255) DEFAULT NULL,
  `csv` varchar(255) DEFAULT NULL,
  `Balance` decimal(10,2) DEFAULT 0.00,
  `PaymentMethod` varchar(50) DEFAULT 'CreditCard',
  `role` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`CustomerID`, `Name`, `Email`, `Password`, `Address`, `PhoneNumber`, `CreditCardInfo`, `RegistrationDate`, `avt_img`, `csv`, `Balance`, `PaymentMethod`, `role`) VALUES
(1, 'John Updated', 'updated@example.com', 'alice1234', '456 New Road', '0987654321', '5555555555554444', '2023-01-15 00:00:00', NULL, NULL, 0.00, 'CreditCard', 1),
(2, 'Bob Smith', 'bob.smith@example.com', 'bobsecure!', '456 Oak Ave, CA', '555-5678', '5500000000000004', '2023-02-10 00:00:00', NULL, NULL, 0.00, 'CreditCard', 1),
(3, 'Charlie Brown', 'charlie.b@example.com', 'charlie@2023', '789 Pine Rd, TX', '555-9012', '340000000000009', '2023-03-05 00:00:00', NULL, NULL, 0.00, 'CreditCard', 1),
(4, 'Diana Prince', 'diana.p@example.com', 'wonder123', '321 Elm St, WA', '555-3456', '6011000000000004', '2023-04-12 00:00:00', NULL, NULL, 0.00, 'CreditCard', 1),
(5, 'Ethan Hunt', 'ethan.hunt@example.com', 'impossible1', '987 Mission Blvd, FL', '555-7890', '3530111333300000', '2023-05-20 00:00:00', NULL, NULL, 0.00, 'CreditCard', 1),
(9, 'John Doe', 'john@example.com', '$2y$10$JAHfBfUTAiDqQl.5ofQReermgGQyXMwBQ9Co.G6TPXot6AL4EODBq', '123 Main St', '0123456789', '4111111111111111', '2025-04-11 15:44:09', NULL, NULL, 0.00, 'CreditCard', 1),
(18, 'Cao Minh Duc', 'duccmgch230132@fpt.edu.vn', '$2y$10$YZnkdWcIuqeJRU9PN3CHmuaEJnOwQ84zPCHPLxFbpewQRjPEB45GW', '2 P. Phạm Văn Bạch, Dịch Vọng, Cầu Giấy, Hà Nội 100000', '0886647720', '1234567890123455', '2025-04-21 15:43:25', '', '421', 0.00, 'CreditCard', 1),
(19, 'abcdef', 'abcdef@gmail.com', '$2y$10$CHy5FMSM4riA2YFA.DJ.RuYxcRFhpvHtuswMjFs27TgaIfDggrmdi', '2 P. Phạm Văn Bạch, Dịch Vọng, Cầu Giấy, Hà Nội 100000', '123456789', '1234567890123456', '2025-04-21 16:02:39', '', '421', 0.00, 'CreditCard', 1),
(20, 'abcd', 'abcd@gmail.com', '$2y$10$s0EGa7.zWDlVdEs3VXYMEO1Z5FoqC4O3deaTMO.tCWBXagtKPMycG', '2 P. Phạm Văn Bạch, Dịch Vọng, Cầu Giấy, Hà Nội 100000', '0886647720', '1234567890123456', '2025-04-22 12:41:48', '', '421', 0.00, 'CreditCard', 2),
(21, 'mrCrow', 'mrCrow@gmail.com', '$2y$10$cccXFg/rRUuLSCGdmOBWAOOAkhR4HkFachzDHcigVdlDntthLcutG', '2 P. Phạm Văn Bạch, Dịch Vọng, Cầu Giấy, Hà Nội 100000', '0123456789', '', '2025-05-06 11:32:05', './image/1746506203_IMG_2114.JPG', '', 0.00, 'CreditCard', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `custom_package`
--

CREATE TABLE `custom_package` (
  `PackageID` int(11) NOT NULL,
  `PackageName` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `FreeMinutes` int(11) DEFAULT NULL,
  `FreeSMS` int(11) DEFAULT NULL,
  `FreeGB` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `Contract` varchar(255) DEFAULT NULL,
  `IsPopular` tinyint(1) DEFAULT NULL,
  `DownloadSpeed` varchar(50) DEFAULT NULL,
  `UploadSpeed` varchar(50) DEFAULT NULL,
  `SetupFee` decimal(10,2) DEFAULT NULL,
  `Brand` varchar(100) DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL,
  `UpfrontCost` decimal(10,2) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `custom_package`
--

INSERT INTO `custom_package` (`PackageID`, `PackageName`, `Description`, `Type`, `Price`, `FreeMinutes`, `FreeSMS`, `FreeGB`, `old_price`, `Contract`, `IsPopular`, `DownloadSpeed`, `UploadSpeed`, `SetupFee`, `Brand`, `Rating`, `UpfrontCost`, `CustomerID`) VALUES
(28, 'My Custom Package', 'Custom package created by user', 'Mobile', 71.25, 500, 1000, 5.00, 0.00, '12', 0, '0', '0', 0.00, 'TabNet', 0.00, 0.00, 18),
(29, 'My Custom Package', 'Custom package created by user', 'Mobile', 80.75, 100, 1000, 20.00, 0.00, '12', 0, '0', '0', 0.00, 'TabNet', 0.00, 0.00, 19),
(30, 'My Custom Package', 'Custom package created by user', 'Broadband', 29.70, 0, 0, 0.00, 0.00, '24', 0, '50', '40', 0.00, 'TabNet', 0.00, 0.00, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deal`
--

CREATE TABLE `deal` (
  `DealID` int(11) NOT NULL,
  `DealName` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `DiscountPercentage` decimal(5,2) NOT NULL,
  `ValidFrom` date NOT NULL,
  `ValidTo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `deal`
--

INSERT INTO `deal` (`DealID`, `DealName`, `Description`, `DiscountPercentage`, `ValidFrom`, `ValidTo`) VALUES
(1, 'Updated Deal Name', 'Updated Description', 30.00, '2025-04-10', '2025-05-10'),
(3, 'Tablet Deal (Tablet Only)', 'Get bonus data with tablet deals', 10.00, '2025-04-15', '2025-08-15'),
(4, 'Ultimate Combo (Mobile + Broadband + Tablet)', 'Bundle of mobile + broadband + tablet', 25.00, '2025-04-10', '2025-09-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deal_package`
--

CREATE TABLE `deal_package` (
  `DealID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `deal_package`
--

INSERT INTO `deal_package` (`DealID`, `PackageID`) VALUES
(1, 1),
(1, 2),
(1, 5),
(3, 6),
(4, 2),
(4, 4),
(4, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `enquiry`
--

CREATE TABLE `enquiry` (
  `EnquiryID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `PackageID` int(11) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Status` enum('Open','In Progress','Closed') NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `ProcessedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mobile_features`
--

CREATE TABLE `mobile_features` (
  `FeatureID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL,
  `Feature` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `mobile_features`
--

INSERT INTO `mobile_features` (`FeatureID`, `PackageID`, `Feature`) VALUES
(1, 1, '10GB Data'),
(2, 1, 'Unlimited Minutes'),
(3, 1, 'Unlimited Texts'),
(4, 1, '5G Ready'),
(5, 1, 'Free Roaming in EU'),
(6, 1, 'WiFi Calling');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `DealID` int(11) DEFAULT NULL,
  `SpecialOfferID` int(11) DEFAULT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `DiscountApplied` decimal(10,2) DEFAULT 0.00,
  `OrderType` enum('App','Phone','In-Person') NOT NULL,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `Status` enum('Pending','Completed','Canceled') NOT NULL,
  `PaymentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_custom_package`
--

CREATE TABLE `order_custom_package` (
  `OrderID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_package`
--

CREATE TABLE `order_package` (
  `OrderID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `package`
--

CREATE TABLE `package` (
  `PackageID` int(11) NOT NULL,
  `PackageName` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Type` enum('Mobile','Broadband','Tablet','Custom') NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `FreeMinutes` int(11) DEFAULT 0,
  `FreeSMS` int(11) DEFAULT 0,
  `FreeGB` float DEFAULT 0,
  `old_price` int(11) NOT NULL,
  `Contract` varchar(255) DEFAULT NULL,
  `IsPopular` tinyint(1) DEFAULT 0,
  `DownloadSpeed` int(11) DEFAULT NULL,
  `UploadSpeed` int(11) DEFAULT NULL,
  `SetupFee` decimal(10,2) DEFAULT NULL,
  `Brand` varchar(100) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `UpfrontCost` decimal(11,0) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `package`
--

INSERT INTO `package` (`PackageID`, `PackageName`, `Description`, `Type`, `Price`, `FreeMinutes`, `FreeSMS`, `FreeGB`, `old_price`, `Contract`, `IsPopular`, `DownloadSpeed`, `UploadSpeed`, `SetupFee`, `Brand`, `Rating`, `UpfrontCost`, `img`) VALUES
(1, 'Mobile Max 30 - Device + Data', 'Includes a device with unlimited calls, texts, and 20GB data', 'Mobile', 30.00, 1000, 500, 20, 40, '12 months', 1, 50, 20, 10.00, 'Generic Mobile Co.', 4.2, 0, 'image/Mobile-Max30.png'),
(2, 'Broadband Home 50 - Full Setup', 'Complete home internet setup with 200GB data and free installation', 'Broadband', 50.00, 0, 0, 200, 60, '18 months', 1, 100, 40, 0.00, 'FastNet', 4.6, 0, NULL),
(4, 'Mobile Lite 10 - Basic Device Plan', 'Affordable plan with basic phone and 2GB data', 'Mobile', 10.00, 300, 100, 2, 15, '12 months', 0, 10, 5, 0.00, 'LiteMobile', 3.8, 0, 'image/samsung-galaxy-note-10-lite-trang-new-600x600-600x600.jpg'),
(5, 'Tablet Basic 5GB - Entry Plan', 'Includes tablet device with 5GB monthly data limit', 'Tablet', 15.00, 100, 50, 5, 20, '6 months', 0, 20, 10, 0.00, 'TabNet', 4, 0, 'image/61a6xcDsyGL._AC_SL1500_.jpg'),
(6, 'Tablet Max 50GB - Power Bundle', 'Tablet included with 50GB of fast data per month', 'Tablet', 40.00, 500, 100, 50, 55, '12 months', 1, 100, 40, 5.00, 'TabNet Pro', 4.5, 0, 'image/images.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentDate` datetime DEFAULT current_timestamp(),
  `Status` enum('Success','Failed','Pending') NOT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `special_offer`
--

CREATE TABLE `special_offer` (
  `SpecialOfferID` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `DiscountPercentage` decimal(5,2) NOT NULL,
  `ExpiryDate` date NOT NULL,
  `Conditions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `special_offer`
--

INSERT INTO `special_offer` (`SpecialOfferID`, `Description`, `DiscountPercentage`, `ExpiryDate`, `Conditions`) VALUES
(7, 'Updated offer: 18% off broadband', 18.00, '2025-05-20', 'Applies to premium plans only'),
(8, 'Weekend Flash Discount', 5.00, '2025-04-14', 'Only valid on purchases made over the weekend.'),
(9, 'Loyalty Appreciation Deal', 20.00, '2025-05-10', 'Applicable to returning customers with 2+ orders.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `special_order`
--

CREATE TABLE `special_order` (
  `SpecialOrderID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `SpecialInstructions` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscription`
--

CREATE TABLE `subscription` (
  `SubscriptionID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `RenewalStatus` enum('Active','Canceled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tablet_features`
--

CREATE TABLE `tablet_features` (
  `PackageID` int(11) NOT NULL,
  `FeatureID` int(11) NOT NULL,
  `Feature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tablet_features`
--

INSERT INTO `tablet_features` (`PackageID`, `FeatureID`, `Feature`) VALUES
(5, 1, '5GB Data'),
(5, 2, 'Basic Streaming Support'),
(5, 3, 'WiFi Only Access'),
(6, 4, '50GB High-Speed Data'),
(6, 5, 'HD Streaming Support'),
(6, 6, '4G LTE Enabled'),
(6, 7, 'WiFi + Cellular Access');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `usage_data`
--

CREATE TABLE `usage_data` (
  `UsageID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Month` date NOT NULL,
  `Minutes` int(11) DEFAULT 0,
  `SMS` int(11) DEFAULT 0,
  `DataGB` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auditlog`
--
ALTER TABLE `auditlog`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `fk_auditlog_csr` (`PerformedBy`);

--
-- Chỉ mục cho bảng `broadband_features`
--
ALTER TABLE `broadband_features`
  ADD PRIMARY KEY (`FeatureID`),
  ADD KEY `PackageID` (`PackageID`);

--
-- Chỉ mục cho bảng `csr`
--
ALTER TABLE `csr`
  ADD PRIMARY KEY (`CSRID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Chỉ mục cho bảng `custom_package`
--
ALTER TABLE `custom_package`
  ADD PRIMARY KEY (`PackageID`),
  ADD KEY `fk_customer_package` (`CustomerID`);

--
-- Chỉ mục cho bảng `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`DealID`);

--
-- Chỉ mục cho bảng `deal_package`
--
ALTER TABLE `deal_package`
  ADD PRIMARY KEY (`DealID`,`PackageID`),
  ADD KEY `PackageID` (`PackageID`);

--
-- Chỉ mục cho bảng `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`EnquiryID`),
  ADD KEY `fk_enquiry_customer` (`CustomerID`),
  ADD KEY `fk_enquiry_package` (`PackageID`),
  ADD KEY `fk_enquiry_csr` (`ProcessedBy`);

--
-- Chỉ mục cho bảng `mobile_features`
--
ALTER TABLE `mobile_features`
  ADD PRIMARY KEY (`FeatureID`),
  ADD KEY `fk_mobilefeatures_package` (`PackageID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fk_order_customer` (`CustomerID`),
  ADD KEY `fk_order_payment` (`PaymentID`),
  ADD KEY `fk_orders_special_offer` (`SpecialOfferID`),
  ADD KEY `fk_order_deal` (`DealID`);

--
-- Chỉ mục cho bảng `order_custom_package`
--
ALTER TABLE `order_custom_package`
  ADD PRIMARY KEY (`OrderID`,`PackageID`),
  ADD KEY `PackageID` (`PackageID`);

--
-- Chỉ mục cho bảng `order_package`
--
ALTER TABLE `order_package`
  ADD PRIMARY KEY (`OrderID`,`PackageID`),
  ADD KEY `fk_order_package_package` (`PackageID`);

--
-- Chỉ mục cho bảng `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`PackageID`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `fk_payment_customer` (`CustomerID`);

--
-- Chỉ mục cho bảng `special_offer`
--
ALTER TABLE `special_offer`
  ADD PRIMARY KEY (`SpecialOfferID`);

--
-- Chỉ mục cho bảng `special_order`
--
ALTER TABLE `special_order`
  ADD PRIMARY KEY (`SpecialOrderID`),
  ADD KEY `fk_specialorder_order` (`OrderID`),
  ADD KEY `fk_specialorder_customer` (`CustomerID`);

--
-- Chỉ mục cho bảng `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`SubscriptionID`),
  ADD KEY `fk_subscription_customer` (`CustomerID`),
  ADD KEY `fk_subscription_package` (`PackageID`);

--
-- Chỉ mục cho bảng `tablet_features`
--
ALTER TABLE `tablet_features`
  ADD PRIMARY KEY (`FeatureID`),
  ADD KEY `fk_tabletspecs_package` (`PackageID`);

--
-- Chỉ mục cho bảng `usage_data`
--
ALTER TABLE `usage_data`
  ADD PRIMARY KEY (`UsageID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auditlog`
--
ALTER TABLE `auditlog`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `broadband_features`
--
ALTER TABLE `broadband_features`
  MODIFY `FeatureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT cho bảng `csr`
--
ALTER TABLE `csr`
  MODIFY `CSRID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `custom_package`
--
ALTER TABLE `custom_package`
  MODIFY `PackageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `deal`
--
ALTER TABLE `deal`
  MODIFY `DealID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT cho bảng `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `EnquiryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `mobile_features`
--
ALTER TABLE `mobile_features`
  MODIFY `FeatureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT cho bảng `package`
--
ALTER TABLE `package`
  MODIFY `PackageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `special_offer`
--
ALTER TABLE `special_offer`
  MODIFY `SpecialOfferID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `special_order`
--
ALTER TABLE `special_order`
  MODIFY `SpecialOrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `subscription`
--
ALTER TABLE `subscription`
  MODIFY `SubscriptionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tablet_features`
--
ALTER TABLE `tablet_features`
  MODIFY `FeatureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `usage_data`
--
ALTER TABLE `usage_data`
  MODIFY `UsageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auditlog`
--
ALTER TABLE `auditlog`
  ADD CONSTRAINT `fk_auditlog_csr` FOREIGN KEY (`PerformedBy`) REFERENCES `csr` (`CSRID`),
  ADD CONSTRAINT `fk_auditlog_customer` FOREIGN KEY (`PerformedBy`) REFERENCES `customer` (`CustomerID`);

--
-- Các ràng buộc cho bảng `broadband_features`
--
ALTER TABLE `broadband_features`
  ADD CONSTRAINT `broadband_features_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`);

--
-- Các ràng buộc cho bảng `csr`
--
ALTER TABLE `csr`
  ADD CONSTRAINT `fk_csr_customer` FOREIGN KEY (`CSRID`) REFERENCES `customer` (`CustomerID`);

--
-- Các ràng buộc cho bảng `custom_package`
--
ALTER TABLE `custom_package`
  ADD CONSTRAINT `fk_customer_package` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `deal_package`
--
ALTER TABLE `deal_package`
  ADD CONSTRAINT `deal_package_ibfk_1` FOREIGN KEY (`DealID`) REFERENCES `deal` (`DealID`) ON DELETE CASCADE,
  ADD CONSTRAINT `deal_package_ibfk_2` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `enquiry`
--
ALTER TABLE `enquiry`
  ADD CONSTRAINT `fk_enquiry_csr` FOREIGN KEY (`ProcessedBy`) REFERENCES `csr` (`CSRID`),
  ADD CONSTRAINT `fk_enquiry_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_enquiry_package` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`);

--
-- Các ràng buộc cho bảng `mobile_features`
--
ALTER TABLE `mobile_features`
  ADD CONSTRAINT `fk_mobilefeatures_package` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_order_deal` FOREIGN KEY (`DealID`) REFERENCES `deal` (`DealID`),
  ADD CONSTRAINT `fk_order_offer` FOREIGN KEY (`SpecialOfferID`) REFERENCES `special_offer` (`SpecialOfferID`),
  ADD CONSTRAINT `fk_order_payment` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_orders_special_offer` FOREIGN KEY (`SpecialOfferID`) REFERENCES `special_offer` (`SpecialOfferID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_custom_package`
--
ALTER TABLE `order_custom_package`
  ADD CONSTRAINT `order_custom_package_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`DealID`),
  ADD CONSTRAINT `order_custom_package_ibfk_2` FOREIGN KEY (`PackageID`) REFERENCES `custom_package` (`PackageID`);

--
-- Các ràng buộc cho bảng `order_package`
--
ALTER TABLE `order_package`
  ADD CONSTRAINT `fk_order_package_order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`DealID`),
  ADD CONSTRAINT `fk_order_package_package` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`);

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `special_order`
--
ALTER TABLE `special_order`
  ADD CONSTRAINT `fk_specialorder_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_specialorder_order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

--
-- Các ràng buộc cho bảng `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `fk_subscription_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_subscription_package` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`);

--
-- Các ràng buộc cho bảng `tablet_features`
--
ALTER TABLE `tablet_features`
  ADD CONSTRAINT `fk_tabletspecs_package` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tablet_features_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`);

--
-- Các ràng buộc cho bảng `usage_data`
--
ALTER TABLE `usage_data`
  ADD CONSTRAINT `usage_data_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
